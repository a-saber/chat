import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewFileScreen extends StatelessWidget {
  ViewFileScreen({Key? key, required this.url}) : super(key: key);
  final String url;
  PdfViewerController? _pdfViewerController;

  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.network(
      url,
      controller: _pdfViewerController,
    );
  }
}
