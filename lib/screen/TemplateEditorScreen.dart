import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reel_making_app/ffmpeg_servise/video_processing.dart';
import 'package:reel_making_app/model/template.dart';
import 'package:reel_making_app/online_service/download_audio.dart';
import 'package:reel_making_app/screen/video_player_screen.dart';
import 'package:reel_making_app/widgets/VideoPlayerWidget.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class TemplateEditorScreen extends StatefulWidget {
  final Template template;

  const TemplateEditorScreen({super.key, required this.template});

  @override
  _TemplateEditorScreenState createState() => _TemplateEditorScreenState();
}

class _TemplateEditorScreenState extends State<TemplateEditorScreen> {
  List<Media> mediaList = [];
  List<FileMedia> fileMedia = [];
  String previasVideoPath = '';
  File? downloadedAudioFile;

  @override
  void initState() {
    super.initState();
    mediaList = widget.template.media;
    downloadAudio();
    fileMedia = mediaList.map((media) {
      return FileMedia(
        filePath: '',
        duration: media.duration,
        thumbnail: '',
      );
    }).toList();
  }

  Future<void> downloadAudio() async {
    downloadedAudioFile = await AudioService.downloadAudioFile(widget.template.audio);
    if (downloadedAudioFile != null) {
      print("Audio file ready at: ${downloadedAudioFile!.path}");
    } else {
      print("Failed to download audio.");
    }
  }

  Future<void> pickImages(int index) async {
    List<int> emptyIndices = fileMedia.asMap().entries.where((entry) => entry.value.thumbnail.isEmpty).map((entry) => entry.key).toList();
    final List<AssetEntity>? assets = await AssetPicker.pickAssets(
      context,
      permissionRequestOption: const PermissionRequestOption(),
      pickerConfig: AssetPickerConfig(
        gridCount: 3,
        pageSize: 120,
        maxAssets: emptyIndices.length,
        requestType: RequestType.all,
        filterOptions: FilterOptionGroup(
          videoOption: const FilterOption(
            durationConstraint: DurationConstraint(max: Duration(minutes: 1)),
          ),
        ),
      ),
    );

    if (assets != null && assets.isNotEmpty) {
      SVProgressHUD.show(status: 'Processing Assets...');
      int currentIndex = 0;
      for (AssetEntity asset in assets) {
        if (currentIndex < emptyIndices.length) {
          final int targetIndex = emptyIndices[currentIndex];
          final filePath = await getFilePathFromAsset(asset);
          if (asset.type == AssetType.image) {
            fileMedia[targetIndex] = FileMedia(
              filePath: filePath,
              duration: fileMedia[targetIndex].duration,
              thumbnail: filePath,
            );
          } else {
            final Uint8List? thumbnailData = await asset.thumbnailDataWithSize(
              const ThumbnailSize(200, 200),
            );
            String thumbnailPath = '';
            if (thumbnailData != null) {
              final tempDir = await getApplicationDocumentsDirectory();
              final thumbnailFile = File('${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}_thumb.jpg',
              );
              await thumbnailFile.writeAsBytes(thumbnailData);
              thumbnailPath = thumbnailFile.path;
            }
            fileMedia[targetIndex] = FileMedia(
              filePath: filePath,
              duration: fileMedia[targetIndex].duration,
              thumbnail: thumbnailPath,
            );
          }
          currentIndex++;
        } else {
          break;
        }
      }
      SVProgressHUD.dismiss();
      setState(() {});
    }
  }

  Future<String> getFilePathFromAsset(AssetEntity asset) async {
    final file = await asset.file;
    return file?.path ?? '';
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Template')),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: VideoPlayerWidget(videoUrl: widget.template.templateUrl),
          ),
          const SizedBox(height: 8),
          Expanded(
            flex: 1,
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              itemCount: widget.template.media.length,
              itemBuilder: (context, index) {
                final media = fileMedia[index];
                return GestureDetector(
                  onTap: () {
                    pickImages(index);
                  },
                  child: Container(
                    width: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: media.filePath.isNotEmpty
                            ? Colors.green
                            : Colors.grey.shade400,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      image: media.thumbnail.isNotEmpty
                          ? DecorationImage(
                        image: FileImage(File(media.thumbnail)),
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          media.duration.toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final outputPath = await VideoProcessingService.createVideoWithoutTransition(
            fileMedia: fileMedia,
            downloadedAudioFile: downloadedAudioFile,
            onSuccess: (value) {
              previasVideoPath = value;
              onSuccess();
            },
            onFailed: () {
              onFailed();
            },
          );
          print('++++++++++++++++');
        },
        child: const Icon(Icons.save),
      ),
    );
  }

  onSuccess(){
    Fluttertoast.showToast(msg: 'onSuccess');
    Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayerScreen(videoPath: previasVideoPath,),),);
  }


  void onFailed() {
    Fluttertoast.showToast(msg: "Video creation failed.");
  }
}
