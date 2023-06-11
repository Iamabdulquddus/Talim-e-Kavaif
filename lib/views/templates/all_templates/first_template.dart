import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import '../../../constants/images.dart';
import '../../preview/components/data.dart';

const PdfColor pdfPrimary = PdfColor.fromInt(0xff1363DF);
const PdfColor pdfLightColor = PdfColor.fromInt(0xffC1EFFF);
const sep = 120.0;

Future<Uint8List> template1(PdfPageFormat format, CustomData data) async {
  final doc = Document(title: 'My Resume', author: 'Resume Maker');

  final profileImage =
      MemoryImage((await rootBundle.load(resumeBro)).buffer.asUint8List());

  doc.addPage(
    MultiPage(
      build: (Context context) => [
        Partitions(
          children: [
            Partition(
              width: sep,
              child: Padding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipOval(
                      child: Container(
                        width: 100,
                        height: 100,
                        color: pdfLightColor,
                        child: Image(profileImage),
                      ),
                    ),
                    SizedBox(height: 27),
                    Category(
                      title: 'Objective',
                      categoryIcon: profileImage,
                    ),
                    Text('${LoremText().paragraph(20)}',
                        style: TextStyle(fontSize: 10)),
                    SizedBox(height: 10),
                    Category(
                      title: 'Skills',
                      categoryIcon: profileImage,
                    ),
                    SkillInterestActivityLanguage(item: 'Sleeping'),
                    SizedBox(height: 10),
                    Category(
                      title: 'Interests',
                      categoryIcon: profileImage,
                    ),
                    SkillInterestActivityLanguage(item: 'Sleeping'),
                    SizedBox(height: 10),
                    Category(
                      title: 'Activities',
                      categoryIcon: profileImage,
                    ),
                    SkillInterestActivityLanguage(item: 'Sleeping'),
                    SkillInterestActivityLanguage(item: 'Sleeping'),
                    SizedBox(height: 10),
                    Category(
                      title: 'Languages',
                      categoryIcon: profileImage,
                    ),
                    SkillInterestActivityLanguage(item: 'English'),
                    SkillInterestActivityLanguage(item: 'Urdu'),
                    SizedBox(height: 10),
                    Category(
                      title: 'Reference',
                      categoryIcon: profileImage,
                    ),
                    ReferenceFields(
                        referenceName: 'Reference Name',
                        companyName: 'Company Name',
                        jobTitle: 'Job Title',
                        email: 'ecorp@gmail.com',
                        phone: '03001234567'),
                  ],
                ),
                padding: EdgeInsets.only(right: 10),
              ),
            ),
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UrlText('abdulquddus7782@gmail.com',
                                    'mailto:abdulquddus7782@gmail.com'),
                                UrlText('My website',
                                    'https://github.com/Iamabdulquddus'),
                              ],
                            ),
                            SizedBox(width: 10),
                             Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('+1 403-721-6898'),
                                Text('Date of birth here'),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                            'This is very long address of like 4 lines. so Im just typing text here.'),
                      ],
                    ),
                  ),
                  Category(
                    title: 'Work Experience',
                    categoryIcon: profileImage,
                  ),
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
                  SizedBox(height: 10),
                  Category(
                    title: 'Education',
                    categoryIcon: profileImage,
                  ),
                  EducationFields(
                      title: 'Matriculation',
                      text: '900',
                      subheading:
                          'Government High School Farooka Tehsil Sahiwal District Sargodha',
                      from: '2014',
                      to: '2016'),
                  EducationFields(
                      title: 'Matriculation',
                      text: '900',
                      subheading:
                          'Government High School Farooka Tehsil Sahiwal District Sargodha',
                      from: '2014',
                      to: '2016'),
                  EducationFields(
                      title: 'Matriculation',
                      text: '900',
                      subheading:
                          'Government High School Farooka Tehsil Sahiwal District Sargodha',
                      from: '2014',
                      to: '2016'),
                  EducationFields(
                      title: 'Matriculation',
                      text: '900',
                      subheading:
                          'Government High School Farooka Tehsil Sahiwal District Sargodha',
                      from: '2014',
                      to: '2016'),
                  EducationFields(
                      title: 'Matriculation',
                      text: '900',
                      subheading:
                          'Government High School Farooka Tehsil Sahiwal District Sargodha',
                      from: '2014',
                      to: '2016'),
                  Category(
                    title: 'Publications',
                    categoryIcon: profileImage,
                  ),
                  SizedBox(height: 10),
                  ProjectPublication(
                    title: 'COVID effects on economy and entrepreneurship',
                    text:
                        'Driving hospitality and tourism to foster sustainable innovation: A systematic review of COVID-19-related studies and practical implications in the digital era',
                  ),
                  Category(
                    title: 'Project',
                    categoryIcon: profileImage,
                  ),
                  SizedBox(height: 10),
                  ProjectPublication(
                    title: 'Resume maker in flutter',
                    text:
                        'A flutter application which eases the process of making CV.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );

  return doc.save();
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
              margin: const EdgeInsets.only(top: 3.5, left: 2, right: 5),
              decoration: const BoxDecoration(
                color: pdfPrimary,
                shape: BoxShape.rectangle,
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
            SizedBox(
              width: 10,
            ),
          ],
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(
                color: pdfLightColor,
                width: 2,
              ),
            ),
          ),
          padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
          margin: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                subheading,
                style: TextStyle(
                    fontSize: 12,
                    color: pdfPrimary,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                text,
                style: TextStyle(fontSize: 9),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EducationFields extends StatelessWidget {
  EducationFields({
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
              margin: const EdgeInsets.only(top: 4.5, left: 2, right: 5),
              decoration: const BoxDecoration(
                color: pdfPrimary,
                shape: BoxShape.rectangle,
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
                Text(
                  from,
                  style: TextStyle(fontSize: 8),
                ),
                Text(' - '),
                Text(
                  to,
                  style: TextStyle(fontSize: 8),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: pdfLightColor, width: 2),
            ),
          ),
          padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
          margin: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                subheading,
                style: TextStyle(
                    fontSize: 10,
                    color: pdfPrimary,
                    fontWeight: FontWeight.bold),
              ),
              Text(text, style: TextStyle(fontSize: 10)),
            ],
          ),
        ),
      ],
    );
  }
}

class ReferenceFields extends StatelessWidget {
  ReferenceFields({
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
                color: pdfPrimary,
                shape: BoxShape.circle,
              ),
            ),
            Text(
              referenceName,
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
              Text(
                jobTitle,
                style: TextStyle(
                    fontSize: 12,
                    color: pdfPrimary,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                phone,
                style: TextStyle(fontSize: 10),
              ),
              Text(
                email,
                style: TextStyle(fontSize: 10),
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
            Container(
              width: 6,
              height: 6,
              margin: const EdgeInsets.only(top: 5.5, left: 2, right: 5),
              decoration: const BoxDecoration(
                color: pdfPrimary,
                shape: BoxShape.rectangle,
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
              left: BorderSide(color: pdfLightColor, width: 2),
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
  Category({required this.categoryIcon, required this.title});

  final String title;
  final MemoryImage categoryIcon;

  @override
  Widget build(Context context) {
    return Container(
      decoration: BoxDecoration(
        // color: pdfLightColor,
        gradient: LinearGradient(
          colors: [pdfLightColor, PdfColors.white.shade(0.1)],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      margin: const EdgeInsets.only(bottom: 5, top: 5),
      padding: const EdgeInsets.fromLTRB(2, 4, 10, 4),
      child: Row(children: [
        ClipOval(
          child: Container(
            width: 20,
            height: 20,
            color: pdfLightColor,
            child: Image(categoryIcon),
          ),
        ),
        SizedBox(width: 5),
        Text(
          title,
          textScaleFactor: 1.1,
        ),
      ]),
    );
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
              width: 6,
              height: 6,
              margin: const EdgeInsets.only(top: 4, left: 2, right: 5),
              decoration: const BoxDecoration(
                color: pdfPrimary,
                shape: BoxShape.rectangle,
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
