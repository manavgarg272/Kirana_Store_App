import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirna_store_app/feature/order_summary/presentation/manager/order_summary_manager.dart';
import 'package:kirna_store_app/feature/order_summary/presentation/widget/order_summary_widget.dart';
import 'package:provider/provider.dart';

class OrderSummaryWidget extends StatefulWidget {
  const OrderSummaryWidget({super.key});

  @override
  State<OrderSummaryWidget> createState() => _OrderSummaryWidgetState();
}

class _OrderSummaryWidgetState extends State<OrderSummaryWidget>
    with SingleTickerProviderStateMixin {
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "Order Summary List",
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w600, fontSize: size.height / 40),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: size.height / 50, horizontal: size.height / 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text("Products",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height / 50),
                          textAlign: TextAlign.center)),
                  Expanded(
                      child: Text("Quantity",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height / 50),
                          textAlign: TextAlign.center)),
                  Expanded(
                      child: Text("Price",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height / 50),
                          textAlign: TextAlign.center)),
                  Expanded(
                      child: Text("Total",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height / 50),
                          textAlign: TextAlign.center)),
                ],
              ),
            ),
            Divider(
              indent: size.height / 30,
              endIndent: size.height / 30,
            ),
            Column(
              children: context
                  .read<OrderSummaryNotifier>()
                  .orderItemData
                  .entries
                  .map((entry) {
                return OrderSummaryWidgetCard(
                  orderModelData: entry.value,
                );
              }).toList(),
            ),
            SizedBox(height: size.height / 30),
            Divider(
              indent: size.height / 30,
              endIndent: size.height / 30,
            ),
            Text(
              "Total Order Amount is Rs ${  context
              .watch<OrderSummaryNotifier>().orderTotalAmount}",
              style: GoogleFonts.roboto(
                  fontSize: size.height / 50, fontWeight: FontWeight.w500),
            ),
            Divider(
              indent: size.height / 30,
              endIndent: size.height / 30,
            ),

            SizedBox(height: size.height / 40),
            OutlinedButton(
              
              style: OutlinedButton.styleFrom(
                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(size.height/80))
                ),
                side: BorderSide(
                  
                  width: 1.0,
                  color: Colors.red.shade400,
                  style: BorderStyle.solid,
                ),
              ),
              onPressed: (){

       /* context.read<> */

            }, child: Container(
              height: size.height/30,
              width: size.width/2,
              alignment: Alignment.center,
         
              child: const Text("Place Order",style: TextStyle(color: Colors.red),)))
          ],
        ),
      ),
    );
  }
}
