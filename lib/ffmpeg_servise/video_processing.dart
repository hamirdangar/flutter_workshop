import 'dart:io';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:reel_making_app/getx_controller/video_processing_controller.dart';
import 'package:reel_making_app/model/template.dart';



class VideoProcessingService {
  static final VideoProcessingController _controller = Get.find<VideoProcessingController>();

  static Future<String?> createVideoWithoutTransition({
    required List<FileMedia> fileMedia,
    required File? downloadedAudioFile,
    required Function(String) onSuccess,
    required Function onFailed,
  }) async {
    final tempDir = await getApplicationDocumentsDirectory();
    final processId = DateTime.now().millisecondsSinceEpoch.toString();
    final outputPath = '${tempDir.path}/output_$processId.mp4';

    try {
      final validFileMedia = fileMedia.where((media) => media.filePath.isNotEmpty).toList();

      if (validFileMedia.isEmpty) {
        Fluttertoast.showToast(msg: "No valid media to create a video.");
        return null;
      }

      if (downloadedAudioFile == null) {
        Fluttertoast.showToast(msg: "Audio file not found.");
        return null;
      }

      int frameRate = 60;
      String inputs = '';
      String filterComplex = '';
      String concatFilter = '';
      double totalDuration = 0;

      // Initialize progress HUD
      SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black);
      SVProgressHUD.showProgress(0.0, status: 'Processing 0%');

      for (int i = 0; i < validFileMedia.length; i++) {
        final mediaModel = validFileMedia[i];
        String input = mediaModel.filePath;

        if (input.isEmpty || !File(input).existsSync()) {
          print("Skipping invalid or empty file path at index $i: $input");
          continue;
        }

        totalDuration += mediaModel.duration;

        bool isVideo = input.toLowerCase().endsWith('.mp4') ||
            input.toLowerCase().endsWith('.mov') ||
            input.toLowerCase().endsWith('.avi');

        if (isVideo) {
          inputs += '-t ${mediaModel.duration} -i "$input" ';
        } else {
          inputs += '-loop 1 -t ${mediaModel.duration} -i "$input" ';
        }

        filterComplex +=
        "[$i:v]scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,setsar=1:1[v$i];";
        concatFilter += "[v$i]";
      }

      filterComplex +=
      "${concatFilter}concat=n=${validFileMedia.length}:v=1:a=0[outv]";
      inputs += '-stream_loop -1 -i "${downloadedAudioFile.path}" ';

      final command = [
        '-y',
        ...inputs.split(' '),
        '-filter_complex',
        filterComplex,
        '-map',
        '[outv]',
        '-map',
        '${validFileMedia.length}:a',
        '-r',
        '$frameRate',
        '-b:v',
        '8000k',
        '-pix_fmt',
        'yuv420p',
        '-t',
        '$totalDuration',
        outputPath
      ];

      print('Full command: $command');

      // Add process to the map
      _controller.addProcess(processId, 'Processing');

      await FFmpegKit.executeAsync(command.join(' '), (session) async {
        final returnCode = await session.getReturnCode();

        if (ReturnCode.isSuccess(returnCode)) {
          print("Video created successfully. Video path: $outputPath");
          SVProgressHUD.dismiss();
          _controller.updateProcess(processId, 'Completed');
          onSuccess(outputPath);
        } else {
          print("FFmpeg process failed with returnCode $returnCode");
          SVProgressHUD.dismiss();
          _controller.updateProcess(processId, 'Failed');
          onFailed();
        }
        _controller.removeProcess(processId);
      }, (log) {
        print("FFmpeg log: ${log.getMessage()}");
      }, (statistics) {
        final progress = statistics.getTime() / (totalDuration * 1000);
        SVProgressHUD.showProgress(progress, status: 'Processing ${(progress * 100).toStringAsFixed(0)}%');
      });

      return outputPath;
    } catch (e, stackTrace) {
      print("An error occurred: $e");
      print("StackTrace: $stackTrace");
      Fluttertoast.showToast(msg: "An error occurred while processing the video.");
      SVProgressHUD.dismiss();
      _controller.updateProcess(processId, 'Failed');
      _controller.removeProcess(processId);
      onFailed();
      return null;
    }
  }
}
