

import 'package:kirna_store_app/feature/product_view/data/model/product_model.dart';

abstract class ProductListRepo{
  Future<List<ProductModel>> productListModel({required String category});
}