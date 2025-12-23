import 'razorpay_checkout_base.dart';

class RazorpayCheckout extends RazorpayCheckoutBase {
  @override
  void checkout(
    Map<String, dynamic> options,
    Function(String) webCheckoutResponse,
  ) {
    throw Exception("Stub implementation");
  }
}
