

import 'package:kirna_store_app/feature/home_screen/data/data_source/product_ds.dart';
import 'package:kirna_store_app/feature/home_screen/data/model/banner_model.dart';

import 'package:kirna_store_app/feature/home_screen/domain/repo/product_repo.dart';

import '../model/product_category_model.dart';

class ProductListRepoImpl extends ProductRepo {
  final ProductDs productDs;

  /// Constructs a [ProductListRepoImpl] instance with the given [productDs].
  ProductListRepoImpl({required this.productDs});

 
  @override
  Future<List<BannerModel>> getProductBannerList() async {
    return  await productDs.getProductBannerListDs();
  }
  
  @override
  Future<List<ProductCategoryModel>> getProductCategoryList()async  {
   return  await productDs.getProductCategoryListDs();
  }

  

}

