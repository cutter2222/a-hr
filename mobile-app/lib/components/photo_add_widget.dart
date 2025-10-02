import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'photo_add_model.dart';
export 'photo_add_model.dart';

class PhotoAddWidget extends StatefulWidget {
  const PhotoAddWidget({
    super.key,
    this.imagePath,
    required this.onUpload,
  });

  final String? imagePath;
  final Future Function(String? imagePath)? onUpload;

  @override
  State<PhotoAddWidget> createState() => _PhotoAddWidgetState();
}

class _PhotoAddWidgetState extends State<PhotoAddWidget> {
  late PhotoAddModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhotoAddModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 136.0,
          height: 136.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).primary,
                FlutterFlowTheme.of(context).containerAccent
              ],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(-1.0, -0.34),
              end: AlignmentDirectional(1.0, 0.34),
            ),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: ClipOval(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).bottomBackground,
                  shape: BoxShape.circle,
                ),
                child: Builder(
                  builder: (context) {
                    if (widget!.imagePath != null && widget!.imagePath != '') {
                      return CachedNetworkImage(
                        fadeInDuration: Duration(milliseconds: 500),
                        fadeOutDuration: Duration(milliseconds: 500),
                        imageUrl: valueOrDefault<String>(
                          widget!.imagePath,
                          'null',
                        ),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      );
                    } else {
                      return Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          FFIcons.kuser,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 56.0,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              final selectedMedia = await selectMediaWithSourceBottomSheet(
                context: context,
                storageFolderPath: '${currentUserUid}/photo_urls',
                maxWidth: 512.00,
                maxHeight: 512.00,
                imageQuality: 95,
                allowPhoto: true,
                backgroundColor: FlutterFlowTheme.of(context).bottomBackground,
                textColor: FlutterFlowTheme.of(context).primaryText,
                pickerFontFamily: 'Montserrat',
              );
              if (selectedMedia != null &&
                  selectedMedia.every(
                      (m) => validateFileFormat(m.storagePath, context))) {
                safeSetState(
                    () => _model.isDataUploading_uploadDataSluw = true);
                var selectedUploadedFiles = <FFUploadedFile>[];

                var downloadUrls = <String>[];
                try {
                  showUploadMessage(
                    context,
                    'Загрузка файла...',
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

                  downloadUrls = await uploadSupabaseStorageFiles(
                    bucketName: 'media',
                    selectedFiles: selectedMedia,
                  );
                } finally {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  _model.isDataUploading_uploadDataSluw = false;
                }
                if (selectedUploadedFiles.length == selectedMedia.length &&
                    downloadUrls.length == selectedMedia.length) {
                  safeSetState(() {
                    _model.uploadedLocalFile_uploadDataSluw =
                        selectedUploadedFiles.first;
                    _model.uploadedFileUrl_uploadDataSluw = downloadUrls.first;
                  });
                  showUploadMessage(context, 'Успешно загружен!');
                } else {
                  safeSetState(() {});
                  showUploadMessage(context, 'Не удалось загрузить данные');
                  return;
                }
              }

              if (_model.uploadedFileUrl_uploadDataSluw != null &&
                  _model.uploadedFileUrl_uploadDataSluw != '') {
                await widget.onUpload?.call(
                  _model.uploadedFileUrl_uploadDataSluw,
                );
              } else {
                return;
              }
            },
            child: Container(
              decoration: BoxDecoration(),
              child: Builder(
                builder: (context) {
                  if (widget!.imagePath != null && widget!.imagePath != '') {
                    return Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              FFIcons.kpen,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 18.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Выбрать другое фото',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              FFIcons.kimageGalleryPlus,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 18.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Добавить фото',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
        if (widget!.imagePath != null && widget!.imagePath != '')
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await widget.onUpload?.call(
                  null,
                );
              },
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        FFIcons.kcloseLG,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 18.0,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Удалить фото',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
