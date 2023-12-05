import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventRecord extends FirestoreRecord {
  EventRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "goalscorerID" field.
  DocumentReference? _goalscorerID;
  DocumentReference? get goalscorerID => _goalscorerID;
  bool hasGoalscorerID() => _goalscorerID != null;

  // "assisterID" field.
  DocumentReference? _assisterID;
  DocumentReference? get assisterID => _assisterID;
  bool hasAssisterID() => _assisterID != null;

  // "eventTime" field.
  int? _eventTime;
  int get eventTime => _eventTime ?? 0;
  bool hasEventTime() => _eventTime != null;

  // "matchStatus" field.
  int? _matchStatus;
  int get matchStatus => _matchStatus ?? 0;
  bool hasMatchStatus() => _matchStatus != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _goalscorerID = snapshotData['goalscorerID'] as DocumentReference?;
    _assisterID = snapshotData['assisterID'] as DocumentReference?;
    _eventTime = castToType<int>(snapshotData['eventTime']);
    _matchStatus = castToType<int>(snapshotData['matchStatus']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('event')
          : FirebaseFirestore.instance.collectionGroup('event');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('event').doc();

  static Stream<EventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventRecord.fromSnapshot(s));

  static Future<EventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventRecord.fromSnapshot(s));

  static EventRecord fromSnapshot(DocumentSnapshot snapshot) => EventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventRecordData({
  DocumentReference? goalscorerID,
  DocumentReference? assisterID,
  int? eventTime,
  int? matchStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'goalscorerID': goalscorerID,
      'assisterID': assisterID,
      'eventTime': eventTime,
      'matchStatus': matchStatus,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventRecordDocumentEquality implements Equality<EventRecord> {
  const EventRecordDocumentEquality();

  @override
  bool equals(EventRecord? e1, EventRecord? e2) {
    return e1?.goalscorerID == e2?.goalscorerID &&
        e1?.assisterID == e2?.assisterID &&
        e1?.eventTime == e2?.eventTime &&
        e1?.matchStatus == e2?.matchStatus;
  }

  @override
  int hash(EventRecord? e) => const ListEquality()
      .hash([e?.goalscorerID, e?.assisterID, e?.eventTime, e?.matchStatus]);

  @override
  bool isValidKey(Object? o) => o is EventRecord;
}
