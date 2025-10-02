import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/choice_chips_widget.dart';
import '/components/message_widget.dart';
import '/components/reward_grid_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'rewards_widget.dart' show RewardsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RewardsModel extends FlutterFlowModel<RewardsWidget> {
  ///  Local state fields for this page.

  int? rarityId;

  bool isMyRewards = false;

  ///  State fields for stateful widgets in this page.

  // Model for ChoiceChips component.
  late ChoiceChipsModel choiceChipsModel1;
  // Model for ChoiceChips component.
  late ChoiceChipsModel choiceChipsModel2;

  @override
  void initState(BuildContext context) {
    choiceChipsModel1 = createModel(context, () => ChoiceChipsModel());
    choiceChipsModel2 = createModel(context, () => ChoiceChipsModel());
  }

  @override
  void dispose() {
    choiceChipsModel1.dispose();
    choiceChipsModel2.dispose();
  }
}
