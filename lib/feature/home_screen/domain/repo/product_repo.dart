
import 'package:kirna_store_app/feature/home_screen/data/model/product_category_model.dart';

abstract class ProductRepo{

  Future<List<CategoryModel>> getProductCategoryList();

}