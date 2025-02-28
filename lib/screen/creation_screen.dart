import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reel_making_app/screen/video_player_screen.dart';

class CreationScreen extends StatefulWidget {
  const CreationScreen({super.key});

  @override
  State<CreationScreen> createState() => _CreationScreenState();
}

class _CreationScreenState extends State<CreationScreen> {
  final RxList<Map<String, dynamic>> creation = <Map<String, dynamic>>[].obs;

  @override
  void initState() {
    super.initState();
    getCreation();
  }

  Future<void> getCreation() async {
    final directory = await getApplicationDocumentsDirectory();
    final folderPath = '${directory.path}/creation';
    final folder = Directory(folderPath);

    if (await folder.exists()) {
      final files = await _getFilesInFolder(folder);

      final List<Map<String, dynamic>> mediaItems = [];
      for (final file in files) {
        mediaItems.add({'file': file, 'thumbnail': []});
      }
      mediaItems.sort((a, b) {
        return b['file']
            .lastModifiedSync()
            .compareTo(a['file'].lastModifiedSync());
      });
      creation.assignAll(mediaItems);
    }
  }


  Future<List<File>> _getFilesInFolder(Directory directory) async {
    final List<File> files = [];
    final list = directory.list();

    await for (final entity in list) {
      if (entity is File && _isMediaFile(entity)) {
        files.add(entity);
      } else if (entity is Directory) {
        final subdirectoryFiles = await _getFilesInFolder(entity);
        files.addAll(subdirectoryFiles);
      }
    }

    return files;
  }

  bool _isMediaFile(File file) {
    final extensions = ['.jpg', '.jpeg', '.png', '.gif', '.mp4'];
    final extension = file.path.toLowerCase();
    return extensions.any((ext) => extension.endsWith(ext));
  }

  bool _isImageFile(File file) {
    final extensions = ['.jpg', '.jpeg', '.png', '.gif'];
    final extension = file.path.toLowerCase();
    return extensions.any((ext) => extension.endsWith(ext));
  }

  bool _isVideoFile(File file) {
    final extensions = ['.mp4'];
    final extension = file.path.toLowerCase();
    return extensions.any((ext) => extension.endsWith(ext));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Creations'),
      ),
      body: Obx(() {
        if (creation.isEmpty) {
          return const Center(child: Text('No media found'));
        }

        return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 9/16
          ),
          itemCount: creation.length,
          itemBuilder: (context, index) {
            final media = creation[index];
            final file = media['file'] as File;
            return GestureDetector(
              onTap: () {
                Get.to(() => VideoPlayerScreen(videoPath: file.path));
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Center(child: Icon(Icons.video_call))
              ),
            );
          },
        );
      }),
    );
  }
}
