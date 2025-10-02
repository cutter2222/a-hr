import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/bottom_logout_widget.dart';
import '/components/bottom_upload_file_widget.dart';
import '/components/icon_list_item_widget.dart';
import '/components/navbar_widget.dart';
import '/components/profile_avatar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ProfileAvatar component.
  late ProfileAvatarModel profileAvatarModel;
  // Model for IconListItem component.
  late IconListItemModel iconListItemModel1;
  // Model for IconListItem component.
  late IconListItemModel iconListItemModel2;
  // Model for IconListItem component.
  late IconListItemModel iconListItemModel3;
  // Model for IconListItem component.
  late IconListItemModel iconListItemModel4;
  // Model for IconListItem component.
  late IconListItemModel iconListItemModel5;
  // Stores action output result for [Bottom Sheet - BottomLogout] action in IconListItem widget.
  bool? bottomLogout;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    profileAvatarModel = createModel(context, () => ProfileAvatarModel());
    iconListItemModel1 = createModel(context, () => IconListItemModel());
    iconListItemModel2 = createModel(context, () => IconListItemModel());
    iconListItemModel3 = createModel(context, () => IconListItemModel());
    iconListItemModel4 = createModel(context, () => IconListItemModel());
    iconListItemModel5 = createModel(context, () => IconListItemModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    profileAvatarModel.dispose();
    iconListItemModel1.dispose();
    iconListItemModel2.dispose();
    iconListItemModel3.dispose();
    iconListItemModel4.dispose();
    iconListItemModel5.dispose();
    navbarModel.dispose();
  }
}
