import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  DatePicker({super.key, this.labelText,this.controller});
  final String? labelText;
  TextEditingController? controller = TextEditingController();

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {

  @override
  void initState() {
    widget.controller?.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.cake),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              5.0,
            ),
          ),
          // icon: Icon(Icons.calendar_today),
          labelText: widget.labelText,
        ),
        readOnly: true, // when true user cannot edit text
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(), //get today's date
              firstDate: DateTime(
                  1950), //DateTime.now() - not to allow to choose before today.
              lastDate: DateTime.now());

          if (pickedDate != null) {
            print(
                pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
            String formattedDate = DateFormat('dd-MM-yyyy').format(
                pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
            print(
                formattedDate); //formatted date output using intl package =>  2022-07-04
            //You can format date as per your need

            setState(() {
              widget.controller?.text =
                  formattedDate; //set foratted date to TextField value.
            });
          } else {
            print("Date is not selected");
          }
        },
      ),
    );
  }
}
