

import 'package:kirna_store_app/feature/product_view/data/model/product_model.dart';

abstract class  ProductListDs {
  Future<List<ProductModel>> productListDs();
}

class ProductListDsImpl extends ProductListDs {
  
  @override
  Future<List<ProductModel>> productListDs() async {
  
    List<ProductModel> productList = [];
    return productList;
  }


}