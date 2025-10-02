import '/backend/schema/structs/index.dart';
import '/components/quiz_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dialog_quiz_add_model.dart';
export 'dialog_quiz_add_model.dart';

class DialogQuizAddWidget extends StatefulWidget {
  const DialogQuizAddWidget({
    super.key,
    this.missionQuiz,
  });

  final MissionQuizStruct? missionQuiz;

  @override
  State<DialogQuizAddWidget> createState() => _DialogQuizAddWidgetState();
}

class _DialogQuizAddWidgetState extends State<DialogQuizAddWidget> {
  late DialogQuizAddModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DialogQuizAddModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.missionQuiz != null) {
        _model.missionQuiz = widget.missionQuiz;
        safeSetState(() {});
      } else {
        return;
      }
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
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 420.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 420.0,
                  ),
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Создать квиз',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .labelMediumIsCustom,
                                  ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.close,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 6.0)),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Builder(
                                builder: (context) {
                                  final childQuiz = _model
                                          .missionQuiz?.missionQuizData
                                          .toList() ??
                                      [];

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(childQuiz.length,
                                        (childQuizIndex) {
                                      final childQuizItem =
                                          childQuiz[childQuizIndex];
                                      return QuizListItemWidget(
                                        key: Key(
                                            'Keywpa_${childQuizIndex}_of_${childQuiz.length}'),
                                        quizDataItem: childQuizItem,
                                        index: childQuizIndex,
                                        onDelete: () async {
                                          _model.updateMissionQuizStruct(
                                            (e) => e
                                              ..updateMissionQuizData(
                                                (e) =>
                                                    e.removeAt(childQuizIndex),
                                              ),
                                          );
                                          safeSetState(() {});
                                        },
                                        onChange: (quizData) async {
                                          _model.updateMissionQuizStruct(
                                            (e) => e
                                              ..updateMissionQuizData(
                                                (e) => e[childQuizIndex] =
                                                    quizData!,
                                              ),
                                          );
                                          safeSetState(() {});
                                        },
                                      );
                                    }),
                                  );
                                },
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  _model.updateMissionQuizStruct(
                                    (e) => e
                                      ..updateMissionQuizData(
                                        (e) => e.add(MissionQuizDataStruct()),
                                      ),
                                  );
                                  safeSetState(() {});
                                },
                                text: 'Новый вопрос',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 52.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0x4C06AEEF),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ]
                                .divide(SizedBox(height: 24.0))
                                .around(SizedBox(height: 24.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (_model.isValidate &&
                  !((_model.missionQuiz!.missionQuizData
                          .where((e) => e.isValidated)
                          .toList()
                          .isNotEmpty) &&
                      !(_model.missionQuiz!.missionQuizData
                          .where((e) => !e.isValidated)
                          .toList()
                          .isNotEmpty)))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Text(
                    'Сохранение невозможно. Проверьте заполнение данных',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: Color(0xFFD74F0C),
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if ((_model.missionQuiz!.missionQuizData
                            .where((e) => e.isValidated)
                            .toList()
                            .isNotEmpty) &&
                        !(_model.missionQuiz!.missionQuizData
                            .where((e) => !e.isValidated)
                            .toList()
                            .isNotEmpty)) {
                      Navigator.pop(context, _model.missionQuiz);
                    } else {
                      _model.isValidate = true;
                      safeSetState(() {});
                      return;
                    }
                  },
                  text: 'Сохранить',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 52.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
