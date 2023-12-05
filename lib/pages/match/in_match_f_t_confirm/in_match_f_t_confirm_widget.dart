import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'in_match_f_t_confirm_model.dart';
export 'in_match_f_t_confirm_model.dart';

class InMatchFTConfirmWidget extends StatefulWidget {
  const InMatchFTConfirmWidget({
    Key? key,
    required this.matchID,
  }) : super(key: key);

  final DocumentReference? matchID;

  @override
  _InMatchFTConfirmWidgetState createState() => _InMatchFTConfirmWidgetState();
}

class _InMatchFTConfirmWidgetState extends State<InMatchFTConfirmWidget> {
  late InMatchFTConfirmModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InMatchFTConfirmModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.match = await MatchRecord.getDocumentOnce(widget.matchID!);
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.00, 1.00),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 2.0,
            sigmaY: 2.0,
          ),
          child: StreamBuilder<MatchRecord>(
            stream: MatchRecord.getDocument(widget.matchID!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              final createNoteMatchRecord = snapshot.data!;
              return Material(
                color: Colors.transparent,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 240.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Container(
                                width: 50.0,
                                height: 4.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  borderRadius: BorderRadius.circular(8.0),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                1.0, 20.0, 0.0, 0.0),
                            child: Text(
                              'Proceed to full time?',
                              style:
                                  FlutterFlowTheme.of(context).headlineMedium,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                1.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Note: This will end the match.',
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final firestoreBatch =
                                        FirebaseFirestore.instance.batch();
                                    try {
                                      firestoreBatch.update(
                                          widget.matchID!,
                                          createMatchRecordData(
                                            matchStatus: 4,
                                            matchTime: 90,
                                          ));
                                      if (_model.match!.teamAScore >
                                          _model.match!.teamBScore) {
                                        _model.count = 0;
                                        while (_model.count <
                                            createNoteMatchRecord
                                                .teamAPlayers.length) {
                                          firestoreBatch.update(
                                              createNoteMatchRecord
                                                  .teamAPlayers[_model.count],
                                              {
                                                ...mapToFirestore(
                                                  {
                                                    'appearances':
                                                        FieldValue.increment(1),
                                                    'wins':
                                                        FieldValue.increment(1),
                                                  },
                                                ),
                                              });
                                          setState(() {
                                            _model.count = _model.count + 1;
                                          });
                                        }
                                        _model.count = 0;
                                        while (_model.count <
                                            createNoteMatchRecord
                                                .teamBPlayers.length) {
                                          firestoreBatch.update(
                                              createNoteMatchRecord
                                                  .teamBPlayers[_model.count],
                                              {
                                                ...mapToFirestore(
                                                  {
                                                    'appearances':
                                                        FieldValue.increment(1),
                                                    'loses':
                                                        FieldValue.increment(1),
                                                  },
                                                ),
                                              });
                                          setState(() {
                                            _model.count = _model.count + 1;
                                          });
                                        }
                                      } else if (_model.match?.teamAScore ==
                                          _model.match?.teamBScore) {
                                        _model.count = 0;
                                        while (_model.count <
                                            createNoteMatchRecord
                                                .teamAPlayers.length) {
                                          firestoreBatch.update(
                                              createNoteMatchRecord
                                                  .teamAPlayers[_model.count],
                                              {
                                                ...mapToFirestore(
                                                  {
                                                    'appearances':
                                                        FieldValue.increment(1),
                                                    'draws':
                                                        FieldValue.increment(1),
                                                  },
                                                ),
                                              });
                                          setState(() {
                                            _model.count = _model.count + 1;
                                          });
                                        }
                                        _model.count = 0;
                                        while (_model.count <
                                            createNoteMatchRecord
                                                .teamBPlayers.length) {
                                          firestoreBatch.update(
                                              createNoteMatchRecord
                                                  .teamBPlayers[_model.count],
                                              {
                                                ...mapToFirestore(
                                                  {
                                                    'appearances':
                                                        FieldValue.increment(1),
                                                    'draws':
                                                        FieldValue.increment(1),
                                                  },
                                                ),
                                              });
                                          setState(() {
                                            _model.count = _model.count + 1;
                                          });
                                        }
                                      } else if (_model.match!.teamAScore <
                                          _model.match!.teamBScore) {
                                        _model.count = 0;
                                        while (_model.count <
                                            createNoteMatchRecord
                                                .teamAPlayers.length) {
                                          firestoreBatch.update(
                                              createNoteMatchRecord
                                                  .teamAPlayers[_model.count],
                                              {
                                                ...mapToFirestore(
                                                  {
                                                    'appearances':
                                                        FieldValue.increment(1),
                                                    'loses':
                                                        FieldValue.increment(1),
                                                  },
                                                ),
                                              });
                                          setState(() {
                                            _model.count = _model.count + 1;
                                          });
                                        }
                                        _model.count = 0;
                                        while (_model.count <
                                            createNoteMatchRecord
                                                .teamBPlayers.length) {
                                          firestoreBatch.update(
                                              createNoteMatchRecord
                                                  .teamBPlayers[_model.count],
                                              {
                                                ...mapToFirestore(
                                                  {
                                                    'appearances':
                                                        FieldValue.increment(1),
                                                    'wins':
                                                        FieldValue.increment(1),
                                                  },
                                                ),
                                              });
                                          setState(() {
                                            _model.count = _model.count + 1;
                                          });
                                        }
                                      }

                                      Navigator.pop(context);
                                    } finally {
                                      await firestoreBatch.commit();
                                    }
                                  },
                                  text: 'Confirm',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                  text: 'Cancel',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
