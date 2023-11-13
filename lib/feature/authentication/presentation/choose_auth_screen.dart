import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirna_store_app/feature/authentication/presentation/manager/phone_authentication_notifier.dart';
import 'package:kirna_store_app/feature/authentication/presentation/widget/otp_widget.dart';
import 'package:kirna_store_app/feature/authentication/presentation/widget/phone_number_widget.dart';
import 'package:provider/provider.dart';

class PhoneNumberVerification extends StatefulWidget {
  const PhoneNumberVerification({super.key});

  @override
  State<PhoneNumberVerification> createState() =>
      _PhoneNumberVerificationState();
}

class _PhoneNumberVerificationState extends State<PhoneNumberVerification> {
  
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(80.0), 
        child: AppBar(
          backgroundColor: Colors.blue.shade400,
          
          title: Container(
            alignment: Alignment.bottomLeft,
            height: 70,
            child: Text("SHYAMMART",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Colors.white)))
        ),
      ),
      body: SingleChildScrollView(
        child: context.watch<PhoneAuthenticationNotifier>().codeSentCheck? OtpVerificationWidget(phoneNumber: context.read<PhoneAuthenticationNotifier>().phoneNumber,):  const PhoneNumberVerificationWidget()
      ),
    );
  }
}
