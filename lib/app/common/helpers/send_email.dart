// // ignore_for_file: use_build_context_synchronously
//
// import 'package:flutter/material.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
// import 'package:nb_utils/nb_utils.dart';
//
// Future<void> sendEmail({
//   required String body,
//   required String subject,
//   required List<String> recipients,
//   List<String>? attachmentPaths,
//   required BuildContext context,
//   bool isHTML = false,
// }) async {
//   final Email email = Email(
//     body: body,
//     subject: subject,
//     recipients: recipients,
//     attachmentPaths: attachmentPaths,
//     isHTML: isHTML,
//   );
//
//   String platformResponse;
//
//   try {
//     await FlutterEmailSender.send(email);
//     platformResponse = 'success';
//   } catch (error) {
//     log(error.toString());
//     platformResponse = error.toString();
//     toast(platformResponse);
//   }
// }
