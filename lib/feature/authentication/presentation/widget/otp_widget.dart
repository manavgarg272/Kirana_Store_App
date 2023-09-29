import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kirna_store_app/core/constant_files/constant_image.dart';
import 'package:kirna_store_app/feature/authentication/presentation/manager/phone_authentication_notifier.dart';
import 'package:kirna_store_app/main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class OtpVerificationWidget extends StatefulWidget {
  final String? phoneNumber;
  const OtpVerificationWidget({super.key, this.phoneNumber,});

  @override
  State<OtpVerificationWidget> createState() => _OtpVerificationWidgetState();
}

class _OtpVerificationWidgetState extends State<OtpVerificationWidget> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

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
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
            child: RichText(
              text: TextSpan(
                text: "Enter the code sent to ",
                children: [
                  TextSpan(
                    text: "${widget.phoneNumber}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),


          Container(
            margin: EdgeInsets.symmetric(horizontal: size.height/10),
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 30,
                ),
                child: PinCodeTextField(
                  appContext: context,
                  length: 6,
               
                  validator: (v) {
                    if (v!.length < 3) {
                      return "I'm from validator";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    inactiveColor: Colors.grey.shade400,
                    activeColor: Colors.grey.shade400,
                    selectedFillColor: Colors.white
                  ),
                  cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  controller: textEditingController, 
                  keyboardType: TextInputType.number,
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                  onCompleted: (v) {
                    debugPrint("Completed");
                  },
                  
                  onChanged: (value) {
                    debugPrint(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    debugPrint("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              hasError ? "*Please fill up all the cells properly" : "",
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Didn't receive the code? ",
                style: TextStyle(color: Colors.black54, fontSize: 15),
              ),
              TextButton(
                onPressed: () =>{

                },
                child: const Text(
                  "RESEND",
                  style: TextStyle(
                    color: Color(0xFF91D3B3),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),

          const SizedBox(
            height: 14,
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.green.shade300,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.green.shade200,
                        offset: const Offset(1, -2),
                        blurRadius: 5),
                    BoxShadow(
                        color: Colors.green.shade200,
                        offset: const Offset(-1, 2),
                        blurRadius: 5)
                  ]),
            child: ButtonTheme(
              height: 50,
              child: TextButton(
                onPressed: ()async {
                  formKey.currentState!.validate();
                  // conditions for validating
                  if (currentText.length != 6 || currentText != "123456") {
                    errorController!.add(ErrorAnimationType
                        .shake); // Triggering error shake animation
                    setState(() => hasError = true);
                  } else {
        
                        await context.read<PhoneAuthenticationNotifier>().signInWithPhoneCredentials(textEditingController.text);                 
                        if( FirebaseAuth.instance.currentUser!=null ){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Kirana Store App')),
                          );
                        }
                      
                  }
                },
                child: Center(
                  child: Text(
                    "VERIFY".toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
           
          ),
          SizedBox(height: size.height/40,),
          GestureDetector(
            onTap: () {
              context.read<PhoneAuthenticationNotifier>().codeSentCheck=false;

            },
            child: const Text("GO BACK")
          )
        ],
      );
    
  }
}