import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MatchRecord extends FirestoreRecord {
  MatchRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "events" field.
  List<DocumentReference>? _events;
  List<DocumentReference> get events => _events ?? const [];
  bool hasEvents() => _events != null;

  // "team_A_name" field.
  String? _teamAName;
  String get teamAName => _teamAName ?? '';
  bool hasTeamAName() => _teamAName != null;

  // "team_A_players" field.
  List<DocumentReference>? _teamAPlayers;
  List<DocumentReference> get teamAPlayers => _teamAPlayers ?? const [];
  bool hasTeamAPlayers() => _teamAPlayers != null;

  // "team_A_score" field.
  int? _teamAScore;
  int get teamAScore => _teamAScore ?? 0;
  bool hasTeamAScore() => _teamAScore != null;

  // "team_B_name" field.
  String? _teamBName;
  String get teamBName => _teamBName ?? '';
  bool hasTeamBName() => _teamBName != null;

  // "team_B_players" field.
  List<DocumentReference>? _teamBPlayers;
  List<DocumentReference> get teamBPlayers => _teamBPlayers ?? const [];
  bool hasTeamBPlayers() => _teamBPlayers != null;

  // "team_B_score" field.
  int? _teamBScore;
  int get teamBScore => _teamBScore ?? 0;
  bool hasTeamBScore() => _teamBScore != null;

  // "match_start_time" field.
  DateTime? _matchStartTime;
  DateTime? get matchStartTime => _matchStartTime;
  bool hasMatchStartTime() => _matchStartTime != null;

  // "match_time" field.
  int? _matchTime;
  int get matchTime => _matchTime ?? 0;
  bool hasMatchTime() => _matchTime != null;

  // "match_status" field.
  int? _matchStatus;
  int get matchStatus => _matchStatus ?? 0;
  bool hasMatchStatus() => _matchStatus != null;

  // "refereeID" field.
  DocumentReference? _refereeID;
  DocumentReference? get refereeID => _refereeID;
  bool hasRefereeID() => _refereeID != null;

  // "team_A_abb" field.
  String? _teamAAbb;
  String get teamAAbb => _teamAAbb ?? '';
  bool hasTeamAAbb() => _teamAAbb != null;

  // "team_B_abb" field.
  String? _teamBAbb;
  String get teamBAbb => _teamBAbb ?? '';
  bool hasTeamBAbb() => _teamBAbb != null;

  void _initializeFields() {
    _events = getDataList(snapshotData['events']);
    _teamAName = snapshotData['team_A_name'] as String?;
    _teamAPlayers = getDataList(snapshotData['team_A_players']);
    _teamAScore = castToType<int>(snapshotData['team_A_score']);
    _teamBName = snapshotData['team_B_name'] as String?;
    _teamBPlayers = getDataList(snapshotData['team_B_players']);
    _teamBScore = castToType<int>(snapshotData['team_B_score']);
    _matchStartTime = snapshotData['match_start_time'] as DateTime?;
    _matchTime = castToType<int>(snapshotData['match_time']);
    _matchStatus = castToType<int>(snapshotData['match_status']);
    _refereeID = snapshotData['refereeID'] as DocumentReference?;
    _teamAAbb = snapshotData['team_A_abb'] as String?;
    _teamBAbb = snapshotData['team_B_abb'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('match');

  static Stream<MatchRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MatchRecord.fromSnapshot(s));

  static Future<MatchRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MatchRecord.fromSnapshot(s));

  static MatchRecord fromSnapshot(DocumentSnapshot snapshot) => MatchRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MatchRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MatchRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MatchRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MatchRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMatchRecordData({
  String? teamAName,
  int? teamAScore,
  String? teamBName,
  int? teamBScore,
  DateTime? matchStartTime,
  int? matchTime,
  int? matchStatus,
  DocumentReference? refereeID,
  String? teamAAbb,
  String? teamBAbb,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'team_A_name': teamAName,
      'team_A_score': teamAScore,
      'team_B_name': teamBName,
      'team_B_score': teamBScore,
      'match_start_time': matchStartTime,
      'match_time': matchTime,
      'match_status': matchStatus,
      'refereeID': refereeID,
      'team_A_abb': teamAAbb,
      'team_B_abb': teamBAbb,
    }.withoutNulls,
  );

  return firestoreData;
}

class MatchRecordDocumentEquality implements Equality<MatchRecord> {
  const MatchRecordDocumentEquality();

  @override
  bool equals(MatchRecord? e1, MatchRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.events, e2?.events) &&
        e1?.teamAName == e2?.teamAName &&
        listEquality.equals(e1?.teamAPlayers, e2?.teamAPlayers) &&
        e1?.teamAScore == e2?.teamAScore &&
        e1?.teamBName == e2?.teamBName &&
        listEquality.equals(e1?.teamBPlayers, e2?.teamBPlayers) &&
        e1?.teamBScore == e2?.teamBScore &&
        e1?.matchStartTime == e2?.matchStartTime &&
        e1?.matchTime == e2?.matchTime &&
        e1?.matchStatus == e2?.matchStatus &&
        e1?.refereeID == e2?.refereeID &&
        e1?.teamAAbb == e2?.teamAAbb &&
        e1?.teamBAbb == e2?.teamBAbb;
  }

  @override
  int hash(MatchRecord? e) => const ListEquality().hash([
        e?.events,
        e?.teamAName,
        e?.teamAPlayers,
        e?.teamAScore,
        e?.teamBName,
        e?.teamBPlayers,
        e?.teamBScore,
        e?.matchStartTime,
        e?.matchTime,
        e?.matchStatus,
        e?.refereeID,
        e?.teamAAbb,
        e?.teamBAbb
      ]);

  @override
  bool isValidKey(Object? o) => o is MatchRecord;
}
