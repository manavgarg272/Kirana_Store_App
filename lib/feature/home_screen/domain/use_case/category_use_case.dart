

import 'package:kirna_store_app/core/usecase/usecases.dart';
import 'package:kirna_store_app/feature/home_screen/data/model/product_category_model.dart';
import 'package:kirna_store_app/feature/home_screen/domain/repo/product_repo.dart';

class CategoryListUseCase extends UseCaseForNoParams<List<ProductCategoryModel>> {
  final ProductRepo productRepo;
  CategoryListUseCase(this.productRepo);

  @override
  Future<List<ProductCategoryModel>> call() async {
    return await productRepo.getProductCategoryList();
  }
}
