import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_blue_widget.dart';
import '/components/upload_photo_item_widget.dart';
import '/components/upload_video_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:ui';
import 'event_complete_widget.dart' show EventCompleteWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventCompleteModel extends FlutterFlowModel<EventCompleteWidget> {
  ///  Local state fields for this page.

  List<String> photoUrls = [];
  void addToPhotoUrls(String item) => photoUrls.add(item);
  void removeFromPhotoUrls(String item) => photoUrls.remove(item);
  void removeAtIndexFromPhotoUrls(int index) => photoUrls.removeAt(index);
  void insertAtIndexInPhotoUrls(int index, String item) =>
      photoUrls.insert(index, item);
  void updatePhotoUrlsAtIndex(int index, Function(String) updateFn) =>
      photoUrls[index] = updateFn(photoUrls[index]);

  List<String> videoUrls = [];
  void addToVideoUrls(String item) => videoUrls.add(item);
  void removeFromVideoUrls(String item) => videoUrls.remove(item);
  void removeAtIndexFromVideoUrls(int index) => videoUrls.removeAt(index);
  void insertAtIndexInVideoUrls(int index, String item) =>
      videoUrls.insert(index, item);
  void updateVideoUrlsAtIndex(int index, Function(String) updateFn) =>
      videoUrls[index] = updateFn(videoUrls[index]);

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadData55501 = false;
  FFUploadedFile uploadedLocalFile_uploadData55501 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData55501 = '';

  bool isDataUploading_uploadDataVideo55502 = false;
  FFUploadedFile uploadedLocalFile_uploadDataVideo55502 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataVideo55502 = '';

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
