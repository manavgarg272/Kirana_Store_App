



import 'package:kirna_store_app/core/usecase/usecases.dart';
import 'package:kirna_store_app/feature/order_summary/data/model/user_order_model.dart';
import 'package:kirna_store_app/feature/order_summary/domain/repo/order_summary_repo.dart';

class OrderSummaryRepoUc extends UseCase<void, UserOrderPlacedModel>{
  final OrderSummaryRepo orderSummaryRepo;
  OrderSummaryRepoUc({
    required this.orderSummaryRepo
  });
  @override
  Future<void> call(UserOrderPlacedModel params) {
   return orderSummaryRepo.userOrderSummary(userOrderPlacedModel: params);
  }

}