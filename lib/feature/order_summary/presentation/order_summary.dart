import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirna_store_app/feature/order_summary/data/model/user_order_model.dart';
import 'package:kirna_store_app/feature/order_summary/presentation/manager/order_summary_manager.dart';
import 'package:kirna_store_app/feature/order_summary/presentation/order_success_widget.dart';
import 'package:kirna_store_app/feature/order_summary/presentation/widget/order_summary_widget.dart';
import 'package:kirna_store_app/feature/user_details/presentation/manager/location_manager.dart';
import 'package:kirna_store_app/feature/user_details/presentation/manager/user_manager.dart';
import 'package:kirna_store_app/feature/user_details/presentation/user_details.dart';
import 'package:provider/provider.dart';

class OrderSummaryWidget extends StatefulWidget {
  const OrderSummaryWidget({super.key});

  @override
  State<OrderSummaryWidget> createState() => _OrderSummaryWidgetState();
}

class _OrderSummaryWidgetState extends State<OrderSummaryWidget>
    with SingleTickerProviderStateMixin {
  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return const DraggableBottomSheet();
        });
  }

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
              "Total Order Amount is Rs ${context.watch<OrderSummaryNotifier>().orderTotalAmount}",
              style: GoogleFonts.roboto(
                  fontSize: size.height / 50, fontWeight: FontWeight.w500),
            ),
            Divider(
              indent: size.height / 30,
              endIndent: size.height / 30,
            ),
            SizedBox(height: size.height / 40),
            Builder(builder: (context) {
              if (context.read<GetUserLocationNotifier>().userAddress.isEmpty) {
                return Container();
              }

              return Container(
                padding: EdgeInsets.all(size.height / 50),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.grey.shade300)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Address",
                      style: GoogleFonts.roboto(
                          fontSize: size.height / 45,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: size.height / 80,
                    ),
                    Text(
                        '${context.read<GetUserLocationNotifier>().userAddress[0].address}'),
                  ],
                ),
              );
            }),
            SizedBox(
              height: size.height / 40,
            ),
            /* OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(size.height / 80)),
                ),
                side: BorderSide(
                  width: 1.0,
                  color: Colors.red.shade400,
                  style: BorderStyle.solid,
                ),
              ),
              onPressed: () async {
                if (context.watch<GetUserLocationNotifier>().userAddress.isEmpty) {
                  await context.read<LocationManagerNotifer>().getCurrentPosition(context);
                  _modalBottomSheetMenu();
                  await context.read<GetUserLocationNotifier>().getUserLocationAddress(
                    uuid: FirebaseAuth.instance.currentUser!.uid,
                  );
                } else {
                  await context.read<OrderSummaryNotifier>().placeUserOrderToFirebase(
                    userOrderPlacedModel: UserOrderPlacedModel(
                      orderList: context.read<OrderSummaryNotifier>().orderItemData,
                      totalAmount: context.read<OrderSummaryNotifier>().orderTotalAmount,
                      userId: FirebaseAuth.instance.currentUser!.uid,
                      orderStatus: 'INITIATED',
                    ),
                  );
            
                  if (context.read<OrderSummaryNotifier>().orderSummaryNotifierState ==
                      OrderSummaryNotifierState.loaded) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return OrderSuccessDialog();
                      },
                    );
            
                    context.read<OrderSummaryNotifier>().orderSummaryNotifierState = OrderSummaryNotifierState.initial;
                  }
                }
              },
              child: Container(
                height: size.height / 30,
                width: size.width / 2,
                alignment: Alignment.center,
                child: (context.watch<LocationManagerNotifer>().getLocationNotifier ==
                            GetLocationStateNoitiferState.loading ||
                        context.watch<OrderSummaryNotifier>().orderSummaryNotifierState ==
                            OrderSummaryNotifierState.loading)
                    ? const CircularProgressIndicator()
                    : Text(
                        context.watch<GetUserLocationNotifier>().userAddress.isEmpty
                            ? "Get Address"
                            : "Place Order",
                        style: const TextStyle(color: Colors.red),
                      ),
              ),
            )
             */
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(size.height / 80))),
                  side: BorderSide(
                    width: 1.0,
                    color: Colors.red.shade400,
                    style: BorderStyle.solid,
                  ),
                ),
                onPressed: () async {
                  if (context
                      .read<GetUserLocationNotifier>()
                      .userAddress
                      .isEmpty) {
                    await context
                        .read<LocationManagerNotifer>()
                        .getCurrentPosition(context);
                    _modalBottomSheetMenu();
                    context
                        .read<GetUserLocationNotifier>()
                        .getUserLocationAddress(
                            uuid: FirebaseAuth.instance.currentUser!.uid);
                  }
               
                  else {
             
                    await context
                        .read<OrderSummaryNotifier>()
                        .placeUserOrderToFirebase(
                            userOrderPlacedModel: UserOrderPlacedModel(
                              createdAt: DateTime.now(),
                                orderList: context
                                    .read<OrderSummaryNotifier>()
                                    .orderItemData,
                                totalAmount: context
                                    .read<OrderSummaryNotifier>()
                                    .orderTotalAmount,
                                userId: FirebaseAuth.instance.currentUser!.uid,
                                orderStatus: 'INITIATED'));
            
               
                              if (context
                            .read<OrderSummaryNotifier>()
                            .orderSummaryNotifierState ==
                        OrderSummaryNotifierState.loaded) {
                          context
                            .read<OrderSummaryNotifier>().emptyOrderListMap();
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return OrderSuccessDialog();
                            });
                            context.read<OrderSummaryNotifier>().orderSummaryNotifierState = OrderSummaryNotifierState.initial;
                    }
                  }
                },
                child: Container(
                    height: size.height / 30,
                    width: size.width / 2,
                    alignment: Alignment.center,
                    child: (context
                                    .watch<LocationManagerNotifer>()
                                    .getLocationNotifier ==
                                GetLocationStateNoitiferState.loading ||
                            context
                                    .watch<OrderSummaryNotifier>()
                                    .orderSummaryNotifierState ==
                                OrderSummaryNotifierState.loading)
                        ? const CircularProgressIndicator()
                        : Text(
                            context
                                    .watch<GetUserLocationNotifier>()
                                    .userAddress
                                    .isEmpty
                                ? "Get Address"
                                : "Place Order",
                            style: const TextStyle(color: Colors.red),
                          )))
          ],
        ),
      ),
    );
  }
}
