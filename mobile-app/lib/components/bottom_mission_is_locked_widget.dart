import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_blue_widget.dart';
import '/components/choice_chips_widget.dart';
import '/components/missions_list_item_widget.dart';
import '/components/skill_compare_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_mission_is_locked_model.dart';
export 'bottom_mission_is_locked_model.dart';

class BottomMissionIsLockedWidget extends StatefulWidget {
  const BottomMissionIsLockedWidget({
    super.key,
    required this.missionId,
  });

  final int? missionId;

  @override
  State<BottomMissionIsLockedWidget> createState() =>
      _BottomMissionIsLockedWidgetState();
}

class _BottomMissionIsLockedWidgetState
    extends State<BottomMissionIsLockedWidget> with TickerProviderStateMixin {
  late BottomMissionIsLockedModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomMissionIsLockedModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
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
      constraints: BoxConstraints(
        minHeight: 420.0,
        maxHeight: MediaQuery.sizeOf(context).height * 0.9,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).bottomBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
              child: Container(
                width: 32.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).inputBorder,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 6.0, 16.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Почему миссия недоступна?',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                    width: 32.0,
                    height: 32.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).inputBorder,
                      shape: BoxShape.circle,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        FFIcons.kcloseMD,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: FutureBuilder<List<ViewMissionsRow>>(
              future: ViewMissionsTable().querySingleRow(
                queryFn: (q) => q.eqOrNull(
                  'id',
                  widget!.missionId,
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
                List<ViewMissionsRow> containerViewMissionsRowList =
                    snapshot.data!;

                final containerViewMissionsRow =
                    containerViewMissionsRowList.isNotEmpty
                        ? containerViewMissionsRowList.first
                        : null;

                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Давайте разберем почему миссия недоступна для вас',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                ),
                          ),
                          if (!containerViewMissionsRow!.isBranchConditionMet!)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 42.0, 0.0, 0.0),
                              child: FutureBuilder<
                                  List<MissionRequiredMissionsRow>>(
                                future:
                                    MissionRequiredMissionsTable().queryRows(
                                  queryFn: (q) => q.eqOrNull(
                                    'mission_id',
                                    widget!.missionId,
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
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 28.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<MissionRequiredMissionsRow>
                                      missionRequiredBranchMissionRequiredMissionsRowList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Выберите подходящую для миссии ветку',
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
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final branchNames =
                                                  containerViewMissionsRow
                                                          ?.requiredBranchNames
                                                          ?.toList() ??
                                                      [];

                                              return Wrap(
                                                spacing: 8.0,
                                                runSpacing: 8.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: List.generate(
                                                    branchNames.length,
                                                    (branchNamesIndex) {
                                                  final branchNamesItem =
                                                      branchNames[
                                                          branchNamesIndex];
                                                  return ChoiceChipsWidget(
                                                    key: Key(
                                                        'Key4o4_${branchNamesIndex}_of_${branchNames.length}'),
                                                    text:
                                                        valueOrDefault<String>(
                                                      branchNamesItem,
                                                      'null',
                                                    ),
                                                    isPicked: true,
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              var _shouldSetState = false;
                                              _model.viewUsers =
                                                  await ViewUsersTable()
                                                      .queryRows(
                                                queryFn: (q) => q.eqOrNull(
                                                  'id',
                                                  currentUserUid,
                                                ),
                                              );
                                              _shouldSetState = true;
                                              if (_model.viewUsers != null &&
                                                  (_model.viewUsers)!
                                                      .isNotEmpty) {
                                                context.pushNamed(
                                                  BranchesWidget.routeName,
                                                  queryParameters: {
                                                    'viewUsers': serializeParam(
                                                      _model.viewUsers
                                                          ?.elementAtOrNull(0),
                                                      ParamType.SupabaseRow,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                            },
                                            child: wrapWithModel(
                                              model: _model.buttonBlueModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: ButtonBlueWidget(
                                                name: 'Сменить ветку',
                                                isInactive: false,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          if (!containerViewMissionsRow!.isSkillConditionMet!)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 42.0, 0.0, 0.0),
                              child:
                                  FutureBuilder<List<MissionRequiredSkillsRow>>(
                                future: MissionRequiredSkillsTable().queryRows(
                                  queryFn: (q) => q.eqOrNull(
                                    'mission_id',
                                    widget!.missionId,
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
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 28.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<MissionRequiredSkillsRow>
                                      missionRequiredSkillsMissionRequiredSkillsRowList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Повышайте навыки выбирая подходящие для этого миссии',
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
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: FutureBuilder<
                                              List<ViewSkillsRow>>(
                                            future: ViewSkillsTable().queryRows(
                                              queryFn: (q) => q,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 28.0,
                                                    height: 28.0,
                                                    child: SpinKitPulse(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 28.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ViewSkillsRow>
                                                  columnViewSkillsRowList =
                                                  snapshot.data!;

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    columnViewSkillsRowList
                                                        .length, (columnIndex) {
                                                  final columnViewSkillsRow =
                                                      columnViewSkillsRowList[
                                                          columnIndex];
                                                  return Visibility(
                                                    visible: missionRequiredSkillsMissionRequiredSkillsRowList
                                                        .where((e) =>
                                                            e.requiredSkillId ==
                                                            columnViewSkillsRow
                                                                .id)
                                                        .toList()
                                                        .isNotEmpty,
                                                    child:
                                                        SkillCompareItemWidget(
                                                      key: Key(
                                                          'Key8pc_${columnIndex}_of_${columnViewSkillsRowList.length}'),
                                                      skillRequiredPoints:
                                                          valueOrDefault<
                                                              double>(
                                                        missionRequiredSkillsMissionRequiredSkillsRowList
                                                            .where((e) =>
                                                                e.requiredSkillId ==
                                                                columnViewSkillsRow
                                                                    .id)
                                                            .toList()
                                                            .firstOrNull
                                                            ?.requiredSkillPoints,
                                                        0.0,
                                                      ),
                                                      viewSkillsRow:
                                                          columnViewSkillsRow,
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              var _shouldSetState = false;
                                              _model.viewUsers2 =
                                                  await ViewUsersTable()
                                                      .queryRows(
                                                queryFn: (q) => q.eqOrNull(
                                                  'id',
                                                  currentUserUid,
                                                ),
                                              );
                                              _shouldSetState = true;
                                              if (_model.viewUsers2 != null &&
                                                  (_model.viewUsers2)!
                                                      .isNotEmpty) {
                                                context.pushNamed(
                                                  BranchesWidget.routeName,
                                                  queryParameters: {
                                                    'viewUsers': serializeParam(
                                                      _model.viewUsers2
                                                          ?.elementAtOrNull(0),
                                                      ParamType.SupabaseRow,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                            },
                                            child: wrapWithModel(
                                              model: _model.buttonBlueModel2,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: ButtonBlueWidget(
                                                name: 'Подробнее о навыках',
                                                isInactive: false,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          if (!containerViewMissionsRow!.isMissionConditionMet!)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 42.0, 0.0, 0.0),
                              child: FutureBuilder<
                                  List<MissionRequiredMissionsRow>>(
                                future:
                                    MissionRequiredMissionsTable().queryRows(
                                  queryFn: (q) => q.eqOrNull(
                                    'mission_id',
                                    widget!.missionId,
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
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 28.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<MissionRequiredMissionsRow>
                                      missionRequiredMissionsMissionRequiredMissionsRowList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Пройдите миссии для доступа к текущей',
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
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: FutureBuilder<
                                              List<ViewMissionsRow>>(
                                            future:
                                                ViewMissionsTable().queryRows(
                                              queryFn: (q) => q.inFilterOrNull(
                                                'id',
                                                missionRequiredMissionsMissionRequiredMissionsRowList
                                                    .map((e) =>
                                                        e.requiredMissionId)
                                                    .withoutNulls
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 28.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ViewMissionsRow>
                                                  viewMissionsViewMissionsRowList =
                                                  snapshot.data!;

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: List.generate(
                                                    viewMissionsViewMissionsRowList
                                                        .length,
                                                    (viewMissionsIndex) {
                                                  final viewMissionsViewMissionsRow =
                                                      viewMissionsViewMissionsRowList[
                                                          viewMissionsIndex];
                                                  return MissionsListItemWidget(
                                                    key: Key(
                                                        'Keyoky_${viewMissionsIndex}_of_${viewMissionsViewMissionsRowList.length}'),
                                                    index: viewMissionsIndex,
                                                    isUnlocked:
                                                        viewMissionsViewMissionsRow
                                                            .isUnlocked,
                                                    viewMissionsRow:
                                                        viewMissionsViewMissionsRow,
                                                  );
                                                }).divide(
                                                    SizedBox(height: 8.0)),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                        ]
                            .addToStart(SizedBox(height: 24.0))
                            .addToEnd(SizedBox(height: 50.0)),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
