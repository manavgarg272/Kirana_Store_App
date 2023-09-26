



import 'package:flutter/widgets.dart';
import 'package:kirna_store_app/core/services/error/failure.dart';
import 'package:kirna_store_app/core/services/network_services/network_call_service.dart';
import 'package:kirna_store_app/feature/home_screen/data/data_source/product_ds.dart';
import 'package:kirna_store_app/feature/home_screen/data/model/banner_model.dart';

import 'package:kirna_store_app/feature/home_screen/data/repo_impl/product_repo_impl.dart';
import 'package:kirna_store_app/feature/home_screen/domain/use_case/banner_use_case.dart';

enum ProductBannerListNotifierState { loading, loaded, error, initial }

class ProductBannerListNotifier extends ChangeNotifier {
  late Failure _failure;
  Failure get failure => _failure;
  set failure(Failure value) {
    _failure = value;
  }

  List<BannerModel> _productBannerList = [];
  List<BannerModel> get productBannerList => _productBannerList;
  set productBannerList(List<BannerModel> value) {
    _productBannerList = value;
    notifyListeners();
  }

  ProductBannerListNotifierState _productListBannerNotifierState =
  ProductBannerListNotifierState.initial;
  ProductBannerListNotifierState get productListBannerNotifierState =>
  _productListBannerNotifierState;
  set productListNotifierState(ProductBannerListNotifierState value) {
    _productListBannerNotifierState = value;
    notifyListeners();
  }

  final BannerListUseCase _productBannerListUseCase = BannerListUseCase(
      productRepo: ProductListRepoImpl(productDs: ProductRepoDsImpl()));

      
  void getBannerProductListData() async {
    try {
      productListNotifierState = ProductBannerListNotifierState.loading;
      productBannerList = await _productBannerListUseCase();
      productListNotifierState = ProductBannerListNotifierState.loaded;
    } catch (e) {
      NetworkCallService.handleError(e, getException: (p0) {},
          getErrorMessage: ((p0) {
        failure = Failure(message: p0 ?? "Something Went Wrong");
      }));
    }
  }
}
