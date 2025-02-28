import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class AudioService {
  static Future<File?> downloadAudioFile(String audioUrl) async {
    if (audioUrl.isEmpty) {
      print("No audio URL provided.");
      return null;
    }
    try {
      final response = await http.get(Uri.parse(audioUrl));
      if (response.statusCode == 200) {
        final tempDir = await getTemporaryDirectory();
        final filePath = '${tempDir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.mp3';
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        print("Audio downloaded to: $filePath");
        return file;
      } else {
        print("Failed to download audio. Status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error downloading audio file: $e");
      return null;
    }
  }
}
