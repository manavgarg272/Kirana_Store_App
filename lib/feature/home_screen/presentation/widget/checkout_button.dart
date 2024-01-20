import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirna_store_app/feature/order_summary/presentation/manager/order_summary_manager.dart';
import 'package:kirna_store_app/feature/order_summary/presentation/order_summary.dart';
import 'package:kirna_store_app/feature/profile/presentation/profile.dart';

import 'package:provider/provider.dart';

class CheckOutFloatingButton extends StatelessWidget {
  const CheckOutFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return context.watch<OrderSummaryNotifier>().orderItemData.isEmpty
        ? GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MyProfilePageScreen()));
            },
            child: Container(
              child: Icon(
                Icons.person,
              ),
            ),
          )
        : GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const OrderSummaryWidget()));
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.fromLTRB(size.height / 30, 0, 0, 0),
              height: size.height / 15,
              child: Text(
                "GO TO ORDER SUMMARY",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: size.height / 60),
              ),
            ),
          );
  }
}
