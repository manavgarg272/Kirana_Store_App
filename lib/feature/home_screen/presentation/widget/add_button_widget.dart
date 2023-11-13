import 'package:flutter/material.dart';
import 'package:kirna_store_app/feature/order_summary/data/model/order_summary_model.dart';
import 'package:kirna_store_app/feature/order_summary/presentation/manager/order_summary_manager.dart';
import 'package:kirna_store_app/feature/product_view/data/model/product_model.dart';
import 'package:provider/provider.dart';

class AddButtonWidget extends StatefulWidget {
  final ProductModel productData;
  const AddButtonWidget({super.key, required this.productData});

  @override
  State<AddButtonWidget> createState() => _AddButtonWidgetState();
}

class _AddButtonWidgetState extends State<AddButtonWidget> {
  int addValue = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    if(context.read<OrderSummaryNotifier>().orderItemData.containsKey(widget.productData.productId)){  
      addValue = context.read<OrderSummaryNotifier>().orderItemData[widget.productData.productId]!.productQuantity;
      setState(() {
        
      });
    }
    });
    print("addvalue:  ${widget.productData.productId} ${context.read<OrderSummaryNotifier>().orderItemData.containsKey(widget.productData.productId)}");
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   
    return addValue == 0
        ? InkWell(
            onTap: () {
              addValue++;
              context
              .read<OrderSummaryNotifier>().addOrderAmount(widget.productData.productPrice) ;
              context.read<OrderSummaryNotifier>().addItemToOrderSummaryList(
                  widget.productData.productId,
                  OrderSummaryItemModel(
                      productName: widget.productData.productName,
                      productPricing: widget.productData.productPrice,
                      productQuantity: addValue,
                      productId: widget.productData.productId));

              setState(() {});
            },
            child: Container(
              width: size.width / 3,
              height: size.height / 22,
              alignment: Alignment.center,
              padding: EdgeInsets.all(size.height / 120),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueAccent)),
              child: const Text("ADD"),
            ),
          )
        : Container(
            padding: EdgeInsets.all(size.height / 120),
            height: size.height / 22,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blueAccent)),
            width: size.width / 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      addValue--;
                      if (addValue == 0) {
                        context
                        .read<OrderSummaryNotifier>().removeOrderAmount(widget.productData.productPrice) ;

                        context
                            .read<OrderSummaryNotifier>()
                            .removeProductFromMap(widget.productData.productId);
                      } else {
                        context
                        .read<OrderSummaryNotifier>().removeOrderAmount(widget.productData.productPrice) ;
                        context
                            .read<OrderSummaryNotifier>()
                            .addItemToOrderSummaryList(
                                widget.productData.productId,
                                OrderSummaryItemModel(
                                    productName: widget.productData.productName,
                                    productPricing:
                                        widget.productData.productPrice,
                                    productQuantity: addValue,
                                    productId: widget.productData.productId));
                      }
                      setState(() {});
                    },
                    child: const Icon(Icons.remove)),
                Text("$addValue"),
                GestureDetector(
                    onTap: () {
                      addValue++;
                      context
                      .read<OrderSummaryNotifier>().addOrderAmount(widget.productData.productPrice) ;
                      context
                          .read<OrderSummaryNotifier>()
                          .addItemToOrderSummaryList(
                              widget.productData.productId,
                              OrderSummaryItemModel(
                                  productName: widget.productData.productName,
                                  productPricing:
                                      widget.productData.productPrice,
                                  productQuantity: addValue,
                                  productId: widget.productData.productId));

                      setState(() {});
                    },
                    child: const Icon(Icons.add)),
              ],
            ),
          );
  }
}
