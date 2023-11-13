

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  

  String formatPhoneNumber(String phoneNumber) {
    print("formatPhoneNumber $phoneNumber");
    if (phoneNumber != null && phoneNumber.length == 10) {
      /* final countryCode = phoneNumber.substring(0, 3); */
      final firstPart = phoneNumber.substring(0, 4);
      final secondPart = phoneNumber.substring(4, 7);
      final thirdPart = phoneNumber.substring(7,10);
      
      return '+91 $firstPart $secondPart $thirdPart';
    }
    return phoneNumber;
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return  Column(
      children: [
        SizedBox(
          height: size.height/10,
        ),
        Container(child: Text("WELCOME TO SHRI SHYAM STORE",
      style: GoogleFonts.roboto(fontSize: size.height/50, fontWeight: FontWeight.bold, color: Colors.yellow.shade800),
      ),),
        Container(
          width: size.width/1.5,
          margin: EdgeInsets.symmetric(vertical: size.height/50),
          child: Image.asset(ConstantImageFile.shoppingMart),
        ),
        SizedBox(
          height: size.height/20,
        ),

      
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.height/30,vertical: size.height/80),
          child: TextFormField(
            controller: _phoneController,
          
            decoration: InputDecoration(
              prefixText: '+91 ',
              prefixStyle:GoogleFonts.roboto(fontSize: size.height/47) ,
              hintText: 'Enter Phone Number',
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              hintStyle: GoogleFonts.roboto(fontSize: size.height/60),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Colors.grey.shade400), //<-- SEE HERE
                borderRadius: BorderRadius.circular(5.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Colors.grey.shade400), //<-- SEE HERE
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          
        ),

        SizedBox(
          height: size.height/40,
        ),
   

   InkWell(
    onTap: ()async {
      FocusScope.of(context).unfocus();
      print("phoneControllertext ${formatPhoneNumber(_phoneController.text)}");
                await context.read<PhoneAuthenticationNotifier>().signInWithPhoneNumber(formatPhoneNumber(_phoneController.text)) ; 
    },
     child: Container(
      width:size.width/1.5,
      height: size.height/15,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.blue.shade400
      ),
      padding: EdgeInsets.all(size.height/100),
      alignment: Alignment.center,
      child:  context.watch<PhoneAuthenticationNotifier>().phoneAuthenticationNotifierState == PhoneAuthenticationNotifierState.loading ?const CircularProgressIndicator():Text('Continue',textAlign: TextAlign.center,style: GoogleFonts.roboto(color: Colors.white, 
     fontWeight: FontWeight.bold
     ),),
     ),
   )

      ],
    );
  }
}


/* '+91 9711 181 198' */