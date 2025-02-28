import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reel_making_app/getx_controller/video_processing_controller.dart';

class ProcessListScreen extends StatelessWidget {
  final VideoProcessingController _controller = Get.find<VideoProcessingController>();

  ProcessListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Processing')),
      body: Obx(() {
        final processMap = _controller.processMap;

        if (processMap.isEmpty) {
          return const Center(child: Text('No active processes.'));
        }

        return ListView.builder(
          itemCount: processMap.length,
          itemBuilder: (context, index) {
            final processId = processMap.keys.elementAt(index);
            final status = processMap[processId];

            return ListTile(
              title: Text('Process ID: $processId'),
              subtitle: Text('Status: $status'),
            );
          },
        );
      }),
    );
  }
}
