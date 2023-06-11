import 'dart:async';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'all_templates/first_template.dart';
import 'all_templates/second_template.dart';
import '../preview/components/data.dart';
import 'all_templates/third_template.dart';

const templateName = [
  TemplateName(template1),
  TemplateName(template2),
  TemplateName(template3),
];

typedef LayoutCallbackWithData = Future<Uint8List> Function(
    PdfPageFormat pageFormat, CustomData data);

class TemplateName {
  const TemplateName(
    this.builder,
  );
  final LayoutCallbackWithData builder;
}
