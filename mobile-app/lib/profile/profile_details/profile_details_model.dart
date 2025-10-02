import '/backend/supabase/supabase.dart';
import '/components/home_reward_row_item_widget.dart';
import '/components/level_progress_widget.dart';
import '/components/profile_avatar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'profile_details_widget.dart' show ProfileDetailsWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ProfileDetailsModel extends FlutterFlowModel<ProfileDetailsWidget> {
  ///  Local state fields for this page.

  int index = 0;

  ///  State fields for stateful widgets in this page.

  // Model for ProfileAvatar component.
  late ProfileAvatarModel profileAvatarModel;
  // Model for LevelProgress component.
  late LevelProgressModel levelProgressModel;

  @override
  void initState(BuildContext context) {
    profileAvatarModel = createModel(context, () => ProfileAvatarModel());
    levelProgressModel = createModel(context, () => LevelProgressModel());
  }

  @override
  void dispose() {
    profileAvatarModel.dispose();
    levelProgressModel.dispose();
  }
}
