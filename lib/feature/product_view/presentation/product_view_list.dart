import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirna_store_app/feature/home_screen/presentation/manager/product_category.dart';
import 'package:kirna_store_app/feature/home_screen/presentation/widget/checkout_button.dart';
import 'package:kirna_store_app/feature/product_subcategory/presentation/manager/product_sub_category.dart';
import 'package:kirna_store_app/feature/product_view/presentation/manager/product_list_notifier.dart';
import 'package:kirna_store_app/feature/product_view/presentation/show_product_list.dart';
import 'package:provider/provider.dart';

class ProductViewList extends StatefulWidget {
  final String categoryId;
  const ProductViewList({super.key, required this.categoryId});

  @override
  State<ProductViewList> createState() => _ProductViewListState();
}

class _ProductViewListState extends State<ProductViewList> {
  int current = 0;

  @override
  void initState() {

    context.read<ProductListNotifier>().productList.clear(); 
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    if(!context.read<SubCategoryNotifier>().subCategoryMapData.containsKey(widget.categoryId)){
      await context
          .read<SubCategoryNotifier>()
          .getSubCategoryData(
              categoryData:widget
                  .categoryId);
      if (context.read<SubCategoryNotifier>().subCategoryMapData[widget.categoryId]!.isNotEmpty) {
        context.read<ProductListNotifier>().getProductListData(
            productCategory: context
                .read<SubCategoryNotifier>()
                .subCategoryMapData[widget.categoryId]![0]
                .subCategoryId);
      }
    }  
    else{
      if (context.read<SubCategoryNotifier>().subCategoryMapData[widget.categoryId]!.isNotEmpty) {
        context.read<ProductListNotifier>().getProductListData(
            productCategory: context
                .read<SubCategoryNotifier>()
                .subCategoryMapData[widget.categoryId]![0]
                .subCategoryId);
      }
    }
     
    });
    super.initState();
  }



  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
  
   final subCategoryList = context
   .watch<SubCategoryNotifier>()
   .subCategoryMapData[widget.categoryId];
  
    return Scaffold(
        appBar: AppBar(
          title: Text("Product List",
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600, fontSize: size.height / 40)),
        ),
        floatingActionButton: const CheckOutFloatingButton(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                height: 50,
                width: double.infinity,
                child: ListView.builder(
                    itemCount:subCategoryList
                        ?.length??0,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () async {
                          setState(() {
                            current = index;
                          });
                          await context
                              .read<ProductListNotifier>()
                              .getProductListData(
                                  productCategory: subCategoryList?[index]
                                      .subCategoryId??"");
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.all(5),
                          width: size.height / 7,
                          height: size.height / 30,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.5,
                                  color: current == index
                                      ? Colors.blue.shade400
                                      : Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              subCategoryList?[index]
                                  .subCategoryName??"",
                              style: GoogleFonts.roboto(
                                  fontSize: size.height / 70,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Builder(builder: (context) {
                if (context
                        .watch<ProductListNotifier>()
                        .productListNotifierState ==
                    ProductListNotifierState.loading) {
                  return Container(
                      height: size.height / 3,
                      alignment: Alignment.bottomCenter,
                      child: CircularProgressIndicator(
                        color: Colors.blue.shade400,
                      ));
                }
                return ProductListView(
                  productListData:
                      context.watch<ProductListNotifier>().productList,
                );
              })
            ],
          ),
        ));
  }
}
