import '/flutter_flow/flutter_flow_util.dart';
import 'donates_page_widget.dart' show DonatesPageWidget;
import 'package:flutter/material.dart';

class DonatesPageModel extends FlutterFlowModel<DonatesPageWidget> {
  ///  Local state fields for this page.

  int? id;

  String address = 'UQD4452NIi3YSL4t7ECbPfzH5f3BsHXWltPkF19nNshL9bkB';

  int? value = 1000000;

  String? message;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
