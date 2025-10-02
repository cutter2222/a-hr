import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_blue_widget.dart';
import '/components/upload_photo_item_widget.dart';
import '/components/upload_video_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'mission_gallery_photo_video_widget.dart'
    show MissionGalleryPhotoVideoWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MissionGalleryPhotoVideoModel
    extends FlutterFlowModel<MissionGalleryPhotoVideoWidget> {
  ///  Local state fields for this page.

  MissionProofsStruct? missionProofs;
  void updateMissionProofsStruct(Function(MissionProofsStruct) updateFn) {
    updateFn(missionProofs ??= MissionProofsStruct());
  }

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadData732p2 = false;
  FFUploadedFile uploadedLocalFile_uploadData732p2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData732p2 = '';

  bool isDataUploading_uploadData555n2 = false;
  FFUploadedFile uploadedLocalFile_uploadData555n2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData555n2 = '';

  // Model for ButtonBlue component.
  late ButtonBlueModel buttonBlueModel;

  @override
  void initState(BuildContext context) {
    buttonBlueModel = createModel(context, () => ButtonBlueModel());
  }

  @override
  void dispose() {
    buttonBlueModel.dispose();
  }
}
