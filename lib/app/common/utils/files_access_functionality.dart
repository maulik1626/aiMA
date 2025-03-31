// import 'dart:io';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:nb_utils/nb_utils.dart';
//
// class FilesAccessFunctionality {
//   static Future<File?> pickFile() async {
//     // Pick a file using FilePicker
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf', 'jpg', 'png'],
//     );
//     if (result != null) {
//       PlatformFile file = result.files.first;
//
//       // Log file details
//       log("file.name: ${file.name}");
//       log("file.bytes: ${file.bytes}");
//       log("file.size: ${file.size}");
//       log("file.extension: ${file.extension}");
//       log("file.path: ${file.path}");
//
//       // Convert PlatformFile to File
//       return File(file.path!);
//     } else {
//       toast("No file selected");
//       return null;
//     }
//   }
//
//   static String convertFileSizeToKB(int bytes) {
//     double result = bytes / 1024;
//     return result.toStringAsFixed(2);
//   }
// }