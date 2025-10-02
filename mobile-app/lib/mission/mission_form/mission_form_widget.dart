import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_blue_widget.dart';
import '/components/mission_form_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mission_form_model.dart';
export 'mission_form_model.dart';

class MissionFormWidget extends StatefulWidget {
  const MissionFormWidget({
    super.key,
    required this.viewMissionsRow,
  });

  final ViewMissionsRow? viewMissionsRow;

  static String routeName = 'MissionForm';
  static String routePath = '/missionForm';

  @override
  State<MissionFormWidget> createState() => _MissionFormWidgetState();
}

class _MissionFormWidgetState extends State<MissionFormWidget> {
  late MissionFormModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MissionFormModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.viewMissionsRow?.content != null) {
        _model.missionForm = MissionFormStruct.maybeFromMap(
            functions.dynamicToJson(widget!.viewMissionsRow?.content));
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
                    'Заполните форму',
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
                          if (_model.missionForm?.title != null &&
                              _model.missionForm?.title != '')
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  _model.missionForm?.title,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final childMissionForm = _model
                                        .missionForm?.missionFormData
                                        ?.toList() ??
                                    [];

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children:
                                      List.generate(childMissionForm.length,
                                          (childMissionFormIndex) {
                                    final childMissionFormItem =
                                        childMissionForm[childMissionFormIndex];
                                    return MissionFormItemWidget(
                                      key: Key(
                                          'Keywuv_${childMissionFormIndex}_of_${childMissionForm.length}'),
                                      label: valueOrDefault<String>(
                                        childMissionFormItem.label,
                                        'null',
                                      ),
                                      myText: childMissionFormItem.myText,
                                      onChange: (myText) async {
                                        _model.updateMissionFormStruct(
                                          (e) => e
                                            ..updateMissionFormData(
                                              (e) => e[childMissionFormIndex]
                                                ..myText = myText,
                                            ),
                                        );
                                        safeSetState(() {});
                                      },
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
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (_model.missionForm?.missionFormData
                                  ?.where(
                                      (e) => e.myText != null && e.myText != '')
                                  .toList()
                                  ?.length ==
                              _model.missionForm?.missionFormData?.length) {
                            HapticFeedback.mediumImpact();
                            await UserMissionsTable().insert({
                              'playload': _model.missionForm?.toMap(),
                              'status': UserMissionStatus.pending.name,
                              'mission_id': widget!.viewMissionsRow?.id,
                              'user_id': currentUserUid,
                            });
                            context.safePop();
                          } else {
                            HapticFeedback.vibrate();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Заполните все поля',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                  textAlign: TextAlign.start,
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .bottomBackground,
                              ),
                            );
                            return;
                          }
                        },
                        child: wrapWithModel(
                          model: _model.buttonBlueModel,
                          updateCallback: () => safeSetState(() {}),
                          child: ButtonBlueWidget(
                            name: 'Завершить',
                            isInactive: _model.missionForm?.missionFormData
                                    ?.where((e) =>
                                        e.myText != null && e.myText != '')
                                    .toList()
                                    ?.length !=
                                _model.missionForm?.missionFormData?.length,
                          ),
                        ),
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
