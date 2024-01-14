import 'package:flutter/material.dart';
import 'package:kirna_store_app/feature/product_subcategory/data/data_source/sub_category_ds.dart';
import 'package:kirna_store_app/feature/product_subcategory/data/model/sub_category_model.dart';
import 'package:kirna_store_app/feature/product_subcategory/data/repo_impl/sub_category_repo_impl.dart';
import 'package:kirna_store_app/feature/product_subcategory/domain/use_case/product_sub_uc.dart';

enum SubCategoryNotifierState { loading, error, loaded, initial }

class SubCategoryNotifier extends ChangeNotifier {

  SubCategoryNotifierState _subcategoryRepoNotifierState =
      SubCategoryNotifierState.initial;
  SubCategoryNotifierState get subcategoryRepoNotifierState =>
      _subcategoryRepoNotifierState;
  set subcategoryRepoNotifierState(SubCategoryNotifierState value) {
    _subcategoryRepoNotifierState = value;
    notifyListeners();
  }

  final SubCategoryUseCase _subCategoryUseCase = SubCategoryUseCase(
      subCategoryRepo: SubcategoryRepoImpl(subCategoyrDs: SubCategoryDsImpl()));

   Map<String,List<SubCategoryModel>> _subCategoryMapData ={};
   Map<String,List<SubCategoryModel>> get subCategoryMapData =>_subCategoryMapData; 
  Future<void> getSubCategoryData( {required String categoryData}) async {
  
    try {
      subcategoryRepoNotifierState = SubCategoryNotifierState.loading;
      _subCategoryMapData[categoryData] = await _subCategoryUseCase(categoryData);
      subcategoryRepoNotifierState = SubCategoryNotifierState.loaded;
      notifyListeners();
    } catch (e) {
      print("subcategorydata $e");
    }
  }
}
