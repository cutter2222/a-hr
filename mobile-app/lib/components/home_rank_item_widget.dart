import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/rank_loader_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_rank_item_model.dart';
export 'home_rank_item_model.dart';

class HomeRankItemWidget extends StatefulWidget {
  const HomeRankItemWidget({
    super.key,
    required this.viewUsersRow,
  });

  final ViewUsersRow? viewUsersRow;

  @override
  State<HomeRankItemWidget> createState() => _HomeRankItemWidgetState();
}

class _HomeRankItemWidgetState extends State<HomeRankItemWidget> {
  late HomeRankItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeRankItemModel());
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
      height: 256.0,
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
            child: Builder(
              builder: (context) {
                if (widget!.viewUsersRow?.rankId != null) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        RankWidget.routeName,
                        queryParameters: {
                          'viewUsers': serializeParam(
                            widget!.viewUsersRow,
                            ParamType.SupabaseRow,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Stack(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      children: [
                        Container(
                          width: double.infinity,
                          height: 256.0,
                          child: custom_widgets.VideoCardWidget(
                            width: double.infinity,
                            height: 256.0,
                            videoPath: () {
                              if (widget!.viewUsersRow?.gender ==
                                  Gender.male.name) {
                                return widget!
                                    .viewUsersRow?.rankCharacterVideoMaleUrl;
                              } else if (widget!.viewUsersRow?.gender ==
                                  Gender.female.name) {
                                return widget!
                                    .viewUsersRow?.rankCharacterVideoFemaleUrl;
                              } else {
                                return widget!
                                    .viewUsersRow?.rankCharacterVideoMaleUrl;
                              }
                            }(),
                            isPlaying: true,
                            loadWidget: () => RankLoaderWidget(),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 160.0,
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
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Spacer(),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        widget!.viewUsersRow?.rankBadgeImageUrl,
                                        'null',
                                      ),
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      widget!.viewUsersRow?.rankTitle,
                                      'null',
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
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
                  );
                } else {
                  return Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Spacer(),
                          Image.asset(
                            'assets/images/rank_icon.webp',
                            width: 46.0,
                            height: 46.0,
                            fit: BoxFit.cover,
                          ),
                          Spacer(),
                          Text(
                            'Ранг не назначен',
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
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
    );
  }
}
