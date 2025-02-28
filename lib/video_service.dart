import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class VideoService{
  static Future<File> getVideoFile(String videoName) async {
    final String video = "video${DateTime.now()}.mp4";
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    return File("${documentsDirectory.path}/$video");
  }

  static Future<Directory> get tempDirectory async {
    return await getTemporaryDirectory();
  }

  static Future<String> filePath(String pathName) async {
    return join((await tempDirectory).path, pathName);
  }
}