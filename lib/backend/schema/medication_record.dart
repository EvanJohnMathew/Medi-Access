import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicationRecord extends FirestoreRecord {
  MedicationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Medication_Name" field.
  String? _medicationName;
  String get medicationName => _medicationName ?? '';
  bool hasMedicationName() => _medicationName != null;

  // "From_Date" field.
  DateTime? _fromDate;
  DateTime? get fromDate => _fromDate;
  bool hasFromDate() => _fromDate != null;

  // "To_Date" field.
  DateTime? _toDate;
  DateTime? get toDate => _toDate;
  bool hasToDate() => _toDate != null;

  // "DoctorName" field.
  String? _doctorName;
  String get doctorName => _doctorName ?? '';
  bool hasDoctorName() => _doctorName != null;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "EmailDoc" field.
  String? _emailDoc;
  String get emailDoc => _emailDoc ?? '';
  bool hasEmailDoc() => _emailDoc != null;

  // "No_of_times" field.
  String? _noOfTimes;
  String get noOfTimes => _noOfTimes ?? '';
  bool hasNoOfTimes() => _noOfTimes != null;

  // "DosageTime" field.
  List<String>? _dosageTime;
  List<String> get dosageTime => _dosageTime ?? const [];
  bool hasDosageTime() => _dosageTime != null;

  // "refid" field.
  String? _refid;
  String get refid => _refid ?? '';
  bool hasRefid() => _refid != null;

  // "additionalinfo" field.
  String? _additionalinfo;
  String get additionalinfo => _additionalinfo ?? '';
  bool hasAdditionalinfo() => _additionalinfo != null;

  void _initializeFields() {
    _medicationName = snapshotData['Medication_Name'] as String?;
    _fromDate = snapshotData['From_Date'] as DateTime?;
    _toDate = snapshotData['To_Date'] as DateTime?;
    _doctorName = snapshotData['DoctorName'] as String?;
    _email = snapshotData['Email'] as String?;
    _emailDoc = snapshotData['EmailDoc'] as String?;
    _noOfTimes = snapshotData['No_of_times'] as String?;
    _dosageTime = getDataList(snapshotData['DosageTime']);
    _refid = snapshotData['refid'] as String?;
    _additionalinfo = snapshotData['additionalinfo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Medication');

  static Stream<MedicationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicationRecord.fromSnapshot(s));

  static Future<MedicationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedicationRecord.fromSnapshot(s));

  static MedicationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedicationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedicationRecordData({
  String? medicationName,
  DateTime? fromDate,
  DateTime? toDate,
  String? doctorName,
  String? email,
  String? emailDoc,
  String? noOfTimes,
  String? refid,
  String? additionalinfo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Medication_Name': medicationName,
      'From_Date': fromDate,
      'To_Date': toDate,
      'DoctorName': doctorName,
      'Email': email,
      'EmailDoc': emailDoc,
      'No_of_times': noOfTimes,
      'refid': refid,
      'additionalinfo': additionalinfo,
    }.withoutNulls,
  );

  return firestoreData;
}

class MedicationRecordDocumentEquality implements Equality<MedicationRecord> {
  const MedicationRecordDocumentEquality();

  @override
  bool equals(MedicationRecord? e1, MedicationRecord? e2) {
    const listEquality = ListEquality();
    return e1?.medicationName == e2?.medicationName &&
        e1?.fromDate == e2?.fromDate &&
        e1?.toDate == e2?.toDate &&
        e1?.doctorName == e2?.doctorName &&
        e1?.email == e2?.email &&
        e1?.emailDoc == e2?.emailDoc &&
        e1?.noOfTimes == e2?.noOfTimes &&
        listEquality.equals(e1?.dosageTime, e2?.dosageTime) &&
        e1?.refid == e2?.refid &&
        e1?.additionalinfo == e2?.additionalinfo;
  }

  @override
  int hash(MedicationRecord? e) => const ListEquality().hash([
        e?.medicationName,
        e?.fromDate,
        e?.toDate,
        e?.doctorName,
        e?.email,
        e?.emailDoc,
        e?.noOfTimes,
        e?.dosageTime,
        e?.refid,
        e?.additionalinfo
      ]);

  @override
  bool isValidKey(Object? o) => o is MedicationRecord;
}
