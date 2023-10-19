

import 'package:kirna_store_app/feature/product_subcategory/data/data_source/sub_category_ds.dart';
import 'package:kirna_store_app/feature/product_subcategory/data/model/sub_category_model.dart';
import 'package:kirna_store_app/feature/product_subcategory/domain/repo/sub_category_repo.dart';

class SubcategoryRepoImpl extends SubCategoryRepo{
 
  final SubCategoryDs subCategoyrDs;
  SubcategoryRepoImpl({
    required this.subCategoyrDs
  });
  @override
  Future<List<SubCategoryModel>> subCategoryRepo({required String categoryData}) {
    return subCategoyrDs.getSubCategoryDsImp(categoryName: categoryData);
  }

}