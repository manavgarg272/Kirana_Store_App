

import 'package:flutter/material.dart';
import 'package:kirna_store_app/core/usecase/usecases.dart';
import 'package:kirna_store_app/feature/home_screen/data/model/product_category_model.dart';
import 'package:kirna_store_app/feature/home_screen/domain/repo/product_repo.dart';

class CategoryListUseCase extends UseCaseForNoParams<List<CategoryModel>> {
  final ProductRepo productRepo;
  CategoryListUseCase({required this.productRepo});

  @override
  Future<List<CategoryModel>> call() async {
    return await productRepo.getProductCategoryList();
  }
}
