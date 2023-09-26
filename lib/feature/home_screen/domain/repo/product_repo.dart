


import 'package:kirna_store_app/feature/home_screen/data/model/banner_model.dart';
import 'package:kirna_store_app/feature/home_screen/data/model/product_category_model.dart';

abstract class ProductRepo{
  
  Future<List<BannerModel>> getProductBannerList();
  Future<List<ProductCategoryModel>> getProductCategoryList();

}