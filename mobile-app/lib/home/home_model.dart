import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/bottom_logout_widget.dart';
import '/components/button_animated_widget.dart';
import '/components/coins_item_widget.dart';
import '/components/home_branch_item_widget.dart';
import '/components/home_rank_item_widget.dart';
import '/components/home_reward_row_item_widget.dart';
import '/components/home_skills_item_widget.dart';
import '/components/level_progress_widget.dart';
import '/components/message_widget.dart';
import '/components/missions_list_item_widget.dart';
import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CoinsItem component.
  late CoinsItemModel coinsItemModel;
  // Model for LevelProgress component.
  late LevelProgressModel levelProgressModel;
  // Model for HomeRankItem component.
  late HomeRankItemModel homeRankItemModel;
  // Model for HomeBranchItem component.
  late HomeBranchItemModel homeBranchItemModel;
  // Model for HomeSkillsItem component.
  late HomeSkillsItemModel homeSkillsItemModel;
  // Model for Message component.
  late MessageModel messageModel;
  // Model for ButtonAnimated component.
  late ButtonAnimatedModel buttonAnimatedModel;
  // Stores action output result for [Bottom Sheet - BottomLogout] action in Button widget.
  bool? logout;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    coinsItemModel = createModel(context, () => CoinsItemModel());
    levelProgressModel = createModel(context, () => LevelProgressModel());
    homeRankItemModel = createModel(context, () => HomeRankItemModel());
    homeBranchItemModel = createModel(context, () => HomeBranchItemModel());
    homeSkillsItemModel = createModel(context, () => HomeSkillsItemModel());
    messageModel = createModel(context, () => MessageModel());
    buttonAnimatedModel = createModel(context, () => ButtonAnimatedModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    coinsItemModel.dispose();
    levelProgressModel.dispose();
    homeRankItemModel.dispose();
    homeBranchItemModel.dispose();
    homeSkillsItemModel.dispose();
    messageModel.dispose();
    buttonAnimatedModel.dispose();
    navbarModel.dispose();
  }
}
