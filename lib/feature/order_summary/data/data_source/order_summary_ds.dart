import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kirna_store_app/core/services/firebase_service/firebase_service.dart';
import 'package:kirna_store_app/feature/order_summary/data/model/user_order_model.dart';

abstract class OrderSummaryDs {
  Future<void> setUserDataToOrderSummary(
      {required UserOrderPlacedModel orderPlacedModel});
  Future<List<UserOrderPlacedModel>> getUserDataFromOrderSummary(
      {required String userId});
}

class OrderSummaryDsImpl extends OrderSummaryDs {
  @override
  Future<void> setUserDataToOrderSummary(
      {required UserOrderPlacedModel orderPlacedModel}) async {
    try {
      FirestoreDatabase fb = FirestoreDatabase();
      fb.writeData('OrderSummaryData', orderPlacedModel.toJson());
      return;
    } catch (e) {
      print("setuserdata to orderSummary $e");
    }
  }

  @override
  Future<List<UserOrderPlacedModel>> getUserDataFromOrderSummary(
      {required String userId}) async {
    List<UserOrderPlacedModel> userOrdersPlaced = [];
    try {
      FirestoreDatabase fb = FirestoreDatabase();
      QuerySnapshot? querySnapshot =
          await fb.readDataFromCollectionWithFilterEqual(
              'OrderSummaryData', 'userId', userId);
      for (var doc in querySnapshot!.docs) {
        var userOrder = doc.data() as Map<String, dynamic>;
        userOrdersPlaced.add(UserOrderPlacedModel.fromJson(userOrder));
      }
    } catch (e) {
      print("userorderplacemodel $e");
    }
    return userOrdersPlaced;
  }
}
