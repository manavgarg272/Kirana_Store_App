

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirna_store_app/feature/order_summary/data/model/order_summary_model.dart';

class OrderSummaryWidgetCard extends StatefulWidget {
  final OrderSummaryItemModel orderModelData;
  const OrderSummaryWidgetCard({super.key, required this.orderModelData});

  @override
  State<OrderSummaryWidgetCard> createState() => _OrderSummaryWidgetCardState();
}

class _OrderSummaryWidgetCardState extends State<OrderSummaryWidgetCard> {
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        
      },
      child: Container(
        padding: EdgeInsets.all(size.height/50),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.grey.shade300)),
        margin: EdgeInsets.symmetric(
            vertical: size.height / 80,
            horizontal: size.height / 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Text(widget.orderModelData.productName,
                    textAlign: TextAlign.center,
                  
                  style: GoogleFonts.roboto(
                  fontSize: size.height / 70,fontWeight: FontWeight.w500),
                  )
                  
                  ),
            Expanded(
                child: Text(
              "x ${widget.orderModelData.productQuantity}",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: size.height / 70,fontWeight: FontWeight.w500),
                
            )),
            Expanded(
                child: Text("Rs ${widget.orderModelData.productPricing}", textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: size.height / 70,fontWeight: FontWeight.w500),
                  
              )),
            Expanded(
                child: Text("Rs ${widget.orderModelData.productPricing * widget.orderModelData.productQuantity}", textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: size.height / 70,fontWeight: FontWeight.w500),
                  
              )),
          ],
        ),
      ),
    );
  }
}