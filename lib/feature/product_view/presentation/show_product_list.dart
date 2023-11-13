

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirna_store_app/feature/product_view/data/model/product_model.dart';
import 'package:kirna_store_app/feature/home_screen/presentation/widget/add_button_widget.dart';

class ProductListView extends StatefulWidget {
  final List<ProductModel> productListData;
  const ProductListView({super.key,required this.productListData});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount:
          widget.productListData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: size.height / 5,
          padding: EdgeInsets.all(size.height / 100),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.grey.shade300)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      size.height / 90,
                      size.height / 65,
                      size.height / 100,
                      size.height / 100),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(    widget.productListData[index]
                      .imagesList[0] )),
                ),
              ),
              SizedBox(
                width: size.height / 60,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(size.height / 100),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.productListData[index]
                                  .productName,
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w800,
                                  fontSize: size.height / 60)),
                          Text(
                            widget.productListData[index]
                                  .productQuatityLeft,
                              style: GoogleFonts.roboto(
                                  fontSize: size.height / 70)),
                          Text(
                              "Rs ${  widget.productListData[index].productPrice}",
                              style: GoogleFonts.roboto(
                                  fontSize: size.height / 70)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height / 80,
                    ),
                     AddButtonWidget(productData:  widget.productListData[index] ,)
                  ],
                ),
              ),
            ],
          ),
        );
      });
  }
}