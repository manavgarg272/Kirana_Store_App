import 'package:flutter/widgets.dart';
import 'package:kirna_store_app/core/services/error/failure.dart';
import 'package:kirna_store_app/core/services/network_services/network_call_service.dart';

import 'package:kirna_store_app/feature/product_view/data/model/product_model.dart';

enum ProductListNotifierState { loading, loaded, error, initial }

class ProductListNotifier extends ChangeNotifier {
  late Failure _failure;
  Failure get failure => _failure;
  set failure(Failure value) {
    _failure = value;
  }

  List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;
  set productList(List<ProductModel> value) {
    _productList = value;
    notifyListeners();
  }

  ProductListNotifierState _productListNotifierState =
      ProductListNotifierState.initial;
  ProductListNotifierState get productListNotifierState =>
      _productListNotifierState;
  set productListNotifierState(ProductListNotifierState value) {
    _productListNotifierState = value;
    notifyListeners();
  }
/* 
  final ProductListUseCase _productListUseCase = ProductListUseCase(productRepo: ProductListRepoImpl(productDs: ProductListDsImpl())); */

      
  void getProductListData({required String productCategory}) async {
    try {
      productListNotifierState = ProductListNotifierState.loading;
      /* productList = await _productListUseCase(
          ParamsForProductList(productCategory: productCategory)); */
      productListNotifierState = ProductListNotifierState.loaded;
    } catch (e) {
      NetworkCallService.handleError(e, getException: (p0) {},
          getErrorMessage: ((p0) {
        failure = Failure(message: p0 ?? "Something Went Wrong");
      }));
    }
  }
}
