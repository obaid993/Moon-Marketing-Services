import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  String? labelText;
  final String hintText;
  final TextInputType textInputType;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool? isPassword;
  final String? Function(String?)? validator;
//  final Function onSaved;
//  final Function validator;

  CustomTextFormField(
      {
      super.key,
      this.labelText,
      required this.hintText,
      required this.textInputType,
      required this.prefixIcon,
      required this.controller,
      this.suffixIcon,
      this.isPassword,
      this.validator
      // required this.onSaved,
      // required this.validator
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      validator: validator,

      // onSaved: onSaved(),
      // validator: validator(),
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return 'Required Field';
      //   }
      //   return null;
      // },
    );
  }
}

// ignore: must_be_immutable
class BuildText extends StatelessWidget {
  String? text;
  Color? color;
  FontWeight? fontWeight;
  FontStyle? fontStyle;

  BuildText(
     {super.key,
      required this.text,
      this.color,
      this.fontWeight,
      this.fontStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle,
          fontSize: 14),
    );
  }
}
