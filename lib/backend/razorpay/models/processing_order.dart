import 'dart:convert';

class ProcessingOrder {
  ProcessingOrder({
    this.amount,
    this.amountPaid,
    this.createdAt,
    this.amountDue,
    this.currency,
    this.receipt,
    this.id,
    this.entity,
    this.status,
    this.attempts,
  });

  final int? amount;
  final int? amountPaid;
  final int? createdAt;
  final int? amountDue;
  final String? currency;
  final String? receipt;
  final String? id;
  final String? entity;
  final String? status;
  final int? attempts;

  factory ProcessingOrder.fromJson(String str) =>
      ProcessingOrder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProcessingOrder.fromMap(Map<String, dynamic> json) => ProcessingOrder(
        amount: json['amount'],
        amountPaid: json['amount_paid'],
        createdAt: json['created_at'],
        amountDue: json['amount_due'],
        currency: json['currency'],
        receipt: json['receipt'],
        id: json['id'],
        entity: json['entity'],
        status: json['status'],
        attempts: json['attempts'],
      );

  Map<String, dynamic> toMap() => {
        'amount': amount,
        'amount_paid': amountPaid,
        'created_at': createdAt,
        'amount_due': amountDue,
        'currency': currency,
        'receipt': receipt,
        'id': id,
        'entity': entity,
        'status': status,
        'attempts': attempts,
      };
}
