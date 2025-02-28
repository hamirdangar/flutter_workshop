class Template {
  final String templateUrl;
  final String thumbnail;
  final String audio;
  final List<Media> media;

  Template({
    required this.templateUrl,
    required this.thumbnail,
    required this.audio,
    required this.media,
  });

  factory Template.fromJson(Map<String, dynamic> json) {
    return Template(
      templateUrl: json['template_url'],
      thumbnail: json['thumbnail'],
      audio: json['audio'],
      media: (json['media'] as List<dynamic>)
          .map((mediaItem) => Media.fromJson(mediaItem))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'template_url': templateUrl,
      'thumbnail': thumbnail,
      'audio': audio,
      'media': media.map((m) => m.toJson()).toList(),
    };
  }
}

class Media {
  final double duration;

  Media({required this.duration});

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(duration: json['duration'].toDouble());
  }

  Map<String, dynamic> toJson() {
    return {
      'duration': duration,
    };
  }
}

  class FileMedia{
    String filePath;
    double duration;
    String thumbnail;

    FileMedia({
      required this.filePath,
      required this.duration,
      required this.thumbnail,
    });
  }


// enum MediaType {image,video}
//
// class Media {
//   final MediaType mediaType;
//    String filePath;
//    String thumbnail;
//    double duration;
//
//   Media({
//     required this.mediaType,
//     required this.filePath,
//     required this.thumbnail,
//     required this.duration,
//   });
//
//   factory Media.fromJson(Map<String, dynamic> json) {
//     return Media(
//       mediaType: json['media_type'] == 'image' ? MediaType.image : MediaType.video,
//       filePath: json['file_path'] ?? '',
//       thumbnail: json['thumbnail'] ?? '',
//       duration: (json['duration'] ?? 0.0).toDouble(),
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     'media_type': mediaType.toString().split('.').last,
//     'file_path': filePath,
//     'thumbnail': thumbnail,
//     'duration': duration,
//   };
// }

