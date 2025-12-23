import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DoctorDetailsRecord extends FirestoreRecord {
  DoctorDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "DoctorName" field.
  String? _doctorName;
  String get doctorName => _doctorName ?? '';
  bool hasDoctorName() => _doctorName != null;

  // "Specialization" field.
  String? _specialization;
  String get specialization => _specialization ?? '';
  bool hasSpecialization() => _specialization != null;

  // "ConsultationFee" field.
  int? _consultationFee;
  int get consultationFee => _consultationFee ?? 0;
  bool hasConsultationFee() => _consultationFee != null;

  // "EmailDoc" field.
  String? _emailDoc;
  String get emailDoc => _emailDoc ?? '';
  bool hasEmailDoc() => _emailDoc != null;

  void _initializeFields() {
    _doctorName = snapshotData['DoctorName'] as String?;
    _specialization = snapshotData['Specialization'] as String?;
    _consultationFee = castToType<int>(snapshotData['ConsultationFee']);
    _emailDoc = snapshotData['EmailDoc'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Doctor_details');

  static Stream<DoctorDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DoctorDetailsRecord.fromSnapshot(s));

  static Future<DoctorDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DoctorDetailsRecord.fromSnapshot(s));

  static DoctorDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DoctorDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DoctorDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DoctorDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DoctorDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DoctorDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDoctorDetailsRecordData({
  String? doctorName,
  String? specialization,
  int? consultationFee,
  String? emailDoc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'DoctorName': doctorName,
      'Specialization': specialization,
      'ConsultationFee': consultationFee,
      'EmailDoc': emailDoc,
    }.withoutNulls,
  );

  return firestoreData;
}

class DoctorDetailsRecordDocumentEquality
    implements Equality<DoctorDetailsRecord> {
  const DoctorDetailsRecordDocumentEquality();

  @override
  bool equals(DoctorDetailsRecord? e1, DoctorDetailsRecord? e2) {
    return e1?.doctorName == e2?.doctorName &&
        e1?.specialization == e2?.specialization &&
        e1?.consultationFee == e2?.consultationFee &&
        e1?.emailDoc == e2?.emailDoc;
  }

  @override
  int hash(DoctorDetailsRecord? e) => const ListEquality().hash(
      [e?.doctorName, e?.specialization, e?.consultationFee, e?.emailDoc]);

  @override
  bool isValidKey(Object? o) => o is DoctorDetailsRecord;
}
