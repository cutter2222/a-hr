import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'photo_add_widget.dart' show PhotoAddWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PhotoAddModel extends FlutterFlowModel<PhotoAddWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadDataSluw = false;
  FFUploadedFile uploadedLocalFile_uploadDataSluw =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataSluw = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
