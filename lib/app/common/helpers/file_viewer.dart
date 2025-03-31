// import 'package:aima/app/common/theme/palette.dart';
// import 'package:aima/app/common/utils/common_base.dart';
// import 'package:aima/app/routes/arguments/file_viewer_screen_arguments/file_viewer_screen_arguments.dart';
// import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
// import 'package:flutter/material.dart';
// import 'package:photo_view/photo_view.dart';
//
// class FileViewerScreen extends StatefulWidget {
//   final String filePath;
//
//   // final bool isNetworkFile;
//   final FileType fileType;
//
//   const FileViewerScreen({
//     super.key,
//     required this.filePath,
//     // required this.isNetworkFile,
//     required this.fileType,
//   });
//
//   @override
//   State<FileViewerScreen> createState() => _FileViewerScreenState();
// }
//
// class _FileViewerScreenState extends State<FileViewerScreen> {
//   late PDFDocument document;
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     getPDFDocument();
//   }
//
//   void getPDFDocument() async {
//     if (widget.fileType == FileType.PDF) {
//       try {
//         document = await PDFDocument.fromURL(widget.filePath);
//         setState(() {
//           isLoading = false;
//         });
//       } catch (e) {
//         // Handle loading error
//         setState(() {
//           isLoading = false;
//         });
//       }
//     } else {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Palette.kNeutral,
//       appBar: _buildAppBar(),
//       body: _buildBody(),
//     );
//   }
//
//   AppBar _buildAppBar() {
//     return AppBar(
//       backgroundColor: Palette.kNeutral,
//       leading: const BackButton(
//         color: Palette.kBlack,
//       ),
//       title: Text(
//         'View File',
//         style: appBarTextStyle(
//           color: Palette.kBlack,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildBody() {
//     if (isLoading) {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     }
//
//     if (widget.fileType == FileType.PDF) {
//       return buildPdfViewer();
//     } else {
//       return buildNetworkImage();
//     }
//   }
//
//   Widget buildNetworkImage() {
//     return PhotoView(
//       imageProvider: NetworkImage(widget.filePath),
//       minScale: PhotoViewComputedScale.contained,
//     );
//   }
//
//   Widget buildPdfViewer() {
//     return PDFViewer(
//       document: document,
//       backgroundColor: Palette.kNeutral,
//       showNavigation: false,
//       showPicker: false,
//       scrollDirection: Axis.vertical,
//     );
//   }
// }
