import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirna_store_app/feature/home_screen/presentation/widget/add_button_widget.dart';
import 'package:kirna_store_app/feature/home_screen/presentation/widget/checkout_button.dart';
import 'package:kirna_store_app/feature/product_subcategory/presentation/manager/product_sub_category.dart';
import 'package:kirna_store_app/feature/product_view/presentation/manager/product_list_notifier.dart';
import 'package:provider/provider.dart';

class ProductViewList extends StatefulWidget {
  const ProductViewList({super.key});

  @override
  State<ProductViewList> createState() => _ProductViewListState();
}

class _ProductViewListState extends State<ProductViewList> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  int current = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (context.read<SubCategoryNotifier>().subCategoryData.isNotEmpty) {
        context.read<ProductListNotifier>().getProductListData(
            productCategory: context
                .read<SubCategoryNotifier>()
                .subCategoryData[0]
                .subCategoryId);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Product List",
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600, fontSize: size.height / 40)),
        ),
        floatingActionButton: const CheckOutFloatingButton(),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  height: 50,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: context
                          .watch<SubCategoryNotifier>()
                          .subCategoryData
                          .length,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              current = index;
                            });
                            context
                                .read<ProductListNotifier>()
                                .getProductListData(
                                    productCategory: context
                                        .read<SubCategoryNotifier>()
                                        .subCategoryData[index]
                                        .subCategoryId);
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
                                        ? Colors.purple
                                        : Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                context
                                    .watch<SubCategoryNotifier>()
                                    .subCategoryData[index]
                                    .subCategoryName,
                                style: GoogleFonts.roboto(
                                    fontSize: size.height / 70,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                ListView.builder(
                    itemCount:
                        context.watch<ProductListNotifier>().productList.length,
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
                                    size.height / 100,
                                    size.height / 65,
                                    size.height / 100,
                                    size.height / 100),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(imgList[index])),
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
                                            context
                                                .watch<ProductListNotifier>()
                                                .productList[index]
                                                .productName,
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w800,
                                                fontSize: size.height / 60)),
                                        Text(
                                            context
                                                .watch<ProductListNotifier>()
                                                .productList[index]
                                                .productQuatityLeft,
                                            style: GoogleFonts.roboto(
                                                fontSize: size.height / 70)),
                                        Text(
                                            "Rs ${context.watch<ProductListNotifier>().productList[index].productPrice}",
                                            style: GoogleFonts.roboto(
                                                fontSize: size.height / 70)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height / 80,
                                  ),
                                   AddButtonWidget(productData:context.read<ProductListNotifier>().productList[index] ,)
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
