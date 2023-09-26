



import 'package:kirna_store_app/feature/product_view/data/data_source/product_list_ds.dart';
import 'package:kirna_store_app/feature/product_view/data/model/product_model.dart';
import 'package:kirna_store_app/feature/product_view/domain/repo/product_list_repo.dart';

class ProductListRepoImpl extends ProductListRepo{

  ProductListDs productListDs;
  ProductListRepoImpl({ required this.productListDs});
  @override
  Future<List<ProductModel>> productListModel({required String category}) {
      return productListDs.productListDs();
  }

}