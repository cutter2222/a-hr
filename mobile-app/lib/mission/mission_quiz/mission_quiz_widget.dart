import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/bordered_quiz_container_widget.dart';
import '/components/button_blue_widget.dart';
import '/components/progress_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mission_quiz_model.dart';
export 'mission_quiz_model.dart';

class MissionQuizWidget extends StatefulWidget {
  const MissionQuizWidget({
    super.key,
    required this.viewMissionsRow,
  });

  final ViewMissionsRow? viewMissionsRow;

  static String routeName = 'MissionQuiz';
  static String routePath = '/missionQuiz';

  @override
  State<MissionQuizWidget> createState() => _MissionQuizWidgetState();
}

class _MissionQuizWidgetState extends State<MissionQuizWidget> {
  late MissionQuizModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MissionQuizModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.viewMissionsRow?.content != null) {
        _model.quiz = MissionQuizStruct.maybeFromMap(
            functions.dynamicToJson(widget!.viewMissionsRow?.content));
        _model.currentQuestion =
            _model.quiz?.missionQuizData?.elementAtOrNull(_model.index);
        safeSetState(() {});
      } else {
        return;
      }
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
                    'Квиз',
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
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Вопрос ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '${(_model.index + 1).toString()} / ${_model.quiz?.missionQuizData?.length?.toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.progressBarModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ProgressBarWidget(
                                    fact: _model.index.toDouble(),
                                    plan: _model.quiz?.missionQuizData?.length
                                        ?.toDouble(),
                                    padding: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  _model.currentQuestion?.question,
                                  'null',
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                          if (valueOrDefault<bool>(
                            _model.currentQuestion?.imageUrl != null &&
                                _model.currentQuestion?.imageUrl != '',
                            false,
                          ))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    _model.currentQuestion?.imageUrl,
                                    'null',
                                  ),
                                  width: double.infinity,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final childAnswers =
                                    _model.currentQuestion?.answers?.toList() ??
                                        [];

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(childAnswers.length,
                                      (childAnswersIndex) {
                                    final childAnswersItem =
                                        childAnswers[childAnswersIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        HapticFeedback.selectionClick();
                                        _model.updateCurrentQuestionStruct(
                                          (e) => e..myAnswer = childAnswersItem,
                                        );
                                        safeSetState(() {});
                                      },
                                      child: BorderedQuizContainerWidget(
                                        key: Key(
                                            'Keyt88_${childAnswersIndex}_of_${childAnswers.length}'),
                                        text: childAnswersItem,
                                        isPicked: childAnswersItem ==
                                            _model.currentQuestion?.myAnswer,
                                      ),
                                    );
                                  }).divide(SizedBox(height: 16.0)),
                                );
                              },
                            ),
                          ),
                        ]
                            .addToStart(SizedBox(height: 24.0))
                            .addToEnd(SizedBox(height: 128.0)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 50.0),
                      child: Builder(
                        builder: (context) {
                          if (_model.index !=
                              functions.subtractOne(
                                  _model.quiz?.missionQuizData?.length)) {
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (_model.currentQuestion?.myAnswer != null &&
                                    _model.currentQuestion?.myAnswer != '') {
                                  HapticFeedback.mediumImpact();
                                  _model.updateQuizStruct(
                                    (e) => e
                                      ..updateMissionQuizData(
                                        (e) => e[_model.index]
                                          ..myAnswer =
                                              _model.currentQuestion?.myAnswer,
                                      ),
                                  );
                                  safeSetState(() {});
                                  _model.index = _model.index + 1;
                                  _model.currentQuestion = _model
                                      .quiz?.missionQuizData
                                      ?.elementAtOrNull(_model.index);
                                  safeSetState(() {});
                                } else {
                                  HapticFeedback.heavyImpact();
                                  return;
                                }
                              },
                              child: wrapWithModel(
                                model: _model.buttonNextModel,
                                updateCallback: () => safeSetState(() {}),
                                child: ButtonBlueWidget(
                                  name: 'Далее',
                                  isInactive: _model
                                              .currentQuestion?.myAnswer ==
                                          null ||
                                      _model.currentQuestion?.myAnswer == '',
                                ),
                              ),
                            );
                          } else {
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (_model.currentQuestion?.myAnswer != null &&
                                    _model.currentQuestion?.myAnswer != '') {
                                  HapticFeedback.mediumImpact();
                                  _model.updateQuizStruct(
                                    (e) => e
                                      ..updateMissionQuizData(
                                        (e) => e[_model.index]
                                          ..myAnswer =
                                              _model.currentQuestion?.myAnswer,
                                      ),
                                  );
                                  safeSetState(() {});
                                  await UserMissionsTable().insert({
                                    'status': UserMissionStatus.pending.name,
                                    'playload': _model.quiz?.toMap(),
                                    'mission_id': widget!.viewMissionsRow?.id,
                                    'user_id': currentUserUid,
                                  });
                                  context.safePop();
                                } else {
                                  HapticFeedback.heavyImpact();
                                }
                              },
                              child: wrapWithModel(
                                model: _model.buttonCompleteModel,
                                updateCallback: () => safeSetState(() {}),
                                child: ButtonBlueWidget(
                                  name: 'Завершить',
                                  isInactive: _model
                                              .currentQuestion?.myAnswer ==
                                          null ||
                                      _model.currentQuestion?.myAnswer == '',
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ].addToStart(SizedBox(height: 60.0)),
        ),
      ),
    );
  }
}
