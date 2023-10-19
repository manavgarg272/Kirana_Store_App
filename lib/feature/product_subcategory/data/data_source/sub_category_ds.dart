import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kirna_store_app/core/services/firebase_service/firebase_service.dart';
import 'package:kirna_store_app/feature/product_subcategory/data/model/sub_category_model.dart';

abstract class SubCategoryDs {
  Future<List<SubCategoryModel>> getSubCategoryDsImp(
      {required String categoryName});
}

class SubCategoryDsImpl extends SubCategoryDs {
  @override
  Future<List<SubCategoryModel>> getSubCategoryDsImp(
      {required String categoryName}) async {
    List<SubCategoryModel> subCategoryListData = [];
    try {
      FirestoreDatabase fd = FirestoreDatabase();

      QuerySnapshot? querySnapshot =
          await fd.readDataFromCollectionWithFilterEqual(
              'SubCategoryData', 'categoryId', categoryName);

      for (var doc in querySnapshot!.docs) {
        var categoryData = doc.data() as Map<String, dynamic>;

        subCategoryListData.add(SubCategoryModel.fromJson(categoryData));
      }
    } catch (e) {
      print("subcategoryexception $e");
    }

    return subCategoryListData;
  }
}
