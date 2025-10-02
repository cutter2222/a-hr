import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/choose2_widget.dart';
import '/components/message_widget.dart';
import '/components/missions_list_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mission_archive_model.dart';
export 'mission_archive_model.dart';

class MissionArchiveWidget extends StatefulWidget {
  const MissionArchiveWidget({super.key});

  static String routeName = 'MissionArchive';
  static String routePath = '/missionArchive';

  @override
  State<MissionArchiveWidget> createState() => _MissionArchiveWidgetState();
}

class _MissionArchiveWidgetState extends State<MissionArchiveWidget>
    with TickerProviderStateMixin {
  late MissionArchiveModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MissionArchiveModel());

    animationsMap.addAll({
      'choose2OnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 32.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 250.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 250.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 32.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 250.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 250.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 32.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  buttonSize: 50.0,
                  icon: Icon(
                    FFIcons.kchevronLeft,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
                Expanded(
                  child: Text(
                    'Архив миссий',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                        ),
                  ),
                ),
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
              child: wrapWithModel(
                model: _model.choose2Model,
                updateCallback: () => safeSetState(() {}),
                updateOnChange: true,
                child: Choose2Widget(
                  option1: 'Выполненные',
                  option2: 'Проваленные',
                  valuePicked: _model.filter,
                  onTap: (value) async {
                    _model.filter = value!;
                    safeSetState(() {});
                  },
                ),
              ).animateOnPageLoad(animationsMap['choose2OnPageLoadAnimation']!),
            ),
            Expanded(
              child: FutureBuilder<List<UserMissionsRow>>(
                future: UserMissionsTable().queryRows(
                  queryFn: (q) => q.eqOrNull(
                    'user_id',
                    currentUserUid,
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 28.0,
                        height: 28.0,
                        child: SpinKitPulse(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 28.0,
                        ),
                      ),
                    );
                  }
                  List<UserMissionsRow> queryUserMissionsUserMissionsRowList =
                      snapshot.data!;

                  return Container(
                    decoration: BoxDecoration(),
                    child: FutureBuilder<List<ViewMissionsRow>>(
                      future: ViewMissionsTable().queryRows(
                        queryFn: (q) => q.inFilterOrNull(
                          'id',
                          queryUserMissionsUserMissionsRowList
                              .map((e) => e.missionId)
                              .toList(),
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 28.0,
                              height: 28.0,
                              child: SpinKitPulse(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 28.0,
                              ),
                            ),
                          );
                        }
                        List<ViewMissionsRow>
                            queryViewMissionsViewMissionsRowList =
                            snapshot.data!;

                        return Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 8.0, 16.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                if (_model.filter == 'Выполненные') {
                                  return Builder(
                                    builder: (context) {
                                      final childViewMissions =
                                          queryViewMissionsViewMissionsRowList
                                              .where((e) =>
                                                  e.userMissionsStatus ==
                                                  UserMissionStatus
                                                      .completed.name)
                                              .toList();
                                      if (childViewMissions.isEmpty) {
                                        return Center(
                                          child: MessageWidget(
                                            title:
                                                'Тут пусто, как в космосе между звёздами!',
                                            text:
                                                'Кажется, астероиды с данными улетели в чёрную дыру. Добавь что-нибудь, чтобы оживить эту галактику!',
                                          ),
                                        );
                                      }

                                      return SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                                  childViewMissions.length,
                                                  (childViewMissionsIndex) {
                                            final childViewMissionsItem =
                                                childViewMissions[
                                                    childViewMissionsIndex];
                                            return MissionsListItemWidget(
                                              key: Key(
                                                  'Keyc4e_${childViewMissionsIndex}_of_${childViewMissions.length}'),
                                              index: childViewMissionsIndex,
                                              isUnlocked: true,
                                              viewMissionsRow:
                                                  childViewMissionsItem,
                                            );
                                          })
                                              .divide(SizedBox(height: 16.0))
                                              .addToStart(
                                                  SizedBox(height: 24.0))
                                              .addToEnd(
                                                  SizedBox(height: 128.0)),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'columnOnPageLoadAnimation1']!);
                                    },
                                  );
                                } else if (_model.filter == 'Проваленные') {
                                  return Builder(
                                    builder: (context) {
                                      final childViewMissions =
                                          queryViewMissionsViewMissionsRowList
                                              .where((e) =>
                                                  e.userMissionsStatus ==
                                                  UserMissionStatus.failed.name)
                                              .toList();
                                      if (childViewMissions.isEmpty) {
                                        return Center(
                                          child: MessageWidget(
                                            title:
                                                'Тут пусто, как в космосе между звёздами!',
                                            text:
                                                'Кажется, астероиды с данными улетели в чёрную дыру. Добавь что-нибудь, чтобы оживить эту галактику!',
                                          ),
                                        );
                                      }

                                      return SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                                  childViewMissions.length,
                                                  (childViewMissionsIndex) {
                                            final childViewMissionsItem =
                                                childViewMissions[
                                                    childViewMissionsIndex];
                                            return MissionsListItemWidget(
                                              key: Key(
                                                  'Keyowe_${childViewMissionsIndex}_of_${childViewMissions.length}'),
                                              index: childViewMissionsIndex,
                                              isUnlocked: true,
                                              viewMissionsRow:
                                                  childViewMissionsItem,
                                            );
                                          })
                                              .divide(SizedBox(height: 16.0))
                                              .addToStart(
                                                  SizedBox(height: 24.0))
                                              .addToEnd(
                                                  SizedBox(height: 128.0)),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'columnOnPageLoadAnimation2']!);
                                    },
                                  );
                                } else {
                                  return Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.messageModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: MessageWidget(
                                        title:
                                            'Тут пусто, как в космосе между звёздами!',
                                        text:
                                            'Кажется, астероиды с данными улетели в чёрную дыру. Добавь что-нибудь, чтобы оживить эту галактику!',
                                        rightSide: true,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ].addToStart(SizedBox(height: 60.0)),
        ),
      ),
    );
  }
}
