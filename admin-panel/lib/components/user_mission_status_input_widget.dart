import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_mission_status_input_model.dart';
export 'user_mission_status_input_model.dart';

class UserMissionStatusInputWidget extends StatefulWidget {
  const UserMissionStatusInputWidget({
    super.key,
    required this.viewUsersMission,
    required this.onTap,
  });

  final ViewUserMissionsRow? viewUsersMission;
  final Future Function(String? value)? onTap;

  @override
  State<UserMissionStatusInputWidget> createState() =>
      _UserMissionStatusInputWidgetState();
}

class _UserMissionStatusInputWidgetState
    extends State<UserMissionStatusInputWidget> {
  late UserMissionStatusInputModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserMissionStatusInputModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlutterFlowDropDown<String>(
      controller: _model.userMissionStatusInputValueController ??=
          FormFieldController<String>(
        _model.userMissionStatusInputValue ??=
            widget.viewUsersMission?.status != null &&
                    widget.viewUsersMission?.status != ''
                ? widget.viewUsersMission?.status
                : '',
      ),
      options: List<String>.from(
          FFAppState().userMissionStatus.map((e) => e.option).toList()),
      optionLabels: FFAppState().userMissionStatus.map((e) => e.label).toList(),
      onChanged: (val) async {
        safeSetState(() => _model.userMissionStatusInputValue = val);
        await widget.onTap?.call(
          _model.userMissionStatusInputValue,
        );
      },
      width: 200.0,
      height: 40.0,
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
            letterSpacing: 0.0,
            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
          ),
      hintText: 'Выберите',
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 24.0,
      ),
      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 2.0,
      borderColor: Colors.transparent,
      borderWidth: 0.0,
      borderRadius: 8.0,
      margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
      hidesUnderline: true,
      isOverButton: false,
      isSearchable: false,
      isMultiSelect: false,
    );
  }
}
