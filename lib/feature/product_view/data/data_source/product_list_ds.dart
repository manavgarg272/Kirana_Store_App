import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kirna_store_app/core/services/firebase_service/firebase_service.dart';
import 'package:kirna_store_app/feature/product_view/data/model/product_model.dart';

abstract class ProductListDs {
  Future<List<ProductModel>> productListDs({required String subCategoryId});
}

class ProductListDsImpl extends ProductListDs {
  @override
  Future<List<ProductModel>> productListDs(
      {required String subCategoryId}) async {
    List<ProductModel> productList = [];

    try {
      FirestoreDatabase fb = FirestoreDatabase();
      QuerySnapshot? snapshotData =
          await fb.readDataFromCollectionWithFilterEqual(
              'AllProductData', 'subCategoryId', subCategoryId);
      for (var doc in snapshotData!.docs) {
  
        var categoryData = doc.data() as Map<String, dynamic>;
        productList.add(ProductModel.fromJson(categoryData));
      }
      print("productlsitmodel ${productList.length}");
    } catch (e) {
      print("productlsitmodel $e");
    }
    return productList;
  }
}
