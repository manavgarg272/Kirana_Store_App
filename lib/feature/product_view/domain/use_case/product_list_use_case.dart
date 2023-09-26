


import 'package:equatable/equatable.dart';
import 'package:kirna_store_app/core/usecase/usecases.dart';
import 'package:kirna_store_app/feature/product_view/data/model/product_model.dart';
import 'package:kirna_store_app/feature/product_view/domain/repo/product_list_repo.dart';

class ProductListUseCase extends UseCase<List<ProductModel>, ParamsForProductList> {
  final ProductListRepo productRepo;
  ProductListUseCase({required this.productRepo});
  @override
  Future<List<ProductModel>> call(ParamsForProductList params) {
    return productRepo.productListModel(category: params.productCategory);
  }
}

class ParamsForProductList extends Equatable {
  final String productCategory;
  const ParamsForProductList({required this.productCategory});
  @override
  List<Object?> get props => [productCategory];
}
