import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirna_store_app/feature/order_summary/presentation/manager/order_history_manager.dart';
import 'package:kirna_store_app/feature/order_summary/presentation/order_history_list.dart';
import 'package:provider/provider.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context
          .read<OrderHistoryNoitifier>()
          .getOrderHistoryData(userId: FirebaseAuth.instance.currentUser!.uid);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(
            "Order History",
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600, fontSize: size.height / 40),
          ),
        ),
        body:
            context.watch<OrderHistoryNoitifier>().orderHistoryNoitifierState ==
                    OrderHistoryNoitifierState.loading
                ? Container(
                    alignment: Alignment.center,
                    child:const CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: context
                        .read<OrderHistoryNoitifier>()
                        .userOrderHistory
                        .length,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  OrderHistoryListPage(userOrderPlaced: context
                            .read<OrderHistoryNoitifier>()
                            .userOrderHistory[index],)));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: size.height / 70,
                              horizontal: size.height / 60),
                          padding: EdgeInsets.all(size.height / 60),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "View Your Order ${index + 1} ",
                                    style: GoogleFonts.roboto(),
                                  ),
                                  SizedBox(width: size.width/20,),
                                  Text(
                                    context
                                    .read<OrderHistoryNoitifier>()
                                    .userOrderHistory[index].orderStatus,
                                    style: GoogleFonts.roboto(color: Colors.green),
                                  ),
                                
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios_outlined)
                            ],
                          ),
                        ),
                      );
                    }));
  }
}
