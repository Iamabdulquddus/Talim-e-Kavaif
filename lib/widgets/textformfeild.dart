import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatefulWidget {
  final String? errorText;
  final String? labelText;
  final TextEditingController? controller;
  final bool? editable;
  final int? maxLines;
  final int? maxLenght;
  final void Function(String)? onChange;
  final IconData? icon;
  final TextInputType? keyboardType;

  const CustomTextFormFeild({
    Key? key,
    required this.maxLines,
    this.maxLenght,
    this.errorText,
    this.labelText,
    this.controller,
    this.editable,
    this.onChange,
    this.icon,
    this.keyboardType,
  }) : super(key: key);

  @override
  State<CustomTextFormFeild> createState() => _CustomTextFormFeildState();
}

class _CustomTextFormFeildState extends State<CustomTextFormFeild> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        maxLength: widget.maxLenght,
        maxLines: widget.maxLines,
        enabled: widget.editable,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(

          labelText: widget.labelText,
          prefixIcon: IconTheme(
            data: IconThemeData(
              color: Theme.of(context).brightness == Brightness.light ?Theme.of(context).primaryColor : Theme.of(context).indicatorColor,
            ),
            child:  Icon(widget.icon),
          ),
          counterStyle: const TextStyle(
            height: double.minPositive,
          ),
          counterText: "",
          // fillColor: Colors.white,
          filled: true,
          errorText: widget.errorText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              5.0,
            ),
          ),
        ),
        controller: widget.controller,
        onChanged: widget.onChange,
      ),
    );
  }
}
