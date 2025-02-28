import 'package:get/get.dart';

class VideoProcessingController extends GetxController {
  final RxMap<String, String> processMap = <String, String>{}.obs;

  void addProcess(String processId, String status) {
    processMap[processId] = status;
  }

  void updateProcess(String processId, String status) {
    if (processMap.containsKey(processId)) {
      processMap[processId] = status;
    }
  }

  void removeProcess(String processId) {
    processMap.remove(processId);
  }
}
