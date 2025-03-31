import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<File> getImageFileFromNetwork({required String url}) async {
  final response = await http.get(Uri.parse(url));
  final documentDirectory = await getApplicationDocumentsDirectory();
  final file = File(join(documentDirectory.path, 'picture.png'));
  file.writeAsBytesSync(response.bodyBytes);
  return file;
}
