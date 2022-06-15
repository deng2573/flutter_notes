// import 'package:http_parser/http_parser.dart';

// class FileAsset {
//   List<int> data;
//   String extension;

//   FileAsset(this.data, this.extension);
// }

// class UploadFile {
//   String fileId;
//   String filePath;
//   String fileKey;

//   UploadFile();

//   factory UploadFile.fromJson(Map<String, dynamic> json) {
//     return UploadFile()
//       ..fileId = json['fileId'] as String
//       ..filePath = json['filePath'] as String
//       ..fileKey = json['fileKey'] as String;
//   }

//   Map<String, dynamic> toJson() {
//     return <String, dynamic>{
//       'fileId': this.fileId,
//       'filePath': this.filePath,
//       'fileKey': this.fileKey,
//     };
//   }
// }

// extension FileType on String {
//   MediaType? get mediaType {
//     switch (toLowerCase()) {
//       case '.jpg':
//       case '.jpeg':
//       case '.jpe':
//         return MediaType('image', 'jpeg');
//       case '.png':
//         return MediaType('image', 'png');
//       case '.bmp':
//         return MediaType('image', 'bmp');
//       case '.gif':
//         return MediaType('image', 'gif');
//       case '.json':
//         return MediaType('application', 'json');
//       case '.svg':
//       case '.svgz':
//         return MediaType('image', 'svg+xml');
//       case '.mp3':
//         return MediaType('audio', 'mpeg');
//       case '.mp4':
//         return MediaType('video', 'mp4');
//       case '.mov':
//         return MediaType('video', 'mov');
//       case '.htm':
//       case '.html':
//         return MediaType('text', 'html');
//       case '.css':
//         return MediaType('text', 'css');
//       case '.csv':
//         return MediaType('text', 'csv');
//       case '.txt':
//       case '.text':
//       case '.conf':
//       case '.def':
//       case '.log':
//       case '.in':
//         return MediaType('text', 'plain');
//     }
//     return null;
//   }
// }
