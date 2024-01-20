import 'package:flutter/material.dart';
import 'package:store_redirect/store_redirect.dart';

Widget UpdateAppAlertDialog(BuildContext context) {
  return WillPopScope(
    onWillPop: () async {
      return false;
    },
    child: Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "UPDATE AVAILABLE",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto"),
            ),
            SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).pop();
                  StoreRedirect.redirect(
                      androidAppId: "com.manav.ShyamMart",
                      iOSAppId: "1583755180");
                },
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                child: Text(
                  "UPDATE AVAILABLE",
                  style: TextStyle(
                      fontSize: 16, color: Colors.white, fontFamily: "Roboto"),
                ),
              ),
            ]),
          ],
        ),
      ),
    ),
  );
}
