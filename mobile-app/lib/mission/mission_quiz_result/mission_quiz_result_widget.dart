import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/bordered_quiz_container_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mission_quiz_result_model.dart';
export 'mission_quiz_result_model.dart';

class MissionQuizResultWidget extends StatefulWidget {
  const MissionQuizResultWidget({
    super.key,
    required this.userMissionsRow,
  });

  final UserMissionsRow? userMissionsRow;

  static String routeName = 'MissionQuizResult';
  static String routePath = '/missionQuizResult';

  @override
  State<MissionQuizResultWidget> createState() =>
      _MissionQuizResultWidgetState();
}

class _MissionQuizResultWidgetState extends State<MissionQuizResultWidget> {
  late MissionQuizResultModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MissionQuizResultModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.userMissionsRow?.playload != null) {
        _model.quiz = MissionQuizStruct.maybeFromMap(
            functions.dynamicToJson(widget!.userMissionsRow?.playload));
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
                    'Результаты квиза',
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
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Поздравляем с прохождением задания!',
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
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: Text(
                                'Правильных ответов ${valueOrDefault<String>(
                                  _model.quiz?.missionQuizData
                                      ?.where(
                                          (e) => e.myAnswer == e.correctAnswer)
                                      .toList()
                                      ?.length
                                      ?.toString(),
                                  'null',
                                )} / ${valueOrDefault<String>(
                                  _model.quiz?.missionQuizData?.length
                                      ?.toString(),
                                  'null',
                                )}',
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
                          ),
                          if (_model.quiz?.missionQuizData
                                      ?.where(
                                          (e) => e.myAnswer != e.correctAnswer)
                                      .toList() !=
                                  null &&
                              (_model.quiz?.missionQuizData
                                      ?.where(
                                          (e) => e.myAnswer != e.correctAnswer)
                                      .toList())!
                                  .isNotEmpty)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final childAnswers = _model
                                          .quiz?.missionQuizData
                                          ?.where((e) =>
                                              e.myAnswer != e.correctAnswer)
                                          .toList()
                                          ?.toList() ??
                                      [];

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(childAnswers.length,
                                        (childAnswersIndex) {
                                      final childAnswersItem =
                                          childAnswers[childAnswersIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              childAnswersItem.question,
                                              'null',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .fontStyle,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: BorderedQuizContainerWidget(
                                              key: Key(
                                                  'Keymfa_${childAnswersIndex}_of_${childAnswers.length}'),
                                              text:
                                                  'Мой ответ: ${valueOrDefault<String>(
                                                childAnswersItem.myAnswer,
                                                'null',
                                              )}',
                                              isPicked: false,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: BorderedQuizContainerWidget(
                                              key: Key(
                                                  'Keykah_${childAnswersIndex}_of_${childAnswers.length}'),
                                              text:
                                                  'Правильный ответ: ${valueOrDefault<String>(
                                                childAnswersItem.correctAnswer,
                                                'null',
                                              )}',
                                              isPicked: true,
                                            ),
                                          ),
                                        ],
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
                ],
              ),
            ),
          ].addToStart(SizedBox(height: 60.0)),
        ),
      ),
    );
  }
}
