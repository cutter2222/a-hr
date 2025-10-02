import '/components/rank_loader_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_rank_video_model.dart';
export 'user_rank_video_model.dart';

class UserRankVideoWidget extends StatefulWidget {
  const UserRankVideoWidget({
    super.key,
    this.videoPath,
    this.rankBadgeUrl,
    this.rankTitle,
    bool? isPlaying,
  }) : this.isPlaying = isPlaying ?? false;

  final String? videoPath;
  final String? rankBadgeUrl;
  final String? rankTitle;
  final bool isPlaying;

  @override
  State<UserRankVideoWidget> createState() => _UserRankVideoWidgetState();
}

class _UserRankVideoWidgetState extends State<UserRankVideoWidget> {
  late UserRankVideoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserRankVideoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 320.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            FlutterFlowTheme.of(context).primary,
            FlutterFlowTheme.of(context).containerAccent
          ],
          stops: [0.0, 1.0],
          begin: AlignmentDirectional(0.64, -1.0),
          end: AlignmentDirectional(-0.64, 1.0),
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(2.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14.0),
          child: Container(
            width: double.infinity,
            height: 256.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/bg_shop_1.webp',
                ).image,
              ),
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 374.0,
                      child: custom_widgets.VideoCardWidget(
                        width: double.infinity,
                        height: 374.0,
                        videoPath: widget!.videoPath,
                        isPlaying: widget!.isPlaying,
                        loadWidget: () => RankLoaderWidget(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      width: double.infinity,
                      height: 210.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            FlutterFlowTheme.of(context).primaryBackground,
                            FlutterFlowTheme.of(context).primaryBackground
                          ],
                          stops: [0.0, 0.5, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 62.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.network(
                                  widget!.rankBadgeUrl!,
                                  width: 62.0,
                                  height: 62.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Text(
                              widget!.rankTitle!,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
