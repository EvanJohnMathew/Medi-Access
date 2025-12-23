import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '../cloud_functions/cloud_functions.dart';
import 'models/razorpay_models.dart';
import 'razorpay_checkout/razorpay_checkout_stub.dart'
    if (dart.library.html) 'razorpay_checkout/razorpay_checkout_web.dart';

enum PaymentStatus {
  idle,
  processing,
  success,
  failed,
}

final bool _isProd = false;

// Razorpay Credentials
const _kProdRazorpayKeyId = '';
const _kTestRazorpayKeyId = 'rzp_test_4pqjyDj1aZpQC6';
const _kBusinessName = 'Medi-Access';

String get razorpayKeyId => _isProd ? _kProdRazorpayKeyId : _kTestRazorpayKeyId;
String get createOrderCallName => _isProd ? 'createOrder' : 'testCreateOrder';
String get verifySignatureCallName =>
    _isProd ? 'verifySignature' : 'testVerifySignature';

Future<void> processRazorpayPayment(
  BuildContext context, {
  required int amount,
  required String currency,
  required Function(String?) onReceivedResponse,
  String? receipt,
  String? userName,
  String? userEmail,
  String? userContact,
  String? description,
  String? dialogColor,
  Color? processingColor,
  Color? errorColor,
  Color? successColor,
  Color? textColor,
  Color barrierColor = Colors.black45,
  int timeout = 180,
}) async {
  await showModalBottomSheet(
    context: context,
    barrierColor: barrierColor,
    isDismissible: false,
    builder: (context) {
      return RazorpayPaymentSheet(
        amount: amount,
        currency: currency,
        receipt: receipt,
        description: description,
        userName: userName,
        userEmail: userEmail,
        userContact: userContact,
        dialogColor: dialogColor,
        processingColor: processingColor,
        errorColor: errorColor,
        successColor: successColor,
        textColor: textColor,
        timeout: timeout,
        onPaymentStateChange: onReceivedResponse,
      );
    },
  );
}

class RazorpayPaymentSheet extends StatefulWidget {
  const RazorpayPaymentSheet({
    super.key,
    required this.amount,
    required this.currency,
    required this.timeout,
    required this.onPaymentStateChange,
    this.receipt,
    this.userName,
    this.userEmail,
    this.userContact,
    this.description,
    this.processingColor,
    this.errorColor,
    this.successColor,
    this.dialogColor,
    this.textColor,
  });

  final int amount;
  final String currency;
  final int timeout;
  final Function(String?) onPaymentStateChange;
  final String? receipt;
  final String? userName;
  final String? userEmail;
  final String? userContact;
  final String? description;
  final String? dialogColor;
  final Color? processingColor;
  final Color? errorColor;
  final Color? successColor;
  final Color? textColor;

  @override
  State<RazorpayPaymentSheet> createState() => _RazorpayPaymentSheetState();
}

class _RazorpayPaymentSheetState extends State<RazorpayPaymentSheet> {
  late final Razorpay _razorpay;
  late final RazorpayCheckout _razorpayCheckout;
  late PaymentStatus _paymentStatus;
  ProcessingOrder? _processingOrderDetails;
  String _paymentResponseMessage = '';

  @override
  void initState() {
    _razorpayCheckout = RazorpayCheckout();
    _initializeRazorpay();
    _checkoutOrder();
    super.initState();
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _webCheckoutResponse(String data) {
    final checkoutResponse = RazorpayResponse.fromJson(data);
    if (checkoutResponse.isSuccessful) {
      _handlePaymentSuccess(PaymentSuccessResponse(
        checkoutResponse.paymentId,
        checkoutResponse.orderId,
        checkoutResponse.signature,
        {},
      ));
    } else {
      _handlePaymentError(PaymentFailureResponse(
        Razorpay.UNKNOWN_ERROR,
        checkoutResponse.errorDescription,
        {
          'errorCode': checkoutResponse.errorCode,
          'errorDescription': Razorpay.EVENT_PAYMENT_ERROR,
        },
      ));
    }
  }

  _initializeRazorpay() {
    _paymentStatus = PaymentStatus.idle;
    _razorpay = Razorpay();
    if (!kIsWeb) {
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    }
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    bool isValid = await _verifySignature(
      orderId: _processingOrderDetails?.id ?? '',
      paymentId: response.paymentId ?? '',
      signature: response.signature ?? '',
    );
    if (mounted) {
      if (isValid) {
        setState(() => _paymentStatus = PaymentStatus.success);
      } else {
        setState(() => _paymentStatus = PaymentStatus.failed);
      }
    }

    widget.onPaymentStateChange(response.paymentId!);
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pop(context),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    if (mounted) {
      setState(() {
        _processingOrderDetails = null;
        _paymentStatus = PaymentStatus.failed;
        _paymentResponseMessage = response.message ?? '';
      });
    }
    widget.onPaymentStateChange(null);
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pop(context),
    );
  }

  Future<bool> _verifySignature({
    required String orderId,
    required String paymentId,
    required String signature,
  }) async {
    try {
      final response = await makeCloudCall(
        verifySignatureCallName,
        {
          'orderId': orderId,
          'paymentId': paymentId,
          'signature': signature,
        },
      );
      return response['isValid'];
    } on FirebaseFunctionsException catch (error) {
      debugPrint('ERROR: ${error.code} (${error.details}): ${error.message}');
    }
    return false;
  }

  Future<void> _checkoutOrder() async {
    if (mounted) {
      setState(() => _processingOrderDetails = null);
    }
    try {
      final response = await makeCloudCall(
        createOrderCallName,
        {
          'amount': widget.amount,
          'currency': widget.currency,
          'receipt': widget.receipt,
          'description': widget.description,
        },
      );
      final orderDetails = ProcessingOrder.fromMap(response);
      if (mounted) {
        setState(() => _processingOrderDetails = orderDetails);
      }
    } on FirebaseFunctionsException catch (error) {
      debugPrint('ERROR: ${error.code} (${error.details}): ${error.message}');
    }

    if (_processingOrderDetails != null) {
      final options = RazorpayOptions(
        key: razorpayKeyId,
        amount: widget.amount,
        businessName: _kBusinessName,
        orderId: _processingOrderDetails!.id!,
        description: widget.description,
        notes: {
          'flutterflow': 'Payment powered by FlutterFlow',
        },
        timeout: widget.timeout,
        prefill: Prefill(
          userName: widget.userName,
          userEmail: widget.userEmail,
          userContact: widget.userContact,
        ),
        retry: Retry(enabled: false),
        theme: RazorpayTheme(color: widget.dialogColor),
      ).toMap();
      if (kIsWeb) {
        _razorpayCheckout.checkout(options, _webCheckoutResponse);
      } else {
        _razorpay.open(options);
      }
    }
  }

  Widget circularProgressIndicator() => SizedBox(
        height: 26,
        width: 26,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            widget.textColor ?? Colors.white,
          ),
          strokeWidth: 3,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor;
    final String text;
    final Widget trailingWidget;
    switch (_paymentStatus) {
      case PaymentStatus.processing:
        backgroundColor = widget.processingColor ?? Colors.blue;
        text = 'Processing...';
        trailingWidget = circularProgressIndicator();
        break;
      case PaymentStatus.success:
        backgroundColor = widget.successColor ?? Colors.green;
        text = 'Payment Successful';
        trailingWidget = CircleAvatar(
          backgroundColor: Colors.black45,
          child: Icon(
            Icons.check,
            color: widget.textColor ?? Colors.white,
            size: 26,
          ),
        );

        break;
      case PaymentStatus.failed:
        backgroundColor = widget.errorColor ?? Colors.red;
        text = 'Payment Failed';
        trailingWidget = CircleAvatar(
          backgroundColor: Colors.black45,
          child: Icon(
            Icons.close,
            color: widget.textColor ?? Colors.white,
            size: 26,
          ),
        );
        break;
      default:
        backgroundColor = widget.processingColor ?? Colors.blue;
        text = 'Processing...';
        trailingWidget = circularProgressIndicator();
        break;
    }
    return Container(
      width: double.maxFinite,
      color: backgroundColor,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_paymentStatus == PaymentStatus.processing)
              LinearProgressIndicator(
                backgroundColor: backgroundColor,
                color: backgroundColor.applyAlpha(0.5),
                minHeight: 5,
              ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text,
                          style: TextStyle(
                            color: widget.textColor ?? Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.8,
                          ),
                        ),
                        if (_paymentResponseMessage.isNotEmpty)
                          Text(
                            _paymentResponseMessage,
                            style: TextStyle(
                              color: widget.textColor ?? Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.8,
                            ),
                          ),
                      ],
                    ),
                  ),
                  trailingWidget,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
