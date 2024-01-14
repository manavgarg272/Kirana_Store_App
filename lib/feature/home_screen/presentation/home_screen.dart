import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kirna_store_app/feature/home_screen/presentation/manager/product_category.dart';
import 'package:kirna_store_app/feature/product_subcategory/presentation/manager/product_sub_category.dart';
import 'package:kirna_store_app/feature/product_view/presentation/manager/product_list_notifier.dart';
import 'package:kirna_store_app/feature/product_view/presentation/product_view_list.dart';
import 'package:kirna_store_app/feature/user_details/presentation/manager/location_manager.dart';
import 'package:kirna_store_app/feature/user_details/presentation/manager/user_manager.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp)async {
      context.read<ProductCategoryNotifier>().getProductCategoryData();
      await  context
      .read<LocationManagerNotifer>()
      .getCurrentPosition(context);
     
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: size.height / 40),
              child: Text(
                'SHRI SHYAM STORE',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: size.height / 30),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: size.height / 6,
                    childAspectRatio: 0.8,
                  ),
                  shrinkWrap: true,
                  itemCount: context
                      .watch<ProductCategoryNotifier>()
                      .getCategoryModel
                      .length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  ProductViewList(

                              categoryId: context
                              .read<ProductCategoryNotifier>()
                              .getCategoryModel[index].categoryId,
                            )));
                    
                      },
                      child: Container(
                          margin: EdgeInsets.all(size.height / 100),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                context
                                    .watch<ProductCategoryNotifier>()
                                    .getCategoryModel[index]
                                    .categoryImage,
                                fit: BoxFit.fill,
                              ))),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
