import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_blue_widget.dart';
import '/components/upload_grid_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'mission_upload_file_widget.dart' show MissionUploadFileWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MissionUploadFileModel extends FlutterFlowModel<MissionUploadFileWidget> {
  ///  Local state fields for this page.

  MissionProofsStruct? missionUploadFile;
  void updateMissionUploadFileStruct(Function(MissionProofsStruct) updateFn) {
    updateFn(missionUploadFile ??= MissionProofsStruct());
  }

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataLyi = false;
  FFUploadedFile uploadedLocalFile_uploadDataLyi =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataLyi = '';

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
