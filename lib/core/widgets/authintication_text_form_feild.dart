import 'package:Linko/core/extensions/media_query_extension.dart';
import 'package:Linko/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAuthTextForm extends StatelessWidget {
  final String hinttext;
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;
  final IconData? suffix;
  final IconData? prefix;
  final VoidCallback? suffixpressed;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;
  const CustomAuthTextForm({
    Key? key,
    required this.hinttext,
    required this.mycontroller,
    this.validator,
    this.suffix,
    this.prefix,
    this.suffixpressed,
    required this.obscureText,
    this.keyboardType,
    this.inputFormatters,
    this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        style: TextStyle(fontSize: context.getHight(divide: 0.02)),
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        validator: validator,
        controller: mycontroller,
        readOnly: readOnly ?? false,

        ///see it again
        decoration: InputDecoration(
          labelText: hinttext,
          prefixIconColor: AppColors.primaryColor,
          prefixIcon: Icon(prefix!),
          // you should put this to mke border fixed when you click on the button
          border: const OutlineInputBorder(),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixpressed,
                  icon: Icon(suffix),
                )
              : null,
          hintText: hinttext,
          contentPadding: EdgeInsets.all(context.getHight(divide: 0.02)),
        ),
      ),
    );
  }
}
