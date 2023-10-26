

import 'package:flutter/cupertino.dart';
import 'package:kirna_store_app/feature/order_summary/data/data_source/order_summary_ds.dart';
import 'package:kirna_store_app/feature/order_summary/data/model/user_order_model.dart';
import 'package:kirna_store_app/feature/order_summary/data/repo_impl/order_summary_repo_impl.dart';
import 'package:kirna_store_app/feature/order_summary/domain/use_case/order_history_use_case.dart';

enum OrderHistoryNoitifierState {initial , loading , loaded, error}
class OrderHistoryNoitifier extends ChangeNotifier{

  OrderHistoryNoitifierState _orderHistoryNoitifierState = OrderHistoryNoitifierState.initial;
  OrderHistoryNoitifierState get orderHistoryNoitifierState => _orderHistoryNoitifierState;
  set orderHistoryNoitifierState(OrderHistoryNoitifierState value){
    _orderHistoryNoitifierState = value;
    notifyListeners();
  }

 final  OrderHistoryUseCase  _orderHistoryUseCase = OrderHistoryUseCase(
    orderSummaryRepo: OrderSummaryRepoImpl(
      orderSummaryDs: OrderSummaryDsImpl()
    )
  );

  List<UserOrderPlacedModel> _userOrderHistory = [];
  List<UserOrderPlacedModel> get userOrderHistory =>_userOrderHistory;
  set userOrderHistory( List<UserOrderPlacedModel> value){
     _userOrderHistory = value;
     notifyListeners();
  }
  
  void getOrderHistoryData({required String userId})async {
   try{
    orderHistoryNoitifierState = OrderHistoryNoitifierState.loading;
    userOrderHistory =  await _orderHistoryUseCase(userId);
    orderHistoryNoitifierState = OrderHistoryNoitifierState.loaded;
   }
   catch(e){
    print("orderhistorydata $e");
   }
  }
}