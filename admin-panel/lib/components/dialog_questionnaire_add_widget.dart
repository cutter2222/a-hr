import '/backend/schema/structs/index.dart';
import '/components/questionnaire_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dialog_questionnaire_add_model.dart';
export 'dialog_questionnaire_add_model.dart';

class DialogQuestionnaireAddWidget extends StatefulWidget {
  const DialogQuestionnaireAddWidget({
    super.key,
    this.missionQuestionnaire,
  });

  final MissionQuestionnaireStruct? missionQuestionnaire;

  @override
  State<DialogQuestionnaireAddWidget> createState() =>
      _DialogQuestionnaireAddWidgetState();
}

class _DialogQuestionnaireAddWidgetState
    extends State<DialogQuestionnaireAddWidget> {
  late DialogQuestionnaireAddModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DialogQuestionnaireAddModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.missionQuestionnaire != null) {
        _model.missionQuestionnaire = widget.missionQuestionnaire;
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
                              'Создать опрос',
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
                                  final childQuestionnaire = _model
                                          .missionQuestionnaire
                                          ?.missionQuestionnaireData
                                          .toList() ??
                                      [];

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children:
                                        List.generate(childQuestionnaire.length,
                                            (childQuestionnaireIndex) {
                                      final childQuestionnaireItem =
                                          childQuestionnaire[
                                              childQuestionnaireIndex];
                                      return QuestionnaireListItemWidget(
                                        key: Key(
                                            'Keyplp_${childQuestionnaireIndex}_of_${childQuestionnaire.length}'),
                                        index: childQuestionnaireIndex,
                                        questionnaireDatatem:
                                            childQuestionnaireItem,
                                        onDelete: () async {
                                          _model
                                              .updateMissionQuestionnaireStruct(
                                            (e) => e
                                              ..updateMissionQuestionnaireData(
                                                (e) => e.removeAt(
                                                    childQuestionnaireIndex),
                                              ),
                                          );
                                          safeSetState(() {});
                                        },
                                        onChange: (questionnaireData) async {
                                          _model
                                              .updateMissionQuestionnaireStruct(
                                            (e) => e
                                              ..updateMissionQuestionnaireData(
                                                (e) =>
                                                    e[childQuestionnaireIndex] =
                                                        questionnaireData!,
                                              ),
                                          );
                                          safeSetState(() {});
                                        },
                                      );
                                    }).divide(SizedBox(height: 24.0)),
                                  );
                                },
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    _model.updateMissionQuestionnaireStruct(
                                      (e) => e
                                        ..updateMissionQuestionnaireData(
                                          (e) => e.add(
                                              MissionQuestionnaireDataStruct()),
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
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                              ),
                            ]
                                .addToStart(SizedBox(height: 24.0))
                                .addToEnd(SizedBox(height: 24.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (_model.isValidate &&
                  !((_model.missionQuestionnaire!.missionQuestionnaireData
                          .where((e) => e.isValidated)
                          .toList()
                          .isNotEmpty) &&
                      !(_model.missionQuestionnaire!.missionQuestionnaireData
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
                    if ((_model.missionQuestionnaire!.missionQuestionnaireData
                            .where((e) => e.isValidated)
                            .toList()
                            .isNotEmpty) &&
                        !(_model.missionQuestionnaire!.missionQuestionnaireData
                            .where((e) => !e.isValidated)
                            .toList()
                            .isNotEmpty)) {
                      Navigator.pop(context, _model.missionQuestionnaire);
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
