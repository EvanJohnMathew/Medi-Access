import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentRecord extends FirestoreRecord {
  AppointmentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

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

  // "ReasonForVisit" field.
  String? _reasonForVisit;
  String get reasonForVisit => _reasonForVisit ?? '';
  bool hasReasonForVisit() => _reasonForVisit != null;

  // "ConsultationFee" field.
  int? _consultationFee;
  int get consultationFee => _consultationFee ?? 0;
  bool hasConsultationFee() => _consultationFee != null;

  // "idapp" field.
  String? _idapp;
  String get idapp => _idapp ?? '';
  bool hasIdapp() => _idapp != null;

  // "EmailDoc" field.
  String? _emailDoc;
  String get emailDoc => _emailDoc ?? '';
  bool hasEmailDoc() => _emailDoc != null;

  void _initializeFields() {
    _doctorName = snapshotData['DoctorName'] as String?;
    _fullName = snapshotData['FullName'] as String?;
    _email = snapshotData['Email'] as String?;
    _phoneNumber = castToType<int>(snapshotData['PhoneNumber']);
    _date = snapshotData['Date'] as DateTime?;
    _time = snapshotData['Time'] as DateTime?;
    _reasonForVisit = snapshotData['ReasonForVisit'] as String?;
    _consultationFee = castToType<int>(snapshotData['ConsultationFee']);
    _idapp = snapshotData['idapp'] as String?;
    _emailDoc = snapshotData['EmailDoc'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appointment');

  static Stream<AppointmentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppointmentRecord.fromSnapshot(s));

  static Future<AppointmentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppointmentRecord.fromSnapshot(s));

  static AppointmentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppointmentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppointmentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppointmentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppointmentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppointmentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppointmentRecordData({
  String? doctorName,
  String? fullName,
  String? email,
  int? phoneNumber,
  DateTime? date,
  DateTime? time,
  String? reasonForVisit,
  int? consultationFee,
  String? idapp,
  String? emailDoc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'DoctorName': doctorName,
      'FullName': fullName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'Date': date,
      'Time': time,
      'ReasonForVisit': reasonForVisit,
      'ConsultationFee': consultationFee,
      'idapp': idapp,
      'EmailDoc': emailDoc,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentRecordDocumentEquality implements Equality<AppointmentRecord> {
  const AppointmentRecordDocumentEquality();

  @override
  bool equals(AppointmentRecord? e1, AppointmentRecord? e2) {
    return e1?.doctorName == e2?.doctorName &&
        e1?.fullName == e2?.fullName &&
        e1?.email == e2?.email &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.date == e2?.date &&
        e1?.time == e2?.time &&
        e1?.reasonForVisit == e2?.reasonForVisit &&
        e1?.consultationFee == e2?.consultationFee &&
        e1?.idapp == e2?.idapp &&
        e1?.emailDoc == e2?.emailDoc;
  }

  @override
  int hash(AppointmentRecord? e) => const ListEquality().hash([
        e?.doctorName,
        e?.fullName,
        e?.email,
        e?.phoneNumber,
        e?.date,
        e?.time,
        e?.reasonForVisit,
        e?.consultationFee,
        e?.idapp,
        e?.emailDoc
      ]);

  @override
  bool isValidKey(Object? o) => o is AppointmentRecord;
}
