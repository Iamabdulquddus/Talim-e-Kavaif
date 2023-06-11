import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import '../../../constants/images.dart';
import '../../preview/components/data.dart';

const PdfColor darkGrey = PdfColor.fromInt(0xff393E46);
const PdfColor lightGrey = PdfColor.fromInt(0xffCFD2CF);
const sep = 130.0;

Future<Uint8List> template3(PdfPageFormat format, CustomData data) async {
  final doc = Document(title: 'My Resume', author: 'Resume Maker');

  final profileImage = MemoryImage(
    (await rootBundle.load(resumeBro)).buffer.asUint8List(),
  );

  final pageTheme = await _myPageTheme(format);

  doc.addPage(
    MultiPage(
      pageTheme: pageTheme,
      build: (Context context) => [
        Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: PdfColors.white, width: 10),
                ),
                child: ClipOval(
                  child: Container(
                    color: lightGrey,
                    width: 110,
                    height: 110,
                    child: Image(profileImage),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'Muhammad Abdul Quddus',
                  textScaleFactor: 1.5,
                  style: Theme.of(context)
                      .defaultTextStyle
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text('+1 403-721-6898'),
                UrlText('abdulquddus7782@gmail.com',
                    'mailto:abdulquddus7782@gmail.com'),
              ]),
            ],
          ),
        ),
        Partitions(
          children: [
            Partition(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Category(title: 'Objective'),
                  Text(LoremText().paragraph(20),
                      style: const TextStyle(fontSize: 10)),
                  Category(title: 'Work Experience'),

                  WorkExperience(
                      companyName: 'Classified company',
                      detail: LoremText().paragraph(20),
                      jobTitle: 'Peasant',
                      from: '2014',
                      to: '2016'),
                  WorkExperience(
                      companyName: 'Classified company',
                      detail: LoremText().paragraph(20),
                      jobTitle: 'Peasant',
                      from: '2014',
                      to: '2016'),
                  WorkExperience(
                      companyName: 'Classified company',
                      detail: LoremText().paragraph(20),
                      jobTitle: 'Peasant',
                      from: '2014',
                      to: '2016'),
                  WorkExperience(
                      companyName: 'Classified company',
                      detail: LoremText().paragraph(20),
                      jobTitle: 'Peasant',
                      from: '2014',
                      to: '2016'),
                  WorkExperience(
                      companyName: 'Classified company',
                      detail: LoremText().paragraph(20),
                      jobTitle: 'Peasant',
                      from: '2014',
                      to: '2016'),

                  Category(title: 'Education'),
                  Education(
                      degree: 'Matriculation',
                      marks: '900',
                      institute:
                          'Government High School Farooka Tehsil Sahiwal District Sargodha',
                      from: '2014',
                      to: '2016'),
                  Education(
                      degree: 'Matriculation',
                      marks: '900',
                      institute:
                          'Government High School Farooka Tehsil Sahiwal District Sargodha',
                      from: '2014',
                      to: '2016'),
                  Education(
                      degree: 'Matriculation',
                      marks: '900',
                      institute:
                          'Government High School Farooka Tehsil Sahiwal District Sargodha',
                      from: '2014',
                      to: '2016'),
                  Education(
                      degree: 'Matriculation',
                      marks: '900',
                      institute:
                          'Government High School Farooka Tehsil Sahiwal District Sargodha',
                      from: '2014',
                      to: '2016'),
                  Education(
                      degree: 'Matriculation',
                      marks: '900',
                      institute:
                          'Government High School Farooka Tehsil Sahiwal District Sargodha',
                      from: '2014',
                      to: '2016'),
                  Category(title: 'Publications'),
                  ProjectPublication(
                    title: 'COVID effects on economy and entrepreneurship',
                    text:
                        'Driving hospitality and tourism to foster sustainable innovation: A systematic review of COVID-19-related studies and practical implications in the digital era',
                  ),
                  Category(title: 'Project'),
                  ProjectPublication(
                    title: 'Resume maker in flutter',
                    text:
                        'A flutter application which eases the process of making CV.',
                  ),
                ],
              ),
            ),
            Partition(
              width: sep,
              child: Padding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, bottom: 20, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              'This is very long address of like 4 lines. so Im just typing text here.',
                              style: const TextStyle(fontSize: 10)),
                          Text('Date of birth here'),
                          UrlText('My website',
                              'https://github.com/Iamabdulquddus'),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
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
                    Reference(
                        referenceName: 'Reference Name',
                        companyName: 'Company Name',
                        jobTitle: 'Job Title',
                        email: 'ecorp@gmail.com',
                        phone: '03001234567'),
                  ],
                ),
                padding: const EdgeInsets.only(left: 10),
              ),
            )
          ],
        ),
      ],
    ),
  );
  return doc.save();
}

Future<PageTheme> _myPageTheme(PdfPageFormat format) async {
  // final bgShape = await rootBundle.loadString('assets/resume.svg');

  format = format.applyMargin(
      left: 2.0 * PdfPageFormat.cm,
      top: 2.0 * PdfPageFormat.cm,
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
              child: ClipOval(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [darkGrey,lightGrey, PdfColors.grey50.shade(0.1),],
                      begin: Alignment.topLeft
                    ),
                  ),
                ),
              ),
              left: -50,
              top: -50,
            ),
            Positioned(
              child: ClipOval(
                child: Container(
                  width: 200,
                  height: 200,
                  color: darkGrey,
                ),
              ),
              right: -100,
              bottom: -100,
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
    required this.detail,
    required this.jobTitle,
    required this.companyName,
  });

  final String companyName, detail, jobTitle, from, to;

  @override
  Widget build(Context context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              companyName,
              style: Theme.of(context)
                  .defaultTextStyle
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Row(
              children: [
                Text(from, style: const TextStyle(fontSize: 8)),
                Text(' - '),
                Text(to, style: const TextStyle(fontSize: 8)),
              ],
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                jobTitle,
                style: TextStyle(fontSize: 12, color:  PdfColors.grey900, fontWeight: FontWeight.bold),
              ),
              Text(detail, style: TextStyle(fontSize: 9)),
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
    required this.marks,
    required this.institute,
    required this.degree,
  });

  final String degree, marks, institute, from, to;

  @override
  Widget build(Context context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    degree,
                    style: Theme.of(context)
                        .defaultTextStyle
                        .copyWith(fontWeight: FontWeight.bold),
                  ),

                  Row(
                    children: [
                      Text(from, style: const TextStyle(fontSize: 8)),
                      Text(' - '),
                      Text(to, style: const TextStyle(fontSize: 8)),
                    ],
                  ),
                  Text(marks, style: const TextStyle(fontSize: 10)),
                ],
              ),
            ),
            SizedBox(
              width: 210,
              child: Text(
                institute,
                style: const TextStyle(fontSize: 10, color: darkGrey),
              ),
            ),
          ],
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
                color: darkGrey,
                shape: BoxShape.circle,
              ),
            ),
            Text(
              referenceName,
              style: Theme.of(context)
                  .defaultTextStyle
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
          margin: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(companyName, style: const TextStyle(fontSize: 13)),
              Text(jobTitle,
                  style:
                      const TextStyle(fontSize: 12, color: darkGrey)),
              Text(
                phone,
                style: const TextStyle(fontSize: 10),
              ),
              Text(
                email,
                style: const TextStyle(fontSize: 10),
              ),
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
            Text(
              title,
              style: Theme.of(context)
                  .defaultTextStyle
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Container(

          padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
          margin: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(text, style: const TextStyle(fontSize: 10)),
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [lightGrey, PdfColors.white.shade(0.1)],
          ),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        margin: const EdgeInsets.only(bottom: 10, top: 20),
        padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
        child: Row(children: [
          Text(
            title,
            textScaleFactor: 1.2,
          ),
        ],),);
  }
}

class SkillInterestActivityLanguage extends StatelessWidget {
  SkillInterestActivityLanguage({
    required this.item,
  });

  final String item;

  @override
  Widget build(Context context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 4,
              height: 4,
              margin: const EdgeInsets.only(top: 4, left: 2, right: 5),
              decoration:  BoxDecoration(
                color: PdfColors.white,
                shape: BoxShape.circle,
                border: Border.all(color: darkGrey, width: 1)
              ),
            ),
            Text(
              item,
              style: const TextStyle(fontSize: 11),
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
