


import 'package:flutter/material.dart';

class InputTextWidget extends StatefulWidget {

  final String labelText;
  final TextEditingController editingController;
  final TextInputType type;
  const InputTextWidget({super.key, required this.labelText, required  this.editingController,  
  required this.type
});

  @override
  State<InputTextWidget> createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
   return  TextFormField(
      controller: widget.editingController,
      keyboardType: widget.type,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a phone number';
        }
      
        return null;
      },


        decoration: InputDecoration(
          labelText: widget.labelText,
       
          contentPadding:const EdgeInsets.fromLTRB(10,5,5,5),
          labelStyle: TextStyle(fontSize: size.height/80),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                style: BorderStyle.solid,
                color: Colors.grey.shade400)),
          errorBorder: OutlineInputBorder(
            
            borderSide: BorderSide(
                style: BorderStyle.solid,
                color: Colors.grey.shade400)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    style: BorderStyle.solid,
                    color: Colors.grey.shade400)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    style: BorderStyle.solid,
                    color: Colors.grey.shade400))),
      );

    
  }
}
