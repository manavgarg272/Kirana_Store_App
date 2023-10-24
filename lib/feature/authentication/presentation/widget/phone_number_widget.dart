

import 'package:flutter/material.dart';
import 'package:kirna_store_app/core/constant_files/constant_image.dart';
import 'package:kirna_store_app/feature/authentication/presentation/manager/phone_authentication_notifier.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PhoneNumberVerificationWidget extends StatefulWidget {
  const PhoneNumberVerificationWidget({super.key});

  @override
  State<PhoneNumberVerificationWidget> createState() => _PhoneNumberVerificationWidgetState();
}

class _PhoneNumberVerificationWidgetState extends State<PhoneNumberVerificationWidget> {
  final TextEditingController _phoneController = TextEditingController();
  final _phoneFormatter = MaskTextInputFormatter(
    mask: '+91 #### ### ###',
    filter: {'#': RegExp(r'[0-9]')},
  );
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return  Column(
      children: [
        Container(
          width: size.width/2,
          margin: EdgeInsets.symmetric(vertical: size.height/20),
          child: Image.asset(ConstantImageFile.otpasset),
        ),

        Container(
          margin: EdgeInsets.symmetric(horizontal: size.height/30,vertical: size.height/50),
          child: TextFormField(
            controller: _phoneController,
            inputFormatters: [
              _phoneFormatter
            ],
            decoration: InputDecoration(
              hintText: '  Enter Phone Number',
          
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Colors.grey.shade400), //<-- SEE HERE
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Colors.grey.shade400), //<-- SEE HERE
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          
        ),

        SizedBox(
          height: size.height/20,
        ),
        SizedBox(
            width: size.width / 2,
            height: size.height / 15,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
              ),
              child:  Text(
                "GET OTP",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.height / 60),
              ),
              onPressed: () async {
                FocusScope.of(context).unfocus();
              await context.read<PhoneAuthenticationNotifier>().signInWithPhoneNumber(_phoneController.text);

             
              },
            ))



      ],
    );
  }
}
