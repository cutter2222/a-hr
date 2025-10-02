import '/components/button_choice/button_choice_widget.dart';
import '/components/list_item/list_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dialog_object_details_widget.dart' show DialogObjectDetailsWidget;
import 'package:flutter/material.dart';

class DialogObjectDetailsModel
    extends FlutterFlowModel<DialogObjectDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ListItem component.
  late ListItemModel listItemModel1;
  // Model for ListItem component.
  late ListItemModel listItemModel2;
  // Model for ListItem component.
  late ListItemModel listItemModel3;
  // Model for ListItem component.
  late ListItemModel listItemModel4;
  // Model for ListItem component.
  late ListItemModel listItemModel5;
  // Model for ButtonChoice component.
  late ButtonChoiceModel buttonChoiceModel1;
  // Model for ButtonChoice component.
  late ButtonChoiceModel buttonChoiceModel2;

  @override
  void initState(BuildContext context) {
    listItemModel1 = createModel(context, () => ListItemModel());
    listItemModel2 = createModel(context, () => ListItemModel());
    listItemModel3 = createModel(context, () => ListItemModel());
    listItemModel4 = createModel(context, () => ListItemModel());
    listItemModel5 = createModel(context, () => ListItemModel());
    buttonChoiceModel1 = createModel(context, () => ButtonChoiceModel());
    buttonChoiceModel2 = createModel(context, () => ButtonChoiceModel());
  }

  @override
  void dispose() {
    listItemModel1.dispose();
    listItemModel2.dispose();
    listItemModel3.dispose();
    listItemModel4.dispose();
    listItemModel5.dispose();
    buttonChoiceModel1.dispose();
    buttonChoiceModel2.dispose();
  }
}
