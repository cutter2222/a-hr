import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'upload_video_item_model.dart';
export 'upload_video_item_model.dart';

class UploadVideoItemWidget extends StatefulWidget {
  const UploadVideoItemWidget({
    super.key,
    required this.onDelete,
    required this.videoUrl,
  });

  final Future Function()? onDelete;
  final String? videoUrl;

  @override
  State<UploadVideoItemWidget> createState() => _UploadVideoItemWidgetState();
}

class _UploadVideoItemWidgetState extends State<UploadVideoItemWidget> {
  late UploadVideoItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadVideoItemModel());
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
              child: FlutterFlowVideoPlayer(
                path: widget!.videoUrl!,
                videoType: VideoType.network,
                width: double.infinity,
                height: double.infinity,
                aspectRatio: 1.0,
                autoPlay: true,
                looping: false,
                showControls: false,
                allowFullScreen: false,
                allowPlaybackSpeedMenu: false,
                lazyLoad: true,
                pauseOnNavigate: false,
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
                  color: Colors.white,
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
