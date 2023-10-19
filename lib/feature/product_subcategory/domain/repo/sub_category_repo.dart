


import 'package:kirna_store_app/feature/product_subcategory/data/model/sub_category_model.dart';

abstract class SubCategoryRepo{

  Future<List<SubCategoryModel>> subCategoryRepo({required String categoryData});

}