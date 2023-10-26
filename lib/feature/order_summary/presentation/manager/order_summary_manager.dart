import 'package:flutter/foundation.dart';
import 'package:kirna_store_app/feature/order_summary/data/data_source/order_summary_ds.dart';
import 'package:kirna_store_app/feature/order_summary/data/model/order_summary_model.dart';
import 'package:kirna_store_app/feature/order_summary/data/model/user_order_model.dart';
import 'package:kirna_store_app/feature/order_summary/data/repo_impl/order_summary_repo_impl.dart';
import 'package:kirna_store_app/feature/order_summary/domain/use_case/order_summary_use_case.dart';

enum OrderSummaryNotifierState { initial, loading, loaded, error }

class OrderSummaryNotifier extends ChangeNotifier {

  
  final Map<String, OrderSummaryItemModel> _orderItemData =
      <String, OrderSummaryItemModel>{};
  Map<String, OrderSummaryItemModel> get orderItemData => _orderItemData;

  int _orderTotalAmount = 0;
  int get orderTotalAmount => _orderTotalAmount;
  set orderTotalAmount(int value) {
    _orderTotalAmount += value;
    notifyListeners();
  }

  void addOrderAmount(int value) {
    _orderTotalAmount += value;
    notifyListeners();
  }

  void removeOrderAmount(int value) {
    _orderTotalAmount -= value;
    notifyListeners();
  }

  void addItemToOrderSummaryList(String key, OrderSummaryItemModel data) {
    if (_orderItemData.containsKey(key)) {
      _orderItemData.update(key, (value) => data);
    } else {
      _orderItemData[key] = data;
    }
    notifyListeners();
  }

  void removeProductFromMap(String key) {
    if (_orderItemData.containsKey(key)) {
      _orderItemData.remove(key);
    }
    notifyListeners();
  }
  void emptyOrderListMap(){
    _orderItemData.clear();
    notifyListeners();
  }

  final OrderSummaryRepoUc _orderSummaryRepoUc = OrderSummaryRepoUc(
      orderSummaryRepo:
          OrderSummaryRepoImpl(orderSummaryDs: OrderSummaryDsImpl()));
  OrderSummaryNotifierState _orderSummaryNotifierState =
      OrderSummaryNotifierState.initial;
  OrderSummaryNotifierState get orderSummaryNotifierState =>
      _orderSummaryNotifierState;
  set orderSummaryNotifierState(OrderSummaryNotifierState value) {
    _orderSummaryNotifierState = value;
    notifyListeners();
  }

  Future<void> placeUserOrderToFirebase(
      {required UserOrderPlacedModel userOrderPlacedModel}) async {
    try {
      orderSummaryNotifierState = OrderSummaryNotifierState.loading;
      await _orderSummaryRepoUc(userOrderPlacedModel);
      orderSummaryNotifierState = OrderSummaryNotifierState.loaded;
    } catch (e) {
      print("placeuserorder $e");
    }
  }
}
