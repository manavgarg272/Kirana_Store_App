

import 'package:kirna_store_app/core/services/firebase_service/firebase_service.dart';
import 'package:kirna_store_app/feature/order_summary/data/model/user_order_model.dart';

abstract class OrderSummaryDs{
  Future<void> setUserDataToOrderSummary({required  UserOrderPlacedModel orderPlacedModel});
}




class OrderSummaryDsImpl extends OrderSummaryDs{
  @override
  Future<void> setUserDataToOrderSummary({required UserOrderPlacedModel orderPlacedModel}) async {
    try{
       FirestoreDatabase fb = FirestoreDatabase();
       fb.writeData('OrderSummaryData', orderPlacedModel.toJson());
       return ;
    }
    catch(e){
      print("setuserdata to orderSummary $e");
    }
  }
 


}