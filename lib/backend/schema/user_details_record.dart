import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDetailsRecord extends FirestoreRecord {
  UserDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "FullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "Age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "Gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "BloodGroup" field.
  String? _bloodGroup;
  String get bloodGroup => _bloodGroup ?? '';
  bool hasBloodGroup() => _bloodGroup != null;

  // "Address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "PhoneNumber" field.
  int? _phoneNumber;
  int get phoneNumber => _phoneNumber ?? 0;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "EmergencyContactName" field.
  String? _emergencyContactName;
  String get emergencyContactName => _emergencyContactName ?? '';
  bool hasEmergencyContactName() => _emergencyContactName != null;

  // "EmergencyContactNumber" field.
  int? _emergencyContactNumber;
  int get emergencyContactNumber => _emergencyContactNumber ?? 0;
  bool hasEmergencyContactNumber() => _emergencyContactNumber != null;

  // "RelationWithPatient" field.
  String? _relationWithPatient;
  String get relationWithPatient => _relationWithPatient ?? '';
  bool hasRelationWithPatient() => _relationWithPatient != null;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "DOB" field.
  DateTime? _dob;
  DateTime? get dob => _dob;
  bool hasDob() => _dob != null;

  // "Role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  void _initializeFields() {
    _fullName = snapshotData['FullName'] as String?;
    _age = castToType<int>(snapshotData['Age']);
    _gender = snapshotData['Gender'] as String?;
    _bloodGroup = snapshotData['BloodGroup'] as String?;
    _address = snapshotData['Address'] as String?;
    _phoneNumber = castToType<int>(snapshotData['PhoneNumber']);
    _emergencyContactName = snapshotData['EmergencyContactName'] as String?;
    _emergencyContactNumber =
        castToType<int>(snapshotData['EmergencyContactNumber']);
    _relationWithPatient = snapshotData['RelationWithPatient'] as String?;
    _email = snapshotData['Email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _dob = snapshotData['DOB'] as DateTime?;
    _role = snapshotData['Role'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_details');

  static Stream<UserDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserDetailsRecord.fromSnapshot(s));

  static Future<UserDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserDetailsRecord.fromSnapshot(s));

  static UserDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserDetailsRecordData({
  String? fullName,
  int? age,
  String? gender,
  String? bloodGroup,
  String? address,
  int? phoneNumber,
  String? emergencyContactName,
  int? emergencyContactNumber,
  String? relationWithPatient,
  String? email,
  String? photoUrl,
  DateTime? dob,
  String? role,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'FullName': fullName,
      'Age': age,
      'Gender': gender,
      'BloodGroup': bloodGroup,
      'Address': address,
      'PhoneNumber': phoneNumber,
      'EmergencyContactName': emergencyContactName,
      'EmergencyContactNumber': emergencyContactNumber,
      'RelationWithPatient': relationWithPatient,
      'Email': email,
      'photo_url': photoUrl,
      'DOB': dob,
      'Role': role,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserDetailsRecordDocumentEquality implements Equality<UserDetailsRecord> {
  const UserDetailsRecordDocumentEquality();

  @override
  bool equals(UserDetailsRecord? e1, UserDetailsRecord? e2) {
    return e1?.fullName == e2?.fullName &&
        e1?.age == e2?.age &&
        e1?.gender == e2?.gender &&
        e1?.bloodGroup == e2?.bloodGroup &&
        e1?.address == e2?.address &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.emergencyContactName == e2?.emergencyContactName &&
        e1?.emergencyContactNumber == e2?.emergencyContactNumber &&
        e1?.relationWithPatient == e2?.relationWithPatient &&
        e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.dob == e2?.dob &&
        e1?.role == e2?.role;
  }

  @override
  int hash(UserDetailsRecord? e) => const ListEquality().hash([
        e?.fullName,
        e?.age,
        e?.gender,
        e?.bloodGroup,
        e?.address,
        e?.phoneNumber,
        e?.emergencyContactName,
        e?.emergencyContactNumber,
        e?.relationWithPatient,
        e?.email,
        e?.photoUrl,
        e?.dob,
        e?.role
      ]);

  @override
  bool isValidKey(Object? o) => o is UserDetailsRecord;
}
