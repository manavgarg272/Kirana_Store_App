import 'package:kirna_store_app/core/usecase/usecases.dart';
import 'package:kirna_store_app/feature/order_summary/data/model/user_order_model.dart';
import 'package:kirna_store_app/feature/order_summary/domain/repo/order_summary_repo.dart';

class OrderHistoryUseCase extends UseCase<List<UserOrderPlacedModel>, String> {
  OrderSummaryRepo orderSummaryRepo;
  OrderHistoryUseCase({required this.orderSummaryRepo});
  @override
  Future<List<UserOrderPlacedModel>> call(String params) {
    return orderSummaryRepo.getUserDataFromOrderSummary(userId: params);
  }
}
