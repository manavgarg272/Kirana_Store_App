
class OrderSummaryItemModel{
   String productName;
   int productPricing;
   int productQuantity;
   String productId;

   OrderSummaryItemModel  ({
    required this.productName, 
    required this.productPricing, 
    required this.productQuantity,
    required this.productId
  });

  factory OrderSummaryItemModel.fromJson(Map<String, dynamic> json) {
    return OrderSummaryItemModel(
      productName: json['productName'],
      productPricing: json['productPricing'],
      productQuantity: json['productQuantity'],
      productId: json['productId'],
    );
  }
  Map<String, dynamic> toJson() => {
      "productName":productName,
      "productPricing":productPricing,
      "productQuantity":productQuantity,
      "productId":productId
  };
}