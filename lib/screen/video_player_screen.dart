import 'dart:io';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;

  const VideoPlayerScreen({Key? key, required this.videoPath}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _isLoading = true;
  double _currentPosition = 0;
  double duration = 0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        setState(() {
          duration = _controller.value.duration.inSeconds.toDouble();
          _isLoading = false;
        });
      })
      ..addListener(() {
        setState(() {
          _currentPosition = _controller.value.position.inSeconds.toDouble();
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
    });
  }

  Future<void> _saveVideo(String videoPath) async {
    SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black);
    SVProgressHUD.show(status: 'downloading...');
    final appDir = await getApplicationDocumentsDirectory();
    final appVideoPath = '${appDir.path}/creation';
    final fileName = videoPath.split('/').last;

    // Create a "saved_videos" folder if it doesn't exist
    final savedVideosDir = Directory(appVideoPath);
    if (!await savedVideosDir.exists()) {
      await savedVideosDir.create(recursive: true);
    }

    // Copy video to the application's directory
    final File sourceFile = File(videoPath);
    final File destinationFile = File('$appVideoPath/$fileName');
    await sourceFile.copy(destinationFile.path);
    final result = await ImageGallerySaverPlus.saveFile(videoPath);
    if (result is Map && result['isSuccess'] == true) {
      SVProgressHUD.dismiss();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Video saved to gallery!')),
      );
    } else {
      SVProgressHUD.dismiss();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to save video to gallery.')),
      );
    }
  }


  Future<void> _saveVideoWithoutAudio() async {
    final tempDir = await getTemporaryDirectory();
    final outputPath = '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}_output.mp4';
    try {
      final ffmpegCommand = '-i "${widget.videoPath}" -an "$outputPath"';
      SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black);
      SVProgressHUD.showProgress(0.0, status: 'Processing 0%');

      await FFmpegKit.executeAsync(ffmpegCommand, (session) async {
        final returnCode = await session.getReturnCode();

        if (ReturnCode.isSuccess(returnCode)) {
          print("Video created successfully. Video path: $outputPath");
          SVProgressHUD.dismiss();
          await _saveVideo(outputPath);
        } else {
          print("FFmpeg process failed with returnCode $returnCode");
          SVProgressHUD.dismiss();
        }
      }, (log) {
        print("FFmpeg log: ${log.getMessage()}");
      }, (statistics) {
        final progress = statistics.getTime() / ((duration++) * 1000);
        SVProgressHUD.showProgress(progress, status: 'Processing ${(progress * 100).toStringAsFixed(0)}%');
      });
    } on Exception catch (e) {
      print('faild to save audio $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('==================================================$duration');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: _isLoading
                  ? const Center(child: CupertinoActivityIndicator())
                  : AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ),
            const SizedBox(height: 16),
            Slider(
              value: _currentPosition,
              min: 0,
              max: _controller.value.duration.inSeconds.toDouble(),
              onChanged: (value) {
                setState(() {
                  _controller.seekTo(Duration(seconds: value.toInt()));
                });
              },
            ),
            ElevatedButton(
              onPressed: () => _saveVideo(widget.videoPath),
              child: const Text('Save video'),
            ),
            ElevatedButton(
              onPressed: _saveVideoWithoutAudio,
              child: const Text('Save video without audio'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _togglePlayPause,
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 32,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _controller.seekTo(Duration.zero);
                  },
                  icon: const Icon(
                    Icons.replay,
                    size: 32,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
