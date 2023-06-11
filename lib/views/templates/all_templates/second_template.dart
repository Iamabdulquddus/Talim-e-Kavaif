import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import '../../../constants/images.dart';
import '../../preview/components/data.dart';

const PdfColor green = PdfColor.fromInt(0xff9ce5d9);
const PdfColor lightGreen = PdfColor.fromInt(0xffcdf1e7);
const sep = 120.0;

Future<Uint8List> template2(PdfPageFormat format, CustomData data) async {
  final doc = Document(title: 'My Resume', author: 'Resume Maker');

  final profileImage = MemoryImage(
    (await rootBundle.load(resumeBro)).buffer.asUint8List(),
  );

  final pageTheme = await _myPageTheme(format);

  doc.addPage(
    MultiPage(
      pageTheme: pageTheme,
      build: (Context context) => [
        Partitions(
          children: [
            Partition(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Muhammad Abdul Quddus',
                            textScaleFactor: 1.5,
                            style: Theme.of(context)
                                .defaultTextStyle
                                .copyWith(fontWeight: FontWeight.bold)),
                        Padding(padding: const EdgeInsets.only(top: 20)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: 150,
                              child: Text(
                                  'This is very long address of like 4 lines. so Im just typing text here.'),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('+1 403-721-6898'),
                                Text('Date of birth here'),
                                UrlText('abdulquddus7782@gmail.com',
                                    'mailto:abdulquddus7782@gmail.com'),
                                UrlText('My website',
                                    'https://github.com/Iamabdulquddus'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Category(title: 'Work Experience'),
                  WorkExperience(
                      title: 'Peasant',
                      text: '${LoremText().paragraph(20)}',
                      subheading: 'Classified company',
                      from: '2014',
                      to: '2016'),
                  WorkExperience(
                      title: 'Peasant',
                      text: '${LoremText().paragraph(20)}',
                      subheading: 'Classified company',
                      from: '2014',
                      to: '2016'),
                  WorkExperience(
                      title: 'Peasant',
                      text: '${LoremText().paragraph(20)}',
                      subheading: 'Classified company',
                      from: '2014',
                      to: '2016'),
                  WorkExperience(
                      title: 'Peasant',
                      text: '${LoremText().paragraph(20)}',
                      subheading: 'Classified company',
                      from: '2014',
                      to: '2016'),
                  WorkExperience(
                      title: 'Peasant',
                      text: '${LoremText().paragraph(20)}',
                      subheading: 'Classified company',
                      from: '2014',
                      to: '2016'),
                  Category(title: 'Education'),
                  Education(
                      title: 'Matriculation',
                      text: '900',
                      subheading: 'Government High School Farooka Tehsil Sahiwal District Sargodha',
                      from: '2014',
                      to: '2016'),
                  Education(
                      title: 'Matriculation',
                      text: '900',
                      subheading: 'Government High School Farooka Tehsil Sahiwal District Sargodha',
                      from: '2014',
                      to: '2016'),
                  Education(
                      title: 'Matriculation',
                      text: '900',
                      subheading: 'Government High School Farooka Tehsil Sahiwal District Sargodha',
                      from: '2014',
                      to: '2016'),
                  Education(
                      title: 'Matriculation',
                      text: '900',
                      subheading: 'Government High School Farooka Tehsil Sahiwal District Sargodha',
                      from: '2014',
                      to: '2016'),
                  Education(
                      title: 'Matriculation',
                      text: '900',
                      subheading: 'Government High School Farooka Tehsil Sahiwal District Sargodha',
                      from: '2014',
                      to: '2016'),
                  Category(title: 'Publications'),
                  ProjectPublication(title: 'COVID effects on economy and entrepreneurship',text: 'Driving hospitality and tourism to foster sustainable innovation: A systematic review of COVID-19-related studies and practical implications in the digital era', ),
                  Category(title: 'Project'),
                  ProjectPublication(title: 'Resume maker in flutter',text: 'A flutter application which eases the process of making CV.', ),

                ],
              ),
            ),
            Partition(
              width: sep,
              child: Padding(
                child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Container(
                      width: 100,
                      height: 100,
                      color: lightGreen,
                      child: Image(profileImage),
                    ),
                  ),
                  SizedBox(height: 40),
                  Category(title: 'Objective'),
                  Text('${LoremText().paragraph(20)}',
                      style: TextStyle(fontSize: 10)),
                  Category(title: 'Skills'),
                  SkillInterestActivityLanguage(item: 'Sleeping'),
                  Category(title: 'Interests'),
                  SkillInterestActivityLanguage(item: 'Sleeping'),
                  Category(title: 'Activities'),
                  SkillInterestActivityLanguage(item: 'Sleeping'),
                  SkillInterestActivityLanguage(item: 'Sleeping'),
                  Category(title: 'Languages'),
                  SkillInterestActivityLanguage(item: 'English'),
                  SkillInterestActivityLanguage(item: 'Urdu'),
                  Category(title: 'Reference'),
                  Reference(referenceName: 'Reference Name',  companyName: 'Company Name',jobTitle: 'Job Title', email: 'ecorp@gmail.com', phone: '03001234567'),
                ],
              ), padding: EdgeInsets.only(left: 10),),
            )
          ],
        ),
      ],
    ),
  );
  return doc.save();
}

Future<PageTheme> _myPageTheme(PdfPageFormat format) async {
  final bgShape = await rootBundle.loadString('assets/resume.svg');

  format = format.applyMargin(
      left: 2.0 * PdfPageFormat.cm,
      top: 4.0 * PdfPageFormat.cm,
      right: 2.0 * PdfPageFormat.cm,
      bottom: 2.0 * PdfPageFormat.cm);
  return PageTheme(
    pageFormat: format,
    theme: ThemeData.withFont(
      base: await PdfGoogleFonts.openSansRegular(),
      bold: await PdfGoogleFonts.openSansBold(),
      icons: await PdfGoogleFonts.materialIcons(),
    ),
    buildBackground: (Context context) {
      return FullPage(
        ignoreMargins: true,
        child: Stack(
          children: [
            Positioned(
              child: SvgImage(svg: bgShape),
              left: 0,
              top: 0,
            ),
            Positioned(
              child: Transform.rotate(angle: pi, child: SvgImage(svg: bgShape)),
              right: 0,
              bottom: 0,
            ),
          ],
        ),
      );
    },
  );
}

class WorkExperience extends StatelessWidget {
  WorkExperience({
    required this.from,
    required this.to,
    required this.text,
    required this.subheading,
    required this.title,
  });

  final String title, text, subheading, from, to;

  @override
  Widget build(Context context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 6,
              height: 6,
              margin: const EdgeInsets.only(top: 5.5, left: 2, right: 5),
              decoration: const BoxDecoration(
                color: green,
                shape: BoxShape.circle,
              ),
            ),
            Text(
              title,
              style: Theme.of(context)
                  .defaultTextStyle
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Row(
              children: [
                Text(from, style: TextStyle(fontSize: 8)),
                Text(' - '),
                Text(to, style: TextStyle(fontSize: 8)),
              ],
            ),
            SizedBox(width: 10,),
          ],
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: green, width: 2),
            ),
          ),
          padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
          margin: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(subheading,
                  style:
                      const TextStyle(fontSize: 12, color: PdfColors.green800)),
              Text(text, style: TextStyle(fontSize: 9)),
            ],
          ),
        ),
      ],
    );
  }
}

class Education extends StatelessWidget {
  Education({
    required this.from,
    required this.to,
    required this.text,
    required this.subheading,
    required this.title,
  });

  final String title, text, subheading, from, to;

  @override
  Widget build(Context context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 6,
              height: 6,
              margin: const EdgeInsets.only(top: 5.5, left: 2, right: 5),
              decoration: const BoxDecoration(
                color: green,
                shape: BoxShape.circle,
              ),
            ),
            Text(
              title,
              style: Theme.of(context)
                  .defaultTextStyle
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Row(
              children: [
                Text(from, style: TextStyle(fontSize: 8)),
                Text(' - '),
                Text(to, style: TextStyle(fontSize: 8)),
              ],
            ),
            SizedBox(width: 10,),
          ],
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: green, width: 2),
            ),
          ),
          padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
          margin: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(subheading,
                  style:
                      const TextStyle(fontSize: 10, color: PdfColors.green900)),
              Text(text, style: TextStyle(fontSize: 10)),
            ],
          ),
        ),
      ],
    );
  }
}

class Reference extends StatelessWidget {
  Reference({
    required this.referenceName,
    required this.jobTitle,
    required this.companyName,
    required this.email,
    required this.phone,
  });

  final String referenceName, jobTitle, companyName, email, phone;

  @override
  Widget build(Context context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 6,
              height: 6,
              margin: const EdgeInsets.only(top: 5.5, left: 2, right: 5),
              decoration: const BoxDecoration(
                color: green,
                shape: BoxShape.circle,
              ),
            ),
            Text(
              '${referenceName} | ',
              style: Theme.of(context)
                  .defaultTextStyle
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
          margin: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(companyName, style: TextStyle(fontSize: 12)),
              Text(jobTitle,
                  style:
                      const TextStyle(fontSize: 12, color: PdfColors.green800)),
              Text(phone, style: TextStyle(fontSize: 10),),
              Text(email, style: TextStyle(fontSize: 10),),
            ],
          ),
        ),
      ],
    );
  }
}

class ProjectPublication extends StatelessWidget {
  ProjectPublication({
    required this.text,
    required this.title,
  });

  final String title, text;

  @override
  Widget build(Context context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 6,
              height: 6,
              margin: const EdgeInsets.only(top: 5.5, left: 2, right: 5),
              decoration: const BoxDecoration(
                color: green,
                shape: BoxShape.circle,
              ),
            ),
            Text(
              title,
              style: Theme.of(context)
                  .defaultTextStyle
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: green, width: 2),
            ),
          ),
          padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
          margin: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(text, style: TextStyle(fontSize: 10)),
            ],
          ),
        ),
      ],
    );
  }
}

class Category extends StatelessWidget {
  Category({required this.title});

  final String title;

  @override
  Widget build(Context context) {
    return Container(
      decoration: const BoxDecoration(
        color: lightGreen,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      margin: const EdgeInsets.only(bottom: 10, top: 20),
      padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: Text(
        title,
        textScaleFactor: 1.2,
      ),
    );
  }
}

class SkillInterestActivityLanguage extends StatelessWidget {
  SkillInterestActivityLanguage({
    required this.item,

  });

  final String item ;

  @override
  Widget build(Context context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 6,
              height: 6,
              margin: const EdgeInsets.only(top: 4, left: 2, right: 5),
              decoration: const BoxDecoration(
                color: green,
                shape: BoxShape.circle,
              ),
            ),
            Text(
              item,
              style: TextStyle(fontSize: 11),
            ),
          ],
        ),
      ],
    );
  }
}

// class Percent extends StatelessWidget {
//   Percent({
//     required this.size,
//     required this.value,
//     required this.title,
//   });
//
//   final double size;
//
//   final double value;
//
//   final Widget title;
//
//   static const fontSize = 1.2;
//
//   PdfColor get color => green;
//
//   static const backgroundColor = PdfColors.grey300;
//
//   static const strokeWidth = 5.0;
//
//   @override
//   Widget build(Context context) {
//     final widgets = <Widget>[
//       Container(
//         width: size,
//         height: size,
//         child: Stack(
//           alignment: Alignment.center,
//           fit: StackFit.expand,
//           children: <Widget>[
//             Center(
//               child: Text(
//                 '${(value * 100).round().toInt()}%',
//                 textScaleFactor: fontSize,
//               ),
//             ),
//             CircularProgressIndicator(
//               value: value,
//               backgroundColor: backgroundColor,
//               color: color,
//               strokeWidth: strokeWidth,
//             ),
//           ],
//         ),
//       )
//     ];
//
//     widgets.add(title);
//
//     return Column(children: widgets);
//   }
// }

class UrlText extends StatelessWidget {
  UrlText(this.text, this.url);

  final String text;
  final String url;

  @override
  Widget build(Context context) {
    return UrlLink(
      destination: url,
      child: Text(text,
          style: const TextStyle(
            decoration: TextDecoration.underline,
            color: PdfColors.blue,
          )),
    );
  }
}
