import 'package:cloud_firestore/cloud_firestore.dart';

class LedgerModel {
  final TransactionType transactionType;
  final String from;
  final String to;
  final String receiverPhone;
  final double amount;
  final String status;
  final String transactionId;
  final String idempotencyKey;
  final DateTime? timestamp;

  LedgerModel({
    required this.from,
    required this.to,
    required this.amount,
    required this.status,
    required this.transactionId,
    required this.idempotencyKey,
    this.timestamp,
    required this.receiverPhone,
    required this.transactionType,
  });

  factory LedgerModel.fromJson(Map<String, dynamic> json, String docId) {
    return LedgerModel(
      transactionType: TransactionType.values.byName(json['transactionType']),
      from: json['from'] ?? '',
      to: json['to'] ?? '',
      amount: (json['amount'] as num).toDouble(),
      status: json['status'] ?? '',
      receiverPhone: json['receiverPhone'] ?? '',
      transactionId: docId,
      idempotencyKey: json['idempotencyKey'] ?? '',
      timestamp: (json['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transactionType': transactionType.name,
      'from': from,
      'to': to,
      'amount': amount,
      'status': status,
      'transactionId': transactionId,
      'idempotencyKey': idempotencyKey,
      'timestamp': FieldValue.serverTimestamp(),
      'receiverPhone': receiverPhone,
    };
  }
}

enum TransactionType { transfer, deposit }
