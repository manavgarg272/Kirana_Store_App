

class SubCategoryModel {
  String categoryId;
  String subCategoryId;
  String imageLink;
  String subCategoryName;
  SubCategoryModel(
      {required this.categoryId,
      required this.imageLink,
      required this.subCategoryName,
      required this.subCategoryId});

  factory SubCategoryModel.fromJson(Map<String, dynamic> map) {
    return SubCategoryModel(
      categoryId: map["categoryId"] ?? "",
      imageLink: map["imageLink"] ?? "",
      subCategoryId: map["subCategoryId"] ?? "",
      subCategoryName: map["subCategoryName"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "categoryId": categoryId,
      "subCategoryId": subCategoryId,
      "imageLink": imageLink,
      "subCategoryName": subCategoryName
    };
  }
}