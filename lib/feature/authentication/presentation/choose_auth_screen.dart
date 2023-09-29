import 'package:flutter/material.dart';
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
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Phone Number Verification"),
      ),
      body: SingleChildScrollView(

        child: context.watch<PhoneAuthenticationNotifier>().codeSentCheck? OtpVerificationWidget(phoneNumber: context.read<PhoneAuthenticationNotifier>().phoneNumber,):  PhoneNumberVerificationWidget()
      ),
    );
  }
}
