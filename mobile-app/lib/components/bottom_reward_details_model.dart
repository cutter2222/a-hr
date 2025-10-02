import '/backend/supabase/supabase.dart';
import '/components/bordered_container_widget.dart';
import '/components/choice_chips_widget.dart';
import '/components/reward_grid_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'bottom_reward_details_widget.dart' show BottomRewardDetailsWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BottomRewardDetailsModel
    extends FlutterFlowModel<BottomRewardDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for RewardGridItem component.
  late RewardGridItemModel rewardGridItemModel;
  // Model for ChoiceChips component.
  late ChoiceChipsModel choiceChipsModel1;
  // Model for ChoiceChips component.
  late ChoiceChipsModel choiceChipsModel2;
  // Model for BorderedContainer component.
  late BorderedContainerModel borderedContainerModel;

  @override
  void initState(BuildContext context) {
    rewardGridItemModel = createModel(context, () => RewardGridItemModel());
    choiceChipsModel1 = createModel(context, () => ChoiceChipsModel());
    choiceChipsModel2 = createModel(context, () => ChoiceChipsModel());
    borderedContainerModel =
        createModel(context, () => BorderedContainerModel());
  }

  @override
  void dispose() {
    rewardGridItemModel.dispose();
    choiceChipsModel1.dispose();
    choiceChipsModel2.dispose();
    borderedContainerModel.dispose();
  }
}
