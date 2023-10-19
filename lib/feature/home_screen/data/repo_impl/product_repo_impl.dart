

import 'package:kirna_store_app/feature/home_screen/data/data_source/product_ds.dart';

import 'package:kirna_store_app/feature/home_screen/domain/repo/product_repo.dart';

import '../model/product_category_model.dart';

class ProductListCaetgoryRepoImpl extends ProductRepo {
  final ProductDs productDs;


  ProductListCaetgoryRepoImpl({required this.productDs});

 
  @override
  Future<List<CategoryModel>> getProductCategoryList()async  {
   return await productDs.getProductCategoryListDs();
  }

}

