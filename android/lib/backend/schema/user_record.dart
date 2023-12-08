import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "appearances" field.
  int? _appearances;
  int get appearances => _appearances ?? 0;
  bool hasAppearances() => _appearances != null;

  // "goals" field.
  int? _goals;
  int get goals => _goals ?? 0;
  bool hasGoals() => _goals != null;

  // "assists" field.
  int? _assists;
  int get assists => _assists ?? 0;
  bool hasAssists() => _assists != null;

  // "mvp" field.
  int? _mvp;
  int get mvp => _mvp ?? 0;
  bool hasMvp() => _mvp != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "wins" field.
  int? _wins;
  int get wins => _wins ?? 0;
  bool hasWins() => _wins != null;

  // "draws" field.
  int? _draws;
  int get draws => _draws ?? 0;
  bool hasDraws() => _draws != null;

  // "loses" field.
  int? _loses;
  int get loses => _loses ?? 0;
  bool hasLoses() => _loses != null;

  // "player_number" field.
  String? _playerNumber;
  String get playerNumber => _playerNumber ?? '';
  bool hasPlayerNumber() => _playerNumber != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _uid = snapshotData['uid'] as String?;
    _appearances = castToType<int>(snapshotData['appearances']);
    _goals = castToType<int>(snapshotData['goals']);
    _assists = castToType<int>(snapshotData['assists']);
    _mvp = castToType<int>(snapshotData['mvp']);
    _displayName = snapshotData['display_name'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _wins = castToType<int>(snapshotData['wins']);
    _draws = castToType<int>(snapshotData['draws']);
    _loses = castToType<int>(snapshotData['loses']);
    _playerNumber = snapshotData['player_number'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? uid,
  int? appearances,
  int? goals,
  int? assists,
  int? mvp,
  String? displayName,
  DateTime? createdTime,
  String? phoneNumber,
  int? wins,
  int? draws,
  int? loses,
  String? playerNumber,
  String? photoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'uid': uid,
      'appearances': appearances,
      'goals': goals,
      'assists': assists,
      'mvp': mvp,
      'display_name': displayName,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'wins': wins,
      'draws': draws,
      'loses': loses,
      'player_number': playerNumber,
      'photo_url': photoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.uid == e2?.uid &&
        e1?.appearances == e2?.appearances &&
        e1?.goals == e2?.goals &&
        e1?.assists == e2?.assists &&
        e1?.mvp == e2?.mvp &&
        e1?.displayName == e2?.displayName &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.wins == e2?.wins &&
        e1?.draws == e2?.draws &&
        e1?.loses == e2?.loses &&
        e1?.playerNumber == e2?.playerNumber &&
        e1?.photoUrl == e2?.photoUrl;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.uid,
        e?.appearances,
        e?.goals,
        e?.assists,
        e?.mvp,
        e?.displayName,
        e?.createdTime,
        e?.phoneNumber,
        e?.wins,
        e?.draws,
        e?.loses,
        e?.playerNumber,
        e?.photoUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
