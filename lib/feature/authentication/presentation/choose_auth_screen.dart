import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirna_store_app/feature/authentication/presentation/manager/phone_authentication_notifier.dart';
import 'package:kirna_store_app/feature/authentication/presentation/otp_screen.dart';

import 'package:provider/provider.dart';

class PhoneNumberVerification extends StatefulWidget {
  const PhoneNumberVerification({super.key});

  @override
  State<PhoneNumberVerification> createState() =>
      _PhoneNumberVerificationState();
}

class _PhoneNumberVerificationState extends State<PhoneNumberVerification> {
  final TextEditingController _phoneController = TextEditingController();

  String formatPhoneNumber(String phoneNumber) {
    print("formatPhoneNumber $phoneNumber");
    if (phoneNumber.length == 10) {
      /* final countryCode = phoneNumber.substring(0, 3); */
      final firstPart = phoneNumber.substring(0, 4);
      final secondPart = phoneNumber.substring(4, 7);
      final thirdPart = phoneNumber.substring(7, 10);

      return '+91 $firstPart $secondPart $thirdPart';
    }
    return phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text('SHRI SHYAM STORE',style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: size.height/40),),
            ),
            SizedBox(height: size.height/10,),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: size.height / 30, vertical: size.height / 80),
              child: TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  prefixText: '+91 ',
                  prefixStyle: GoogleFonts.roboto(fontSize: size.height / 47),
                  hintText: 'Enter Phone Number',
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  hintStyle: GoogleFonts.roboto(fontSize: size.height / 60),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: Colors.grey.shade400), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: Colors.grey.shade400), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              height: size.height / 40,
            ),
            InkWell(
              onTap: () async {
                FocusScope.of(context).unfocus();
                await context
                    .read<PhoneAuthenticationNotifier>()
                    .signInWithPhoneNumber(
                        formatPhoneNumber(_phoneController.text));
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>   OtpVerification(phoneNumber: _phoneController.text,)));
                       

              },
              child: Container(
                width: size.width / 1.5,
                height: size.height / 15,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.blue.shade400),
                padding: EdgeInsets.all(size.height / 100),
                alignment: Alignment.center,
                child:  Text(
                        'Continue',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
