
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../constants/style.dart';

class DropDownCustom extends StatefulWidget {
  const DropDownCustom({Key? key, required this.item, required this.label})
      : super(key: key);
  final List item;
  final String label;
  @override
  State<DropDownCustom> createState() => _DropDownCustomState();
}

class _DropDownCustomState extends State<DropDownCustom> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: DropdownButton2(
            isExpanded: true,
            hint: Text(
              widget.label,
            ),
            items: widget.item
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: MyTextStyles.subHeadingPrimary,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value as String;
              });
            },
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
            ),
            iconSize: 14,
            // iconEnabledColor: Colors.yellow,
            // iconDisabledColor: Colors.grey,
            buttonHeight: 50,
            // buttonWidth: 160,
            buttonPadding: const EdgeInsets.only(left: 14, right: 14),
            buttonDecoration: BoxDecoration(
              // borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10),),
              border: Border.all(
                color: Colors.black26,
              ),
              color: Colors.white,
            ),
            buttonElevation: 2,
            itemHeight: 40,

            // itemPadding: const EdgeInsets.only(left: 14, right: 14),
            dropdownMaxHeight: 200,
            // dropdownWidth: 200,
            dropdownPadding: null,
            dropdownDecoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(14),
              color: wWhiteColor,
            ),
            dropdownElevation: 3,
            scrollbarRadius: const Radius.circular(40),
            scrollbarThickness: 6,
            scrollbarAlwaysShow: true,
            // offset: const Offset(-20, 0),
          ),
        ),
      ),
    );
  }
}
