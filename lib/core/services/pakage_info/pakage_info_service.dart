import 'package:flutter/material.dart';
import 'package:kirna_store_app/core/services/firebase_service/firebase_auth_service.dart';
import 'package:kirna_store_app/core/services/pakage_info/widget/update_alert_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PakageInfoService {
  late PackageInfo _packageInfo;

  late int buildNumber;
  Future<void> initializePakageValue() async {
    _packageInfo = await PackageInfo.fromPlatform();
    buildNumber = int.parse(_packageInfo.buildNumber);
  }

  Future<void> showDialogBox(BuildContext context) async {
    print(
        "buildnumber $buildNumber pakageinfor ${FirebaseAuthenticationService.updateValue}");
    if (buildNumber < FirebaseAuthenticationService.updateValue) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return UpdateAppAlertDialog(context);
          },
        );
      });
    }
  }
}
