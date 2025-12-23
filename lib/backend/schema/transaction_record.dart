import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionRecord extends FirestoreRecord {
  TransactionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "TransactionID" field.
  String? _transactionID;
  String get transactionID => _transactionID ?? '';
  bool hasTransactionID() => _transactionID != null;

  // "DoctorName" field.
  String? _doctorName;
  String get doctorName => _doctorName ?? '';
  bool hasDoctorName() => _doctorName != null;

  // "FullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "PhoneNumber" field.
  int? _phoneNumber;
  int get phoneNumber => _phoneNumber ?? 0;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "Time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "ReasonforVisit" field.
  String? _reasonforVisit;
  String get reasonforVisit => _reasonforVisit ?? '';
  bool hasReasonforVisit() => _reasonforVisit != null;

  void _initializeFields() {
    _transactionID = snapshotData['TransactionID'] as String?;
    _doctorName = snapshotData['DoctorName'] as String?;
    _fullName = snapshotData['FullName'] as String?;
    _email = snapshotData['Email'] as String?;
    _phoneNumber = castToType<int>(snapshotData['PhoneNumber']);
    _date = snapshotData['Date'] as DateTime?;
    _time = snapshotData['Time'] as DateTime?;
    _reasonforVisit = snapshotData['ReasonforVisit'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Transaction');

  static Stream<TransactionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionRecord.fromSnapshot(s));

  static Future<TransactionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionRecord.fromSnapshot(s));

  static TransactionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionRecordData({
  String? transactionID,
  String? doctorName,
  String? fullName,
  String? email,
  int? phoneNumber,
  DateTime? date,
  DateTime? time,
  String? reasonforVisit,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'TransactionID': transactionID,
      'DoctorName': doctorName,
      'FullName': fullName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'Date': date,
      'Time': time,
      'ReasonforVisit': reasonforVisit,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionRecordDocumentEquality implements Equality<TransactionRecord> {
  const TransactionRecordDocumentEquality();

  @override
  bool equals(TransactionRecord? e1, TransactionRecord? e2) {
    return e1?.transactionID == e2?.transactionID &&
        e1?.doctorName == e2?.doctorName &&
        e1?.fullName == e2?.fullName &&
        e1?.email == e2?.email &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.date == e2?.date &&
        e1?.time == e2?.time &&
        e1?.reasonforVisit == e2?.reasonforVisit;
  }

  @override
  int hash(TransactionRecord? e) => const ListEquality().hash([
        e?.transactionID,
        e?.doctorName,
        e?.fullName,
        e?.email,
        e?.phoneNumber,
        e?.date,
        e?.time,
        e?.reasonforVisit
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionRecord;
}
