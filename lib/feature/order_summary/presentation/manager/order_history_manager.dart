

import 'package:flutter/cupertino.dart';

enum OrderHistoryNoitifierState {initial , loading , loaded, error}
class OrderHistoryNoitifier extends ChangeNotifier{

  OrderHistoryNoitifierState _orderHistoryNoitifierState = OrderHistoryNoitifierState.initial;

  
  void getOrderHistoryData({required String userId}){
   try{

   }
   catch(e){
    print("orderhistorydata $e");
   }
  }
}