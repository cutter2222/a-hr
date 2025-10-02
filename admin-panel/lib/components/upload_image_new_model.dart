import '/flutter_flow/flutter_flow_util.dart';
import 'upload_image_new_widget.dart' show UploadImageNewWidget;
import 'package:flutter/material.dart';

class UploadImageNewModel extends FlutterFlowModel<UploadImageNewWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? image;

  String? imageUrl = 'null';

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadDataC3c = false;
  FFUploadedFile uploadedLocalFile_uploadDataC3c =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
