import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kirna_store_app/core/services/firebase_service/firebase_service.dart';
import 'package:kirna_store_app/feature/home_screen/data/model/product_category_model.dart';
/* import 'package:kirna_store_app/feature/home_screen/data/model/product_model.dart'; */

abstract class ProductDs {
  Future<List<CategoryModel>> getProductCategoryListDs();
}

class ProductRepoDsImpl extends ProductDs {
  @override
  Future<List<CategoryModel>> getProductCategoryListDs() async {
    List<CategoryModel> categoryModel = [];
    try {
      FirestoreDatabase fd = FirestoreDatabase();
      QuerySnapshot? snapshot = await fd.readDataFromCollection("CategoryData");
      for (var doc in snapshot!.docs) {
        var categoryData = doc.data() as Map<String, dynamic>;
        categoryModel.add(CategoryModel.fromJson(categoryData));
      }
    } catch (e) {
      print("listofproducts $e");
    }
    return categoryModel;
  }
}
