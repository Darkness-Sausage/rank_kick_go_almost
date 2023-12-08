import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'create_match_widget.dart' show CreateMatchWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateMatchModel extends FlutterFlowModel<CreateMatchWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TeamAName widget.
  FocusNode? teamANameFocusNode;
  TextEditingController? teamANameController;
  String? Function(BuildContext, String?)? teamANameControllerValidator;
  // State field(s) for TeamAabb widget.
  FocusNode? teamAabbFocusNode;
  TextEditingController? teamAabbController;
  String? Function(BuildContext, String?)? teamAabbControllerValidator;
  // State field(s) for TeamBName widget.
  FocusNode? teamBNameFocusNode;
  TextEditingController? teamBNameController;
  String? Function(BuildContext, String?)? teamBNameControllerValidator;
  // State field(s) for TeamBabb widget.
  FocusNode? teamBabbFocusNode;
  TextEditingController? teamBabbController;
  String? Function(BuildContext, String?)? teamBabbControllerValidator;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MatchRecord? newMatchData;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    teamANameFocusNode?.dispose();
    teamANameController?.dispose();

    teamAabbFocusNode?.dispose();
    teamAabbController?.dispose();

    teamBNameFocusNode?.dispose();
    teamBNameController?.dispose();

    teamBabbFocusNode?.dispose();
    teamBabbController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
