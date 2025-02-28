import 'package:flutter/material.dart';
import 'package:reel_making_app/main.dart';
import 'package:reel_making_app/model/template.dart';
import 'package:reel_making_app/screen/TemplateEditorScreen.dart';
import 'package:reel_making_app/screen/creation_screen.dart';
import 'package:reel_making_app/widgets/VideoPlayerWidget.dart';

final List<Template> templates = [
  Template(
    templateUrl: "https://reelmaker.app/example-reel-1.mp4",
    thumbnail: "",
    audio: "https://tmpfiles.org/dl/18938880/reelaudio-91161.mp3",
    media: [
      Media(duration: 10.0),
      Media(duration: 1.5),
      Media(duration: 2.0),
      Media(duration: 2.5),
    ],
  ),
  Template(
    templateUrl: "https://reelmaker.app/example-reel-2.mp4",
    thumbnail: "",
    audio: "https://tmpfiles.org/dl/18938880/reelaudio-91161.mp3",
    media: [
      Media(duration: 0.8),
      Media(duration: 1.2),
      Media(duration: 1.8),
      Media(duration: 2.3),
    ],
  ),
  Template(
    templateUrl: "https://reelmaker.app/example-reel-3.mp4",
    thumbnail: "",
    audio: "https://tmpfiles.org/dl/18938880/reelaudio-91161.mp3",
    media: [
      Media(duration: 1.4),
      Media(duration: 1.9),
      Media(duration: 2.4),
      Media(duration: 3.0),
    ],
  ),
  Template(
    templateUrl: "https://reelmaker.app/example-reel-4.mp4",
    thumbnail: "",
    audio: "https://tmpfiles.org/dl/18938880/reelaudio-91161.mp3",
    media: [
      Media(duration: 1.1),
      Media(duration: 1.6),
      Media(duration: 2.2),
      Media(duration: 2.8),
    ],
  ),
];

class TemplateGridScreen extends StatelessWidget {
  const TemplateGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Templates"),
      actions: [
        ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreationScreen(),));
        }, child: const Icon(Icons.create_new_folder))
      ],),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 9 / 16,
        ),
        itemCount: templates.length,
        itemBuilder: (context, index) {
          final template = templates[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TemplateEditorScreen(template: template,),));
            },
            child: VideoPlayerWidget(videoUrl: template.templateUrl),
          );
        },
      ),
    );
  }
}
