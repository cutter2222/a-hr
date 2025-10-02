import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/home_reward_row_item_widget.dart';
import '/components/missions_list_item_widget.dart';
import '/components/progress_bar_widget.dart';
import '/components/skill_compare_item_widget.dart';
import '/components/user_rank_video_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'rank_widget.dart' show RankWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RankModel extends FlutterFlowModel<RankWidget> {
  ///  Local state fields for this page.

  int index = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

  // Model for ProgressBar component.
  late ProgressBarModel progressBarModel;

  @override
  void initState(BuildContext context) {
    progressBarModel = createModel(context, () => ProgressBarModel());
  }

  @override
  void dispose() {
    progressBarModel.dispose();
  }
}
