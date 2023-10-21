
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
}