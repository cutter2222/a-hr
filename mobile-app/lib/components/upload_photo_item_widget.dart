import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'upload_photo_item_model.dart';
export 'upload_photo_item_model.dart';

class UploadPhotoItemWidget extends StatefulWidget {
  const UploadPhotoItemWidget({
    super.key,
    required this.onDelete,
    required this.photo,
  });

  final Future Function()? onDelete;
  final String? photo;

  @override
  State<UploadPhotoItemWidget> createState() => _UploadPhotoItemWidgetState();
}

class _UploadPhotoItemWidgetState extends State<UploadPhotoItemWidget> {
  late UploadPhotoItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadPhotoItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).bottomBackground,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: FlutterFlowExpandedImageView(
                        image: Image.network(
                          valueOrDefault<String>(
                            widget!.photo,
                            'null',
                          ),
                          fit: BoxFit.contain,
                        ),
                        allowRotation: false,
                        tag: valueOrDefault<String>(
                          widget!.photo,
                          'null',
                        ),
                        useHeroAnimation: true,
                      ),
                    ),
                  );
                },
                child: Hero(
                  tag: valueOrDefault<String>(
                    widget!.photo,
                    'null',
                  ),
                  transitionOnUserGestures: true,
                  child: Image.network(
                    valueOrDefault<String>(
                      widget!.photo,
                      'null',
                    ),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(1.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await widget.onDelete?.call();
                },
                child: Icon(
                  FFIcons.kcloseMD,
                  color: FlutterFlowTheme.of(context).secondaryText,
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
