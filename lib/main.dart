import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reel_making_app/getx_controller/video_processing_controller.dart';
import 'package:reel_making_app/screen/TemplateSelectionScreen.dart';

void main() {
  Get.put(VideoProcessingController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const VideoConcatPage(),
      home: const TemplateGridScreen(),
    );
  }
}




