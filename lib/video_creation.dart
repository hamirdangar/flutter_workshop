import 'dart:typed_data';
import 'dart:io';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class VideoCreatorScreen extends StatefulWidget {
  const VideoCreatorScreen({super.key});

  @override
  _VideoCreatorScreenState createState() => _VideoCreatorScreenState();
}

class _VideoCreatorScreenState extends State<VideoCreatorScreen> {

  VideoPlayerController? _videoPlayerController;



  Future<void> createVideoFromSingleImage(String imagePath, int durationInSeconds, int fps) async {
    try {
      SVProgressHUD.show(status: 'Creating Video...');
      final tempDir = await getApplicationDocumentsDirectory();
      final videoPath = '${tempDir.path}/output_${DateTime.now().millisecondsSinceEpoch}.mp4';

      print('Video will be saved at: $videoPath');

      final ffmpegCommand = [
        '-loop', '1',
        '-i', imagePath,
        '-c:v', 'mpeg4',
        '-t', durationInSeconds.toString(),
        '-pix_fmt', 'yuv420p',
        '-r', '15',
        videoPath,
      ];

      final session = await FFmpegKit.executeWithArguments(ffmpegCommand);
      final returnCode = await session.getReturnCode();

      if (ReturnCode.isSuccess(returnCode)) {
        print('Video created successfully: $videoPath');
        _videoPlayerController = VideoPlayerController.file(File(videoPath))
          ..initialize().then((_) {
            setState(() {});
            _videoPlayerController!.play();
          });

      } else {
        print('Error: Video creation failed. Return code: $returnCode');
        final logs = await session.getLogs();
        for (final log in logs) {
          print(log.getMessage());
        }
      }
    } on Exception catch (e) {
      print('Error: $e');
    } finally {
      SVProgressHUD.dismiss();
    }
  }


  final ImagePicker _picker = ImagePicker();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Video from Images'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final XFile? pickedFile =
                await _picker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  File  selectedImage = File(pickedFile.path);
                  final int fileSize = selectedImage.lengthSync();
                  final double fileSizeInKB = fileSize / 1024;
                  print('========File size================= ${fileSizeInKB.toStringAsFixed(2)} KB');
                  await createVideoFromSingleImage(selectedImage.path,1,15);
                }
              },
              child: const Text('Create Video'),
            ),
            if (_videoPlayerController != null)
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: AspectRatio(
                  aspectRatio: _videoPlayerController!.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController!),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<List<Uint8List>> getSampleImages() async {
    // This function should return a list of Uint8List representing your images.
    // Replace with your actual implementation for fetching images.
    return [];
  }
}
