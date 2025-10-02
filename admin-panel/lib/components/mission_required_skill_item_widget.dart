import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'mission_required_skill_item_model.dart';
export 'mission_required_skill_item_model.dart';

class MissionRequiredSkillItemWidget extends StatefulWidget {
  const MissionRequiredSkillItemWidget({
    super.key,
    required this.missionRequiredSkill,
    required this.onChange,
    required this.onDelete,
  });

  final MissionSkillsDataStruct? missionRequiredSkill;
  final Future Function(MissionSkillsDataStruct? onChangeItem)? onChange;
  final Future Function()? onDelete;

  @override
  State<MissionRequiredSkillItemWidget> createState() =>
      _MissionRequiredSkillItemWidgetState();
}

class _MissionRequiredSkillItemWidgetState
    extends State<MissionRequiredSkillItemWidget> {
  late MissionRequiredSkillItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MissionRequiredSkillItemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {
        _model.skillPointsTextController?.text =
            widget.missionRequiredSkill!.skillPoints.toString();
        _model.skillPointsMask.updateMask(
          newValue: TextEditingValue(
            text: _model.skillPointsTextController!.text,
          ),
        );
      });
    });

    _model.skillPointsTextController ??= TextEditingController();
    _model.skillPointsFocusNode ??= FocusNode();
    _model.skillPointsFocusNode!.addListener(() => safeSetState(() {}));
    _model.skillPointsMask = MaskTextInputFormatter(mask: '##');
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
      height: 70.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget.missionRequiredSkill?.name,
                  'null',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                    ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: TextFormField(
                controller: _model.skillPointsTextController,
                focusNode: _model.skillPointsFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.skillPointsTextController',
                  Duration(milliseconds: 500),
                  () async {
                    await widget.onChange?.call(
                      MissionSkillsDataStruct(
                        skillId: widget.missionRequiredSkill?.skillId,
                        name: widget.missionRequiredSkill?.name,
                        skillPoints: double.tryParse(
                            _model.skillPointsTextController.text),
                        id: widget.missionRequiredSkill?.id,
                        isUpdated: true,
                      ),
                    );
                  },
                ),
                autofocus: false,
                textInputAction: TextInputAction.done,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: true,
                  labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                  hintText: 'Очков навыков',
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
                validator: _model.skillPointsTextControllerValidator
                    .asValidator(context),
                inputFormatters: [_model.skillPointsMask],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await widget.onDelete?.call();
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Icon(
                    Icons.close_outlined,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
