import '/backend/schema/structs/index.dart';
import '/components/quiz_variant_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'quiz_list_item_model.dart';
export 'quiz_list_item_model.dart';

class QuizListItemWidget extends StatefulWidget {
  const QuizListItemWidget({
    super.key,
    required this.quizDataItem,
    required this.onDelete,
    required this.onChange,
    required this.index,
  });

  final MissionQuizDataStruct? quizDataItem;
  final Future Function()? onDelete;
  final Future Function(MissionQuizDataStruct? quizData)? onChange;
  final int? index;

  @override
  State<QuizListItemWidget> createState() => _QuizListItemWidgetState();
}

class _QuizListItemWidgetState extends State<QuizListItemWidget> {
  late QuizListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizListItemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.quizDataItem != null) {
        _model.quizData = widget.quizDataItem;
        safeSetState(() {});
        safeSetState(() {
          _model.questionInputTextController?.text =
              widget.quizDataItem!.question;
        });
        safeSetState(() {
          _model.correctAnswerInputTextController?.text =
              widget.quizDataItem!.correctAnswer;
        });
      } else {
        return;
      }
    });

    _model.questionInputTextController ??= TextEditingController();
    _model.questionInputFocusNode ??= FocusNode();
    _model.questionInputFocusNode!.addListener(() => safeSetState(() {}));
    _model.correctAnswerInputTextController ??= TextEditingController();
    _model.correctAnswerInputFocusNode ??= FocusNode();
    _model.correctAnswerInputFocusNode!.addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Builder(
                builder: (context) {
                  if (_model.quizData?.isValidated ?? false) {
                    return Icon(
                      Icons.check_circle,
                      color: Color(0xFF5F8E0E),
                      size: 32.0,
                    );
                  } else {
                    return Icon(
                      Icons.remove_circle_rounded,
                      color: Color(0xFFC05A19),
                      size: 32.0,
                    );
                  }
                },
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Вопрос ${((widget.index!) + 1).toString()}',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).labelMediumIsCustom,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                child: FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    await widget.onDelete?.call();
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Container(
              width: double.infinity,
              child: TextFormField(
                controller: _model.questionInputTextController,
                focusNode: _model.questionInputFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.questionInputTextController',
                  Duration(milliseconds: 500),
                  () async {
                    _model.updateQuizDataStruct(
                      (e) =>
                          e..question = _model.questionInputTextController.text,
                    );
                    safeSetState(() {});
                    await _model.isValidate(context);
                    safeSetState(() {});
                    await widget.onChange?.call(
                      _model.quizData,
                    );
                  },
                ),
                autofocus: false,
                textInputAction: TextInputAction.done,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Вопрос',
                  labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                  hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).inputFieldBorder,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 20.0),
                  hoverColor: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                    ),
                cursorColor: FlutterFlowTheme.of(context).primaryText,
                validator: _model.questionInputTextControllerValidator
                    .asValidator(context),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            child: Text(
              'Ответы:',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Builder(
              builder: (context) {
                final childAnswers =
                    widget.quizDataItem?.answers.toList() ?? [];

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children:
                      List.generate(childAnswers.length, (childAnswersIndex) {
                    final childAnswersItem = childAnswers[childAnswersIndex];
                    return QuizVariantItemWidget(
                      key: Key(
                          'Keyv3p_${childAnswersIndex}_of_${childAnswers.length}'),
                      answer: childAnswersItem,
                      onDelete: () async {
                        _model.updateQuizDataStruct(
                          (e) => e
                            ..updateAnswers(
                              (e) => e.removeAt(childAnswersIndex),
                            ),
                        );
                        safeSetState(() {});
                        await _model.isValidate(context);
                        await widget.onChange?.call(
                          _model.quizData,
                        );
                      },
                      onUpdate: (answer) async {
                        _model.updateQuizDataStruct(
                          (e) => e
                            ..updateAnswers(
                              (e) => e[childAnswersIndex] = answer!,
                            ),
                        );
                        safeSetState(() {});
                        await _model.isValidate(context);
                        await widget.onChange?.call(
                          _model.quizData,
                        );
                      },
                    );
                  }).divide(SizedBox(height: 8.0)),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                _model.updateQuizDataStruct(
                  (e) => e
                    ..updateAnswers(
                      (e) => e.add(''),
                    ),
                );
                safeSetState(() {});
                await _model.isValidate(context);
                await widget.onChange?.call(
                  _model.quizData,
                );
              },
              text: 'Добавить новый вариант',
              options: FFButtonOptions(
                width: double.infinity,
                height: 52.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFF3E5A79),
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            child: Text(
              'Укажите верный ответ',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Container(
              width: double.infinity,
              child: TextFormField(
                controller: _model.correctAnswerInputTextController,
                focusNode: _model.correctAnswerInputFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.correctAnswerInputTextController',
                  Duration(milliseconds: 500),
                  () async {
                    _model.updateQuizDataStruct(
                      (e) => e
                        ..correctAnswer =
                            _model.correctAnswerInputTextController.text,
                    );
                    safeSetState(() {});
                    await _model.isValidate(context);
                    safeSetState(() {});
                    await widget.onChange?.call(
                      _model.quizData,
                    );
                  },
                ),
                autofocus: false,
                textInputAction: TextInputAction.done,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Правильный ответ',
                  labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                  hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).inputFieldBorder,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 20.0),
                  hoverColor: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                    ),
                cursorColor: FlutterFlowTheme.of(context).primaryText,
                validator: _model.correctAnswerInputTextControllerValidator
                    .asValidator(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
