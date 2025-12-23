import 'dart:convert';

class RazorpayOptions {
  RazorpayOptions({
    required this.key,
    required this.amount,
    required this.businessName,
    required this.orderId,
    this.description,
    this.notes,
    this.timeout,
    this.prefill,
    this.retry,
    this.theme,
  });

  final String key;
  final int amount;
  final String businessName;
  final String orderId;
  final String? description;
  final Map<String, dynamic>? notes;
  final int? timeout;
  final Prefill? prefill;
  final Retry? retry;
  final RazorpayTheme? theme;

  factory RazorpayOptions.fromJson(String str) =>
      RazorpayOptions.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RazorpayOptions.fromMap(Map<String, dynamic> json) => RazorpayOptions(
        key: json['key'],
        amount: json['amount'],
        businessName: json['name'],
        orderId: json['order_id'],
        description: json['description'],
        notes: json['notes'],
        timeout: json['timeout'],
        prefill: Prefill.fromMap(json['prefill']),
        retry: Retry.fromMap(json['retry']),
        theme: RazorpayTheme.fromMap(json['theme']),
      );

  Map<String, dynamic> toMap() => {
        'key': key,
        'amount': amount,
        'name': businessName,
        'order_id': orderId,
        'description': description,
        'notes': notes,
        'timeout': timeout,
        'prefill': prefill?.toMap(),
        'retry': retry?.toMap(),
        'theme': theme?.toMap(),
      };
}

class Prefill {
  Prefill({
    this.userName,
    this.userEmail,
    this.userContact,
  });

  final String? userName;
  final String? userEmail;
  final String? userContact;

  factory Prefill.fromJson(String str) => Prefill.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Prefill.fromMap(Map<String, dynamic> json) => Prefill(
        userName: json['name'],
        userEmail: json['email'],
        userContact: json['contact'],
      );

  Map<String, dynamic> toMap() => {
        'name': userName,
        'email': userEmail,
        'contact': userContact,
      };
}

class Retry {
  Retry({
    required this.enabled,
  });

  final bool enabled;

  factory Retry.fromJson(String str) => Retry.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Retry.fromMap(Map<String, dynamic> json) => Retry(
        enabled: json['enabled'],
      );

  Map<String, dynamic> toMap() => {
        'enabled': enabled,
      };
}

class RazorpayTheme {
  RazorpayTheme({
    this.hideTopbar,
    this.color,
    this.backdropColor,
  });

  final bool? hideTopbar;
  final String? color;
  final String? backdropColor;

  factory RazorpayTheme.fromJson(String str) =>
      RazorpayTheme.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RazorpayTheme.fromMap(Map<String, dynamic> json) => RazorpayTheme(
        hideTopbar: json['hide_topbar'],
        color: json['color'],
        backdropColor: json['backdrop_color'],
      );

  Map<String, dynamic> toMap() => {
        'hide_topbar': hideTopbar,
        'color': color,
        'backdrop_color': backdropColor,
      };
}
