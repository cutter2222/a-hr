import '/components/list_item/list_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dialog_dropdown_widget.dart' show DialogDropdownWidget;
import 'package:flutter/material.dart';

class DialogDropdownModel extends FlutterFlowModel<DialogDropdownWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ListItem component.
  late ListItemModel listItemModel;

  @override
  void initState(BuildContext context) {
    listItemModel = createModel(context, () => ListItemModel());
  }

  @override
  void dispose() {
    listItemModel.dispose();
  }
}
