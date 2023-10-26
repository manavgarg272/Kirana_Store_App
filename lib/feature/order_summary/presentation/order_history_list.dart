import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirna_store_app/feature/order_summary/data/model/user_order_model.dart';
import 'package:kirna_store_app/feature/order_summary/presentation/widget/order_summary_widget.dart';

class OrderHistoryListPage extends StatefulWidget {
  final UserOrderPlacedModel userOrderPlaced;
  const OrderHistoryListPage({super.key, required this.userOrderPlaced});

  @override
  State<OrderHistoryListPage> createState() => _OrderHistoryListPageState();
}

class _OrderHistoryListPageState extends State<OrderHistoryListPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "Order History List",
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
              children: widget.userOrderPlaced.orderList.entries.map((entry) {
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
              "Total Order Amount is Rs 200",
              style: GoogleFonts.roboto(
                  fontSize: size.height / 50, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
