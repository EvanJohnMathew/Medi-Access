import 'dart:convert';

import 'package:js/js.dart';

import 'razorpay_checkout_base.dart';

@JS('handleWebCheckoutResponse')
external set handleWebCheckoutResponse(Function(String data) f);

@JS('checkout')
external checkoutWeb(String optionsStr);

class RazorpayCheckout extends RazorpayCheckoutBase {
  @override
  void checkout(
    Map<String, dynamic> options,
    Function(String) webCheckoutResponse,
  ) async {
    handleWebCheckoutResponse = allowInterop(webCheckoutResponse);
    checkoutWeb(jsonEncode(options));
  }
}
