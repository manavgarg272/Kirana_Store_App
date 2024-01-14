import 'package:flutter/material.dart';
import 'package:kirna_store_app/feature/home_screen/data/data_source/product_ds.dart';
import 'package:kirna_store_app/feature/home_screen/data/model/product_category_model.dart';
import 'package:kirna_store_app/feature/home_screen/data/repo_impl/product_repo_impl.dart';
import 'package:kirna_store_app/feature/home_screen/domain/use_case/category_use_case.dart';

enum ProductCategoyrNotifierState { initial, loading, loaded, error }

class ProductCategoryNotifier extends ChangeNotifier {
  ProductCategoyrNotifierState _productCategoryNotifierState =
      ProductCategoyrNotifierState.initial;
  ProductCategoyrNotifierState get productCategoryNotifierState =>
      _productCategoryNotifierState;
  set productCategoryNotifierState(ProductCategoyrNotifierState value) {
    _productCategoryNotifierState = value;
    notifyListeners();
  }

  List<CategoryModel> _getCategoryModel = [];

  List<CategoryModel> get getCategoryModel => _getCategoryModel;

  set getCategoryModel(List<CategoryModel> value) {
    _getCategoryModel = value;
    notifyListeners();
  }

  final CategoryListUseCase _categoryUseCase = CategoryListUseCase(
      productRepo: ProductListCaetgoryRepoImpl(productDs: ProductRepoDsImpl()));

  void getProductCategoryData() async  {
    try {
      productCategoryNotifierState = ProductCategoyrNotifierState.loading;
      getCategoryModel = await _categoryUseCase();
      productCategoryNotifierState = ProductCategoyrNotifierState.loaded;
    } catch (e) {
      print("getproductcategorydata $e");
    }
  }
}
