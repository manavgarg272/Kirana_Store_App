import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum PhoneAuthenticationNotifierState {loaded,loading,error,initial}

class PhoneAuthenticationNotifier extends ChangeNotifier {

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  String _phoneNumber="";
  String get phoneNumber=>_phoneNumber;
  set phoneNumber(String value){
    _phoneNumber=value;
    notifyListeners();
  }

  bool _codeSentCheck=false;
  bool get codeSentCheck=>_codeSentCheck;
  set codeSentCheck(bool value){
    _codeSentCheck=value;
    notifyListeners();
  }

  PhoneAuthenticationNotifierState _phoneAuthenticationNotifierState = PhoneAuthenticationNotifierState.initial;
  PhoneAuthenticationNotifierState get phoneAuthenticationNotifierState => _phoneAuthenticationNotifierState;
  set phoneAuthenticationNotifierState(PhoneAuthenticationNotifierState value) {
    _phoneAuthenticationNotifierState = value;
    notifyListeners();
  }


  String _verificationIdVal="";
  String get verificationIdVal=>_verificationIdVal;
  set verificationIdVal(String value){
    _verificationIdVal=value;
    notifyListeners();
  }

  Future<void> signInWithPhoneNumber(String phoneNumberVal) async {
    try {
      phoneAuthenticationNotifierState = PhoneAuthenticationNotifierState.loading;
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumberVal,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          codeSentCheck = true;
          verificationIdVal=verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      phoneAuthenticationNotifierState = PhoneAuthenticationNotifierState.loaded;
    } catch (e) {
      print(e);
    }
  }


  
  Future<void> signInWithPhoneCredentials(String smsCode) async {
    try{
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationIdVal, smsCode: smsCode);
      await _auth.signInWithCredential(credential);
      verificationIdVal="";
      codeSentCheck=false;
    }
    catch(e){

    }
  }
}
