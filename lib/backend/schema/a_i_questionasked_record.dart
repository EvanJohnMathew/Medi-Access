import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AIQuestionaskedRecord extends FirestoreRecord {
  AIQuestionaskedRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Questions" field.
  String? _questions;
  String get questions => _questions ?? '';
  bool hasQuestions() => _questions != null;

  // "Time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  void _initializeFields() {
    _questions = snapshotData['Questions'] as String?;
    _time = snapshotData['Time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AIQuestionasked');

  static Stream<AIQuestionaskedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AIQuestionaskedRecord.fromSnapshot(s));

  static Future<AIQuestionaskedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AIQuestionaskedRecord.fromSnapshot(s));

  static AIQuestionaskedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AIQuestionaskedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AIQuestionaskedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AIQuestionaskedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AIQuestionaskedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AIQuestionaskedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAIQuestionaskedRecordData({
  String? questions,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Questions': questions,
      'Time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class AIQuestionaskedRecordDocumentEquality
    implements Equality<AIQuestionaskedRecord> {
  const AIQuestionaskedRecordDocumentEquality();

  @override
  bool equals(AIQuestionaskedRecord? e1, AIQuestionaskedRecord? e2) {
    return e1?.questions == e2?.questions && e1?.time == e2?.time;
  }

  @override
  int hash(AIQuestionaskedRecord? e) =>
      const ListEquality().hash([e?.questions, e?.time]);

  @override
  bool isValidKey(Object? o) => o is AIQuestionaskedRecord;
}
