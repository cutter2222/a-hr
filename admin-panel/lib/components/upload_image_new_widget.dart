import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'upload_image_new_model.dart';
export 'upload_image_new_model.dart';

class UploadImageNewWidget extends StatefulWidget {
  const UploadImageNewWidget({
    super.key,
    required this.imageUrl,
  });

  final String? imageUrl;

  @override
  State<UploadImageNewWidget> createState() => _UploadImageNewWidgetState();
}

class _UploadImageNewWidgetState extends State<UploadImageNewWidget> {
  late UploadImageNewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadImageNewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.imageUrl = widget.imageUrl;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.0,
      height: 220.0,
      child: Stack(
        children: [
          if (_model.image == null || (_model.image?.bytes?.isEmpty ?? true))
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 32.0,
              ),
            ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                final selectedMedia = await selectMedia(
                  maxWidth: 600.00,
                  imageQuality: 90,
                  mediaSource: MediaSource.photoGallery,
                  multiImage: false,
                );
                if (selectedMedia != null &&
                    selectedMedia.every(
                        (m) => validateFileFormat(m.storagePath, context))) {
                  safeSetState(
                      () => _model.isDataUploading_uploadDataC3c = true);
                  var selectedUploadedFiles = <FFUploadedFile>[];

                  try {
                    showUploadMessage(
                      context,
                      'Uploading file...',
                      showLoading: true,
                    );
                    selectedUploadedFiles = selectedMedia
                        .map((m) => FFUploadedFile(
                              name: m.storagePath.split('/').last,
                              bytes: m.bytes,
                              height: m.dimensions?.height,
                              width: m.dimensions?.width,
                              blurHash: m.blurHash,
                            ))
                        .toList();
                  } finally {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    _model.isDataUploading_uploadDataC3c = false;
                  }
                  if (selectedUploadedFiles.length == selectedMedia.length) {
                    safeSetState(() {
                      _model.uploadedLocalFile_uploadDataC3c =
                          selectedUploadedFiles.first;
                    });
                    showUploadMessage(context, 'Success!');
                  } else {
                    safeSetState(() {});
                    showUploadMessage(context, 'Failed to upload data');
                    return;
                  }
                }

                if ((_model.uploadedLocalFile_uploadDataC3c.bytes?.isNotEmpty ??
                        false)) {
                  _model.image = _model.uploadedLocalFile_uploadDataC3c;
                  _model.updatePage(() {});
                } else {
                  return;
                }
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                ),
                child: Builder(
                  builder: (context) {
                    if (_model.image != null &&
                        (_model.image?.bytes?.isNotEmpty ?? false)) {
                      return Visibility(
                        visible: _model.image != null &&
                            (_model.image?.bytes?.isNotEmpty ?? false),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.memory(
                            _model.image?.bytes ?? Uint8List.fromList([]),
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    } else {
                      return Visibility(
                        visible:
                            _model.imageUrl != null && _model.imageUrl != '',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              _model.imageUrl,
                              'null',
                            ),
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(1.0, -1.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                _model.image = null;
                _model.imageUrl = 'null';
                _model.updatePage(() {});
              },
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.delete_forever,
                  color: FlutterFlowTheme.of(context).error,
                  size: 24.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
