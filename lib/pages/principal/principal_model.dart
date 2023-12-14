import '/flutter_flow/flutter_flow_util.dart';
import 'principal_widget.dart' show PrincipalWidget;
import 'package:flutter/material.dart';

class PrincipalModel extends FlutterFlowModel<PrincipalWidget> {
  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
