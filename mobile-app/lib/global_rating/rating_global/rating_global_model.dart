import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/choose3_widget.dart';
import '/components/message_widget.dart';
import '/components/user_rating_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'rating_global_widget.dart' show RatingGlobalWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RatingGlobalModel extends FlutterFlowModel<RatingGlobalWidget> {
  ///  Local state fields for this page.

  String filter = 'Неделя';

  ///  State fields for stateful widgets in this page.

  // Model for PersonalWeek.
  late UserRatingItemModel personalWeekModel;
  // Model for PersonalMonth.
  late UserRatingItemModel personalMonthModel;
  // Model for PersonalYear.
  late UserRatingItemModel personalYearModel;
  // Model for Message component.
  late MessageModel messageModel1;
  // Model for Choose3 component.
  late Choose3Model choose3Model;
  // Model for Message component.
  late MessageModel messageModel2;

  @override
  void initState(BuildContext context) {
    personalWeekModel = createModel(context, () => UserRatingItemModel());
    personalMonthModel = createModel(context, () => UserRatingItemModel());
    personalYearModel = createModel(context, () => UserRatingItemModel());
    messageModel1 = createModel(context, () => MessageModel());
    choose3Model = createModel(context, () => Choose3Model());
    messageModel2 = createModel(context, () => MessageModel());
  }

  @override
  void dispose() {
    personalWeekModel.dispose();
    personalMonthModel.dispose();
    personalYearModel.dispose();
    messageModel1.dispose();
    choose3Model.dispose();
    messageModel2.dispose();
  }
}
