import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../controllers/resume_controller.dart';
import '../templates/template_name.dart';
import 'components/data.dart';

class Preview extends StatefulWidget {
  const Preview({Key? key, required this.template,  }) : super(key: key);
  // final int tab ;
 final TemplateName template;

  @override
  PreviewState createState() {
    return PreviewState();
  }
}

class PreviewState extends State<Preview> with SingleTickerProviderStateMixin {
  final int _tab = 0;

  PrintingInfo? printingInfo;

  final ResumeController resumeController = Get.find();
  final _data =  CustomData();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _showPrintedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Document printed successfully'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    pw.RichText.debug = true;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Template'),
        elevation: 2,
      ),
      body: PdfPreview(
        maxPageWidth: 700,
        build: (format) => widget.template.builder(format, _data),
        canChangeOrientation: false,
        canChangePageFormat: false,
        canDebug: false,
        allowSharing: false,
        onPrinted: _showPrintedToast,
      ),
    );
  }
}
