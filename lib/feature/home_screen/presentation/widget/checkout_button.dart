




import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirna_store_app/feature/order_summary/presentation/order_summary.dart';

class CheckOutFloatingButton extends StatelessWidget {
  const CheckOutFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderSummaryWidget()));
      },
      child: Container(
        alignment: Alignment.center,
        
        decoration: BoxDecoration(
          color:  Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        margin: EdgeInsets.fromLTRB(size.height/30,0,0,0),
      
        height: size.height/15,
        child: Text("GO TO ORDER SUMMARY", style: GoogleFonts.roboto(fontWeight: FontWeight.w800,
        fontSize: size.height / 60),),),
    );
  }
}