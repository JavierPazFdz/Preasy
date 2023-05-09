import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String formProperty;
  final Map<String, String> formValues;
  
  

  const CustomInputField({
    super.key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    required this.formProperty,
    required this.formValues, 
    
    
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      textCapitalization: TextCapitalization.words,
      autofocus: false,
      obscureText: obscureText,
      keyboardType: keyboardType,      
      validator: (value){
        if (value == null) return 'Este campo es requerido';
        
        return value.length < 10 ? 'Minimo 10 caracteres' : null;
        },
      onChanged: (value) {
        formValues[formProperty] = value;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,

      
      decoration: InputDecoration(
        
        hintText: hintText,
        labelText: labelText,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10))),
        helperText: helperText,
        prefixIcon: icon == null ? null : Icon(icon),
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
      ),
      
    );
  }
}
