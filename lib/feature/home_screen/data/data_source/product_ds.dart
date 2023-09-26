

import 'package:kirna_store_app/feature/home_screen/data/model/banner_model.dart';
import 'package:kirna_store_app/feature/home_screen/data/model/product_category_model.dart';
/* import 'package:kirna_store_app/feature/home_screen/data/model/product_model.dart'; */

abstract class ProductDs{
  
  Future<List<BannerModel>> getProductBannerListDs();

  Future<List<ProductCategoryModel>> getProductCategoryListDs();

}


class ProductRepoDsImpl extends ProductDs{

  @override
  Future<List<BannerModel>> getProductBannerListDs() {
    // TODO: implement getProductBannerListDs
    throw UnimplementedError();
  }
  
  @override
  Future<List<ProductCategoryModel>> getProductCategoryListDs() {
    // TODO: implement getProductCategoryListDs
    throw UnimplementedError();
  }


}