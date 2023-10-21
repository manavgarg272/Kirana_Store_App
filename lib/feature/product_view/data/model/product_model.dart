class ProductModel {
  String productName;
  int  productQuantity;
  String productQuatityLeft;
  List<String> imagesList;
  int productPrice;
  String subCategoryId;
  String productDescription; // Fixed the typo in variable name
  String categoryId;
  String productId;
  ProductModel({
    required this.productName,
    required this.productId,
    required this.productQuantity,
    required this.productQuatityLeft,
    required this.imagesList,
    required this.subCategoryId,
    required this.productDescription, // Fixed the variable name
    required this.categoryId, 
    required this.productPrice
  });

  factory ProductModel.fromJson(Map<String, dynamic> map, String productId) {
    return ProductModel(
      productId: productId,
      productName: map["productName"] ?? "", // Corrected the JSON keys
      productQuantity: map["productQuantity"] ??0, // Corrected the JSON keys
      productQuatityLeft: map["productQuatityLeft"] ?? "", // Corrected the JSON keys
      imagesList: List<String>.from(map["imagesList"] ?? []), // Corrected and added type conversion
      productDescription: map["productDescription"] ?? "", // Corrected the JSON key
      categoryId: map["categoryId"] ?? "", // Corrected the JSON
      productPrice: map["productPrice"]??0,
      subCategoryId: map["subCategoryId"]??""
    );
  }

  Map<String, dynamic> toJson() => {
        "productName": productName,
        "productQuantity": productQuantity,
        "productQuatityLeft": productQuatityLeft,
        "imagesList": imagesList,
        "productDescription": productDescription,
        "categoryId":categoryId,
        "productPrice": productPrice,
        "subCategoryId":subCategoryId,
      };
}
