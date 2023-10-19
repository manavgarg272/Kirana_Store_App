

class CategoryModel {
  String categoryId;
  String categoryName;
  String categoryImage;
  CategoryModel(
      {required this.categoryId,
      required this.categoryName,
      required this.categoryImage});


    factory CategoryModel.fromJson(Map<String, dynamic>  map){
      return CategoryModel(
        categoryId: map["categoryId"]??"",
        categoryImage: map["categoryImage"]??"",
        categoryName: map["categoryName"]??"",
      );
    } 


  Map<String, String> toJson() => {
        "categoryId": categoryId,
        "categoryName": categoryName,
        "categoryImage": categoryImage
      };
}