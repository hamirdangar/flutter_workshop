import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class HostImageController extends GetxController {
  var isLoading = false.obs;
  var uploadedImageUrl = ''.obs;

  Future<void> hostImageUint8List(Uint8List drawingImage) async {
    isLoading.value = true;
    uploadedImageUrl.value = '';
    _showLoadingDialog();
    try {
      var request = http.MultipartRequest('POST', Uri.parse('https://tmpfiles.org/api/v1/upload'));
      request.files.add(http.MultipartFile.fromBytes('file', drawingImage, filename: 'drawing_image.png'));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(await response.stream.bytesToString());
        print(jsonResponse);
        var url = jsonResponse['data']['url'];
        List<String> parts = url.split('/');
        String firstPart = parts[3];
        String secondPart = parts[4];
        print("First Part: $firstPart");
        print("Second Part: $secondPart");
        String imageUrl = "https://tmpfiles.org/dl/$firstPart/$secondPart";
        print('mack hug $imageUrl');
        uploadedImageUrl.value = imageUrl;
      } else {
        print(response.reasonPhrase);
        uploadedImageUrl.value = '';
      }
    } catch (e) {
      print("An error occurred: $e");
      uploadedImageUrl.value = '';
    } finally {
      isLoading.value = false;
      Get.back(); // Close the loading dialog
    }
  }

  Future<void> hostImageFilePath(String filePath,bool isShowLoading) async {
    isLoading.value = true;
    if(isShowLoading)_showLoadingDialog();
    try {
      var request = http.MultipartRequest('POST', Uri.parse('https://tmpfiles.org/api/v1/upload'));
      request.files.add(await http.MultipartFile.fromPath('file',filePath,filename:path.basename(filePath)));
      http.StreamedResponse response = await request.send().timeout(Duration(seconds: 240));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(await response.stream.bytesToString());
        print(jsonResponse);
        var url = jsonResponse['data']['url'];
        List<String> parts = url.split('/');
        String firstPart = parts[3];
        String secondPart = parts[4];
        String imageUrl = "https://tmpfiles.org/dl/$firstPart/$secondPart";
        uploadedImageUrl.value = imageUrl;

      } else {
        print(response.reasonPhrase);
        uploadedImageUrl.value = '';
      }
    } catch (e) {
      print("An error occurred: $e");
      uploadedImageUrl.value = '';
    } finally {
      isLoading.value = false;
      if(isShowLoading)Get.back();
    }
  }

  void _showLoadingDialog() {
    Get.dialog(
      const Center(child: CupertinoActivityIndicator(color: Color(0xff29F39F),)),
      barrierDismissible: false,
    );
  }
}


