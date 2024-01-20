import 'package:kirna_store_app/core/services/razorpay_service/interface/payment_response_interface.dart';
import 'package:kirna_store_app/core/services/razorpay_service/model/razorpay_model.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayServiceCall {
  final RazorPayModel? razorPayModel;
  final RazorPayPaymentInterface params;

  RazorPayServiceCall({required this.razorPayModel, required this.params});

  final _razorpay = Razorpay();
  void openCheckOut() {
    _razorpay.open(razorPayModel!.toJson());
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerPaymentFailure);
  }

  void handlerPaymentSuccess(PaymentSuccessResponse payment) async {
    params.handlePaymentSuccessBuilderMethod();
  }

  void handlerPaymentFailure(PaymentFailureResponse failure) async {
    params.handlePaymentFailureBuilderMethod();
  }
}
