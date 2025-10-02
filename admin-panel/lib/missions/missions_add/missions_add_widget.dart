import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/app_bar_widget.dart';
import '/components/dialog_form_add_widget.dart';
import '/components/dialog_questionnaire_add_widget.dart';
import '/components/dialog_quiz_add_widget.dart';
import '/components/mission_required_skill_item_widget.dart';
import '/components/navbar_desktop/navbar_desktop_widget.dart';
import '/components/navbar_mobile/navbar_mobile_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'missions_add_model.dart';
export 'missions_add_model.dart';

class MissionsAddWidget extends StatefulWidget {
  const MissionsAddWidget({
    super.key,
    this.missionsRow,
  });

  final MissionsRow? missionsRow;

  static String routeName = 'MissionsAdd';
  static String routePath = 'missionsAdd';

  @override
  State<MissionsAddWidget> createState() => _MissionsAddWidgetState();
}

class _MissionsAddWidgetState extends State<MissionsAddWidget> {
  late MissionsAddModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MissionsAddModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.missionsRow != null) {
        _model.content = widget.missionsRow?.content;
        safeSetState(() {});
        _model.queryRequiredBranches =
            await MissionRequiredBranchesTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'mission_id',
            widget.missionsRow?.id,
          ),
        );
        if (_model.queryRequiredBranches != null &&
            (_model.queryRequiredBranches)!.isNotEmpty) {
          _model.initialBranchIds = _model.queryRequiredBranches!
              .map((e) => e.requiredBranchId)
              .withoutNulls
              .toList()
              .toList()
              .cast<int>();
          _model.requiredBranchIds = _model.queryRequiredBranches!
              .map((e) => e.requiredBranchId)
              .withoutNulls
              .toList()
              .toList()
              .cast<int>();
          safeSetState(() {});
        }
        _model.successedLoops = _model.successedLoops + 1;
        safeSetState(() {});
        _model.queryMissionRewards = await MissionRewardsTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'mission_id',
            widget.missionsRow?.id,
          ),
        );
        if (_model.queryMissionRewards != null &&
            (_model.queryMissionRewards)!.isNotEmpty) {
          _model.initialRewardIds = _model.queryMissionRewards!
              .map((e) => e.rewardId)
              .withoutNulls
              .toList()
              .toList()
              .cast<int>();
          _model.missionRewardIds = _model.queryMissionRewards!
              .map((e) => e.rewardId)
              .withoutNulls
              .toList()
              .toList()
              .cast<int>();
          safeSetState(() {});
        }
        _model.successedLoops = _model.successedLoops + 1;
        safeSetState(() {});
        _model.queryRequiredMissions =
            await MissionRequiredMissionsTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'mission_id',
            widget.missionsRow?.id,
          ),
        );
        if (_model.queryRequiredMissions != null &&
            (_model.queryRequiredMissions)!.isNotEmpty) {
          _model.initialMissionIds = _model.queryRequiredMissions!
              .map((e) => e.requiredMissionId)
              .withoutNulls
              .toList()
              .toList()
              .cast<int>();
          _model.requiredMissionIds = _model.queryRequiredMissions!
              .map((e) => e.requiredMissionId)
              .withoutNulls
              .toList()
              .toList()
              .cast<int>();
          safeSetState(() {});
        }
        _model.successedLoops = _model.successedLoops + 1;
        safeSetState(() {});
        _model.queryViewRequiredSkill =
            await ViewMissionRequiredSkillsTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'mission_id',
            widget.missionsRow?.id,
          ),
        );
        if (_model.queryViewRequiredSkill != null &&
            (_model.queryViewRequiredSkill)!.isNotEmpty) {
          for (int loop1Index = 0;
              loop1Index < _model.queryViewRequiredSkill!.length;
              loop1Index++) {
            final currentLoop1Item = _model.queryViewRequiredSkill![loop1Index];
            _model.addToRequiredSkills(MissionSkillsDataStruct(
              skillId: currentLoop1Item.requiredSkillId,
              skillPoints: currentLoop1Item.requiredSkillPoints,
              name: currentLoop1Item.skillName,
              id: currentLoop1Item.id,
            ));
            safeSetState(() {});
          }
        }
        _model.viewMissionSkills = await ViewMissionSkillsTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'mission_id',
            widget.missionsRow?.id,
          ),
        );
        if (_model.viewMissionSkills != null &&
            (_model.viewMissionSkills)!.isNotEmpty) {
          for (int loop2Index = 0;
              loop2Index < _model.viewMissionSkills!.length;
              loop2Index++) {
            final currentLoop2Item = _model.viewMissionSkills![loop2Index];
            _model.addToMissionSkills(MissionSkillsDataStruct(
              id: currentLoop2Item.id,
              name: currentLoop2Item.skillName,
              skillId: currentLoop2Item.skillId,
              skillPoints: currentLoop2Item.skillUpPoints,
            ));
            safeSetState(() {});
          }
        }
        _model.isLoaded = true;
        safeSetState(() {});
        _model.successedLoops = _model.successedLoops + 1;
        safeSetState(() {});
        safeSetState(() {
          _model.nameInputTextController?.text = widget.missionsRow!.title!;
        });
        safeSetState(() {
          _model.descriptionInputTextController?.text =
              widget.missionsRow!.description!;
        });
        safeSetState(() {
          _model.taskInputTextController?.text = widget.missionsRow!.task!;
        });
        safeSetState(() {
          _model.xpPointsInputTextController?.text =
              widget.missionsRow!.xpPoints!.toString();
          _model.xpPointsInputMask.updateMask(
            newValue: TextEditingValue(
              text: _model.xpPointsInputTextController!.text,
            ),
          );
        });
        safeSetState(() {
          _model.coinsInputTextController?.text =
              widget.missionsRow!.coins.toString();
          _model.coinsInputMask.updateMask(
            newValue: TextEditingValue(
              text: _model.coinsInputTextController!.text,
            ),
          );
        });
        safeSetState(() {
          _model.orderIndexInputTextController?.text =
              widget.missionsRow!.orderIndex!.toString();
        });
        safeSetState(() {
          _model.archiveChecboxValue = widget.missionsRow!.isArchived;
        });
      } else {
        _model.isLoaded = true;
        safeSetState(() {});
        return;
      }
    });

    _model.nameInputTextController ??= TextEditingController();
    _model.nameInputFocusNode ??= FocusNode();
    _model.nameInputFocusNode!.addListener(() => safeSetState(() {}));
    _model.descriptionInputTextController ??= TextEditingController();
    _model.descriptionInputFocusNode ??= FocusNode();
    _model.descriptionInputFocusNode!.addListener(() => safeSetState(() {}));
    _model.taskInputTextController ??= TextEditingController();
    _model.taskInputFocusNode ??= FocusNode();
    _model.taskInputFocusNode!.addListener(() => safeSetState(() {}));
    _model.xpPointsInputTextController ??= TextEditingController();
    _model.xpPointsInputFocusNode ??= FocusNode();
    _model.xpPointsInputFocusNode!.addListener(() => safeSetState(() {}));
    _model.xpPointsInputMask = MaskTextInputFormatter(mask: '####');
    _model.coinsInputTextController ??= TextEditingController();
    _model.coinsInputFocusNode ??= FocusNode();
    _model.coinsInputFocusNode!.addListener(() => safeSetState(() {}));
    _model.coinsInputMask = MaskTextInputFormatter(mask: '####');
    _model.orderIndexInputTextController ??= TextEditingController();
    _model.orderIndexInputFocusNode ??= FocusNode();
    _model.orderIndexInputFocusNode!.addListener(() => safeSetState(() {}));
    _model.textController7 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
            ))
              wrapWithModel(
                model: _model.navbarDesktopModel,
                updateCallback: () => safeSetState(() {}),
                child: NavbarDesktopWidget(),
              ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: double.infinity,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      wrapWithModel(
                                        model: _model.appBarModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: AppBarWidget(
                                          title: 'миссию',
                                          isTitle: widget.missionsRow != null,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 24.0, 0.0, 0.0),
                                          child: Form(
                                            key: _model.formKey,
                                            autovalidateMode:
                                                AutovalidateMode.disabled,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .nameInputTextController,
                                                      focusNode: _model
                                                          .nameInputFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.nameInputTextController',
                                                        Duration(
                                                            milliseconds: 500),
                                                        () =>
                                                            safeSetState(() {}),
                                                      ),
                                                      autofocus: false,
                                                      textInputAction:
                                                          TextInputAction.done,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelText:
                                                            'Название миссии',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .inputFieldBorder,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    20.0,
                                                                    16.0,
                                                                    20.0),
                                                        hoverColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .nameInputTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .descriptionInputTextController,
                                                      focusNode: _model
                                                          .descriptionInputFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.descriptionInputTextController',
                                                        Duration(
                                                            milliseconds: 500),
                                                        () =>
                                                            safeSetState(() {}),
                                                      ),
                                                      autofocus: false,
                                                      textInputAction:
                                                          TextInputAction.done,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelText:
                                                            'Описание миссии',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .inputFieldBorder,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    20.0,
                                                                    16.0,
                                                                    20.0),
                                                        hoverColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                      maxLines: 6,
                                                      minLines: 3,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .descriptionInputTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .taskInputTextController,
                                                      focusNode: _model
                                                          .taskInputFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.taskInputTextController',
                                                        Duration(
                                                            milliseconds: 500),
                                                        () =>
                                                            safeSetState(() {}),
                                                      ),
                                                      autofocus: false,
                                                      textInputAction:
                                                          TextInputAction.done,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelText:
                                                            'Задачи миссии',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .inputFieldBorder,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    20.0,
                                                                    16.0,
                                                                    20.0),
                                                        hoverColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                      maxLines: 4,
                                                      minLines: 2,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .taskInputTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  if (_model.isLoaded)
                                                    FutureBuilder<
                                                        List<BranchesRow>>(
                                                      future: BranchesTable()
                                                          .queryRows(
                                                        queryFn: (q) => q,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<BranchesRow>
                                                            requiredBranchInputBranchesRowList =
                                                            snapshot.data!;

                                                        return FlutterFlowDropDown<
                                                            int>(
                                                          multiSelectController: _model
                                                                  .requiredBranchInputValueController ??=
                                                              FormListFieldController<
                                                                  int>(_model
                                                                      .requiredBranchInputValue ??=
                                                                  List<
                                                                      int>.from(
                                                            _model.requiredBranchIds ??
                                                                [],
                                                          )),
                                                          options: List<
                                                                  int>.from(
                                                              requiredBranchInputBranchesRowList
                                                                  .map((e) =>
                                                                      e.id)
                                                                  .toList()),
                                                          optionLabels:
                                                              requiredBranchInputBranchesRowList
                                                                  .map((e) =>
                                                                      e.name)
                                                                  .withoutNulls
                                                                  .toList(),
                                                          width:
                                                              double.infinity,
                                                          height: 50.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                          hintText:
                                                              'Выберите ветку',
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          elevation: 2.0,
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .inputFieldBorder,
                                                          borderWidth: 1.0,
                                                          borderRadius: 8.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          hidesUnderline: true,
                                                          isOverButton: false,
                                                          isSearchable: false,
                                                          isMultiSelect: true,
                                                          onMultiSelectChanged:
                                                              (val) async {
                                                            safeSetState(() =>
                                                                _model.requiredBranchInputValue =
                                                                    val);
                                                            _model.requiredBranchIds =
                                                                _model
                                                                    .requiredBranchInputValue!
                                                                    .toList()
                                                                    .cast<
                                                                        int>();
                                                            safeSetState(() {});
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  FlutterFlowDropDown<String>(
                                                    controller: _model
                                                            .roleInputValueController ??=
                                                        FormFieldController<
                                                            String>(
                                                      _model
                                                          .roleInputValue ??= (widget
                                                                      .missionsRow !=
                                                                  null) &&
                                                              (widget.missionsRow
                                                                          ?.role !=
                                                                      null &&
                                                                  widget.missionsRow
                                                                          ?.role !=
                                                                      '')
                                                          ? widget
                                                              .missionsRow?.role
                                                          : null,
                                                    ),
                                                    options: List<String>.from(
                                                        FFAppState()
                                                            .globalRole
                                                            .map(
                                                                (e) => e.option)
                                                            .toList()),
                                                    optionLabels: FFAppState()
                                                        .globalRole
                                                        .map((e) => e.label)
                                                        .toList(),
                                                    onChanged: (val) =>
                                                        safeSetState(() => _model
                                                                .roleInputValue =
                                                            val),
                                                    width: double.infinity,
                                                    height: 50.0,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                    hintText:
                                                        'Роль пользователя',
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .inputFieldBorder,
                                                    borderWidth: 1.0,
                                                    borderRadius: 8.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    hidesUnderline: true,
                                                    isOverButton: false,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                  Text(
                                                    'Требуемый ранг',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                  ),
                                                  FutureBuilder<List<RanksRow>>(
                                                    future:
                                                        RanksTable().queryRows(
                                                      queryFn: (q) => q,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<RanksRow>
                                                          requiredRankInputRanksRowList =
                                                          snapshot.data!;

                                                      return FlutterFlowDropDown<
                                                          int>(
                                                        controller: _model
                                                                .requiredRankInputValueController ??=
                                                            FormFieldController<
                                                                int>(
                                                          _model
                                                              .requiredRankInputValue ??= widget
                                                                      .missionsRow
                                                                      ?.requiredRankId !=
                                                                  null
                                                              ? widget
                                                                  .missionsRow
                                                                  ?.requiredRankId
                                                              : null,
                                                        ),
                                                        options: List<int>.from(
                                                            requiredRankInputRanksRowList
                                                                .map(
                                                                    (e) => e.id)
                                                                .toList()),
                                                        optionLabels:
                                                            requiredRankInputRanksRowList
                                                                .map((e) =>
                                                                    e.title)
                                                                .withoutNulls
                                                                .toList(),
                                                        onChanged: (val) =>
                                                            safeSetState(() =>
                                                                _model.requiredRankInputValue =
                                                                    val),
                                                        width: double.infinity,
                                                        height: 50.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        hintText:
                                                            'Выберите ранг',
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .inputFieldBorder,
                                                        borderWidth: 1.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        hidesUnderline: true,
                                                        isOverButton: false,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                      );
                                                    },
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .xpPointsInputTextController,
                                                            focusNode: _model
                                                                .xpPointsInputFocusNode,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.xpPointsInputTextController',
                                                              Duration(
                                                                  milliseconds:
                                                                      500),
                                                              () =>
                                                                  safeSetState(
                                                                      () {}),
                                                            ),
                                                            autofocus: false,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .done,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelText:
                                                                  'Очки опыта',
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .inputFieldBorder,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          20.0,
                                                                          16.0,
                                                                          20.0),
                                                              hoverColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .xpPointsInputTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                            inputFormatters: [
                                                              _model
                                                                  .xpPointsInputMask
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .coinsInputTextController,
                                                            focusNode: _model
                                                                .coinsInputFocusNode,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.coinsInputTextController',
                                                              Duration(
                                                                  milliseconds:
                                                                      500),
                                                              () =>
                                                                  safeSetState(
                                                                      () {}),
                                                            ),
                                                            autofocus: false,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .done,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelText:
                                                                  'Монеты',
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .inputFieldBorder,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          20.0,
                                                                          16.0,
                                                                          20.0),
                                                              hoverColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .coinsInputTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                            inputFormatters: [
                                                              _model
                                                                  .coinsInputMask
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                  Text(
                                                    'Награды за миссию',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                  ),
                                                  if (_model.isLoaded)
                                                    FutureBuilder<
                                                        List<RewardsRow>>(
                                                      future: RewardsTable()
                                                          .queryRows(
                                                        queryFn: (q) => q,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<RewardsRow>
                                                            missionRewardsInputRewardsRowList =
                                                            snapshot.data!;

                                                        return FlutterFlowDropDown<
                                                            int>(
                                                          multiSelectController: _model
                                                                  .missionRewardsInputValueController ??=
                                                              FormListFieldController<
                                                                  int>(_model
                                                                      .missionRewardsInputValue ??=
                                                                  List<
                                                                      int>.from(
                                                            _model.missionRewardIds ??
                                                                [],
                                                          )),
                                                          options: List<
                                                                  int>.from(
                                                              missionRewardsInputRewardsRowList
                                                                  .map((e) =>
                                                                      e.id)
                                                                  .toList()),
                                                          optionLabels:
                                                              missionRewardsInputRewardsRowList
                                                                  .map((e) =>
                                                                      e.name)
                                                                  .withoutNulls
                                                                  .toList(),
                                                          width:
                                                              double.infinity,
                                                          height: 50.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                          hintText:
                                                              'Выберите награды',
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          elevation: 2.0,
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .inputFieldBorder,
                                                          borderWidth: 1.0,
                                                          borderRadius: 8.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          hidesUnderline: true,
                                                          isOverButton: false,
                                                          isSearchable: false,
                                                          isMultiSelect: true,
                                                          onMultiSelectChanged:
                                                              (val) async {
                                                            safeSetState(() =>
                                                                _model.missionRewardsInputValue =
                                                                    val);
                                                            _model.missionRewardIds =
                                                                _model
                                                                    .missionRewardsInputValue!
                                                                    .toList()
                                                                    .cast<
                                                                        int>();
                                                            safeSetState(() {});
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  Text(
                                                    'Требуемые миссии для выполнения текущей',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                  ),
                                                  if (_model.isLoaded)
                                                    FutureBuilder<
                                                        List<MissionsRow>>(
                                                      future: MissionsTable()
                                                          .queryRows(
                                                        queryFn: (q) => q,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<MissionsRow>
                                                            requiredMissionsInputMissionsRowList =
                                                            snapshot.data!;

                                                        return FlutterFlowDropDown<
                                                            int>(
                                                          multiSelectController: _model
                                                                  .requiredMissionsInputValueController ??=
                                                              FormListFieldController<
                                                                  int>(_model
                                                                      .requiredMissionsInputValue ??=
                                                                  List<
                                                                      int>.from(
                                                            _model.requiredMissionIds ??
                                                                [],
                                                          )),
                                                          options: List<
                                                                  int>.from(
                                                              requiredMissionsInputMissionsRowList
                                                                  .map((e) =>
                                                                      e.id)
                                                                  .toList()),
                                                          optionLabels:
                                                              requiredMissionsInputMissionsRowList
                                                                  .map((e) =>
                                                                      e.title)
                                                                  .withoutNulls
                                                                  .toList(),
                                                          width:
                                                              double.infinity,
                                                          height: 50.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                          hintText:
                                                              'Выберите миссии',
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          elevation: 2.0,
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .inputFieldBorder,
                                                          borderWidth: 1.0,
                                                          borderRadius: 8.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          hidesUnderline: true,
                                                          isOverButton: false,
                                                          isSearchable: false,
                                                          isMultiSelect: true,
                                                          onMultiSelectChanged:
                                                              (val) async {
                                                            safeSetState(() =>
                                                                _model.requiredMissionsInputValue =
                                                                    val);
                                                            _model.requiredMissionIds =
                                                                _model
                                                                    .requiredMissionsInputValue!
                                                                    .toList()
                                                                    .cast<
                                                                        int>();
                                                            safeSetState(() {});
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  Text(
                                                    'Используется для сортировки последовательности миссий',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .orderIndexInputTextController,
                                                      focusNode: _model
                                                          .orderIndexInputFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.orderIndexInputTextController',
                                                        Duration(
                                                            milliseconds: 500),
                                                        () =>
                                                            safeSetState(() {}),
                                                      ),
                                                      autofocus: false,
                                                      textInputAction:
                                                          TextInputAction.done,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelText:
                                                            'Порядковый номер',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .inputFieldBorder,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    20.0,
                                                                    16.0,
                                                                    20.0),
                                                        hoverColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .orderIndexInputTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Тип миссии',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                  ),
                                                  FlutterFlowDropDown<String>(
                                                    controller: _model
                                                            .typeInputValueController ??=
                                                        FormFieldController<
                                                            String>(
                                                      _model
                                                          .typeInputValue ??= widget
                                                                      .missionsRow
                                                                      ?.type !=
                                                                  null &&
                                                              widget.missionsRow
                                                                      ?.type !=
                                                                  ''
                                                          ? widget
                                                              .missionsRow?.type
                                                          : null,
                                                    ),
                                                    options: List<String>.from(
                                                        FFAppState()
                                                            .missionType
                                                            .map(
                                                                (e) => e.option)
                                                            .toList()),
                                                    optionLabels: FFAppState()
                                                        .missionType
                                                        .map((e) => e.label)
                                                        .toList(),
                                                    onChanged: (val) =>
                                                        safeSetState(() => _model
                                                                .typeInputValue =
                                                            val),
                                                    width: double.infinity,
                                                    height: 50.0,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                    hintText: 'Выберите тип',
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .inputFieldBorder,
                                                    borderWidth: 1.0,
                                                    borderRadius: 8.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    hidesUnderline: true,
                                                    isOverButton: false,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                  if (_model.typeInputValue ==
                                                      MissionType.quiz.name)
                                                    Builder(
                                                      builder: (context) =>
                                                          FFButtonWidget(
                                                        onPressed: () async {
                                                          var _shouldSetState =
                                                              false;
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      DialogQuizAddWidget(
                                                                    missionQuiz:
                                                                        MissionQuizStruct.maybeFromMap(
                                                                            _model.content),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(() =>
                                                                  _model.quizOutput =
                                                                      value));

                                                          _shouldSetState =
                                                              true;
                                                          if (_model
                                                                  .quizOutput !=
                                                              null) {
                                                            _model.content =
                                                                _model
                                                                    .quizOutput
                                                                    ?.toMap();
                                                            safeSetState(() {});
                                                          } else {
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }

                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                        },
                                                        text: 'Добавить квиз',
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              double.infinity,
                                                          height: 52.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color:
                                                              Color(0x4A06AEEF),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                  if (_model.typeInputValue ==
                                                      MissionType.form.name)
                                                    Builder(
                                                      builder: (context) =>
                                                          FFButtonWidget(
                                                        onPressed: () async {
                                                          var _shouldSetState =
                                                              false;
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      DialogFormAddWidget(
                                                                    missionForm:
                                                                        MissionFormStruct.maybeFromMap(
                                                                            _model.content),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(() =>
                                                                  _model.formOutput =
                                                                      value));

                                                          _shouldSetState =
                                                              true;
                                                          if (_model
                                                                  .formOutput !=
                                                              null) {
                                                            _model.content =
                                                                _model
                                                                    .formOutput
                                                                    ?.toMap();
                                                            safeSetState(() {});
                                                          } else {
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }

                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                        },
                                                        text: 'Добавить форму',
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              double.infinity,
                                                          height: 52.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color:
                                                              Color(0x4A06AEEF),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                  if (_model.typeInputValue ==
                                                      MissionType
                                                          .questionnaire.name)
                                                    Builder(
                                                      builder: (context) =>
                                                          FFButtonWidget(
                                                        onPressed: () async {
                                                          var _shouldSetState =
                                                              false;
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      DialogQuestionnaireAddWidget(
                                                                    missionQuestionnaire:
                                                                        MissionQuestionnaireStruct.maybeFromMap(
                                                                            _model.content),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(() =>
                                                                  _model.questionnaireOutput =
                                                                      value));

                                                          _shouldSetState =
                                                              true;
                                                          if (_model
                                                                  .questionnaireOutput !=
                                                              null) {
                                                            _model.content = _model
                                                                .questionnaireOutput
                                                                ?.toMap();
                                                            safeSetState(() {});
                                                          } else {
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }

                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                        },
                                                        text: 'Добавить опрос',
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              double.infinity,
                                                          height: 52.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color:
                                                              Color(0x4A06AEEF),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                  Text(
                                                    'Требуемые навыки',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                  ),
                                                  FutureBuilder<
                                                      List<SkillsRow>>(
                                                    future:
                                                        SkillsTable().queryRows(
                                                      queryFn: (q) => q,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<SkillsRow>
                                                          requiredSkillInputSkillsRowList =
                                                          snapshot.data!;

                                                      return FlutterFlowDropDown<
                                                          int>(
                                                        controller: _model
                                                                .requiredSkillInputValueController ??=
                                                            FormFieldController<
                                                                int>(
                                                          _model.requiredSkillInputValue ??=
                                                              null,
                                                        ),
                                                        options: List<int>.from(
                                                            requiredSkillInputSkillsRowList
                                                                .map(
                                                                    (e) => e.id)
                                                                .toList()),
                                                        optionLabels:
                                                            requiredSkillInputSkillsRowList
                                                                .map((e) =>
                                                                    e.name)
                                                                .withoutNulls
                                                                .toList(),
                                                        onChanged: (val) async {
                                                          safeSetState(() =>
                                                              _model.requiredSkillInputValue =
                                                                  val);
                                                          if (!(_model
                                                                  .requiredSkills
                                                                  .where((e) =>
                                                                      e.skillId ==
                                                                      _model
                                                                          .requiredSkillInputValue)
                                                                  .toList()
                                                                  .isNotEmpty) &&
                                                              (_model.requiredSkillInputValue !=
                                                                  null) &&
                                                              (requiredSkillInputSkillsRowList
                                                                  .where((e) =>
                                                                      e.id ==
                                                                      _model
                                                                          .requiredSkillInputValue)
                                                                  .toList()
                                                                  .isNotEmpty)) {
                                                            _model.addToRequiredSkills(
                                                                MissionSkillsDataStruct(
                                                              name: requiredSkillInputSkillsRowList
                                                                  .where((e) =>
                                                                      e.id ==
                                                                      _model
                                                                          .requiredSkillInputValue)
                                                                  .toList()
                                                                  .elementAtOrNull(
                                                                      0)
                                                                  ?.name,
                                                              skillId: _model
                                                                  .requiredSkillInputValue,
                                                              isDeleted: false,
                                                            ));
                                                            safeSetState(() {});
                                                            safeSetState(() {
                                                              _model
                                                                  .requiredSkillInputValueController
                                                                  ?.reset();
                                                            });
                                                          } else {
                                                            return;
                                                          }
                                                        },
                                                        width: double.infinity,
                                                        height: 50.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        hintText:
                                                            'Добавьте требуемый навык',
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .inputFieldBorder,
                                                        borderWidth: 1.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        hidesUnderline: true,
                                                        isOverButton: false,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                      );
                                                    },
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      final childRequiredSkills =
                                                          _model.requiredSkills
                                                              .toList();

                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            childRequiredSkills
                                                                .length,
                                                            (childRequiredSkillsIndex) {
                                                          final childRequiredSkillsItem =
                                                              childRequiredSkills[
                                                                  childRequiredSkillsIndex];
                                                          return Visibility(
                                                            visible:
                                                                !childRequiredSkillsItem
                                                                    .isDeleted,
                                                            child:
                                                                MissionRequiredSkillItemWidget(
                                                              key: Key(
                                                                  'Keyaqa_${childRequiredSkillsIndex}_of_${childRequiredSkills.length}'),
                                                              missionRequiredSkill:
                                                                  childRequiredSkillsItem,
                                                              onChange:
                                                                  (onChangeItem) async {
                                                                _model
                                                                    .updateRequiredSkillsAtIndex(
                                                                  childRequiredSkillsIndex,
                                                                  (_) =>
                                                                      onChangeItem!,
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              onDelete:
                                                                  () async {
                                                                _model
                                                                    .updateRequiredSkillsAtIndex(
                                                                  childRequiredSkillsIndex,
                                                                  (e) => e
                                                                    ..isDeleted =
                                                                        true,
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                  Text(
                                                    'Навыки за прохождение',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                  ),
                                                  FutureBuilder<
                                                      List<SkillsRow>>(
                                                    future:
                                                        SkillsTable().queryRows(
                                                      queryFn: (q) => q,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<SkillsRow>
                                                          missionSkillInputSkillsRowList =
                                                          snapshot.data!;

                                                      return FlutterFlowDropDown<
                                                          int>(
                                                        controller: _model
                                                                .missionSkillInputValueController ??=
                                                            FormFieldController<
                                                                int>(
                                                          _model.missionSkillInputValue ??=
                                                              null,
                                                        ),
                                                        options: List<int>.from(
                                                            missionSkillInputSkillsRowList
                                                                .map(
                                                                    (e) => e.id)
                                                                .toList()),
                                                        optionLabels:
                                                            missionSkillInputSkillsRowList
                                                                .map((e) =>
                                                                    e.name)
                                                                .withoutNulls
                                                                .toList(),
                                                        onChanged: (val) async {
                                                          safeSetState(() =>
                                                              _model.missionSkillInputValue =
                                                                  val);
                                                          if (!(_model
                                                                  .missionSkills
                                                                  .where((e) =>
                                                                      e.skillId ==
                                                                      _model
                                                                          .missionSkillInputValue)
                                                                  .toList()
                                                                  .isNotEmpty) &&
                                                              (_model.missionSkillInputValue !=
                                                                  null) &&
                                                              (missionSkillInputSkillsRowList
                                                                  .where((e) =>
                                                                      e.id ==
                                                                      _model
                                                                          .missionSkillInputValue)
                                                                  .toList()
                                                                  .isNotEmpty)) {
                                                            _model.addToMissionSkills(
                                                                MissionSkillsDataStruct(
                                                              skillId: _model
                                                                  .missionSkillInputValue,
                                                              name: missionSkillInputSkillsRowList
                                                                  .where((e) =>
                                                                      e.id ==
                                                                      _model
                                                                          .missionSkillInputValue)
                                                                  .toList()
                                                                  .elementAtOrNull(
                                                                      0)
                                                                  ?.name,
                                                            ));
                                                            safeSetState(() {});
                                                            safeSetState(() {
                                                              _model
                                                                  .missionSkillInputValueController
                                                                  ?.reset();
                                                            });
                                                          } else {
                                                            return;
                                                          }
                                                        },
                                                        width: double.infinity,
                                                        height: 50.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        hintText:
                                                            'Добавьте навык за прохождение',
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .inputFieldBorder,
                                                        borderWidth: 1.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        hidesUnderline: true,
                                                        isOverButton: false,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                      );
                                                    },
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      final childRequiredSkills =
                                                          _model.missionSkills
                                                              .toList();

                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            childRequiredSkills
                                                                .length,
                                                            (childRequiredSkillsIndex) {
                                                          final childRequiredSkillsItem =
                                                              childRequiredSkills[
                                                                  childRequiredSkillsIndex];
                                                          return Visibility(
                                                            visible:
                                                                !childRequiredSkillsItem
                                                                    .isDeleted,
                                                            child:
                                                                MissionRequiredSkillItemWidget(
                                                              key: Key(
                                                                  'Keydy0_${childRequiredSkillsIndex}_of_${childRequiredSkills.length}'),
                                                              missionRequiredSkill:
                                                                  childRequiredSkillsItem,
                                                              onChange:
                                                                  (onChangeItem) async {
                                                                _model
                                                                    .updateMissionSkillsAtIndex(
                                                                  childRequiredSkillsIndex,
                                                                  (_) =>
                                                                      onChangeItem!,
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              onDelete:
                                                                  () async {
                                                                _model.removeAtIndexFromMissionSkills(
                                                                    childRequiredSkillsIndex);
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 24.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            'Добавить в архив',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                        Theme(
                                                          data: ThemeData(
                                                            checkboxTheme:
                                                                CheckboxThemeData(
                                                              visualDensity:
                                                                  VisualDensity
                                                                      .compact,
                                                              materialTapTargetSize:
                                                                  MaterialTapTargetSize
                                                                      .shrinkWrap,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                              ),
                                                            ),
                                                            unselectedWidgetColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                          ),
                                                          child: Checkbox(
                                                            value: _model
                                                                    .archiveChecboxValue ??=
                                                                false,
                                                            onChanged:
                                                                (newValue) async {
                                                              safeSetState(() =>
                                                                  _model.archiveChecboxValue =
                                                                      newValue!);
                                                            },
                                                            side: (FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate !=
                                                                    null)
                                                                ? BorderSide(
                                                                    width: 2,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  )
                                                                : null,
                                                            activeColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            checkColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (_model.typeInputValue ==
                                                      'start')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  24.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Включить автопроверку',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                          Theme(
                                                            data: ThemeData(
                                                              checkboxTheme:
                                                                  CheckboxThemeData(
                                                                visualDensity:
                                                                    VisualDensity
                                                                        .compact,
                                                                materialTapTargetSize:
                                                                    MaterialTapTargetSize
                                                                        .shrinkWrap,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.0),
                                                                ),
                                                              ),
                                                              unselectedWidgetColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                            ),
                                                            child: Checkbox(
                                                              value: _model
                                                                      .autocheckCheckboxValue ??=
                                                                  false,
                                                              onChanged:
                                                                  (newValue) async {
                                                                safeSetState(() =>
                                                                    _model.autocheckCheckboxValue =
                                                                        newValue!);
                                                              },
                                                              side: (FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate !=
                                                                      null)
                                                                  ? BorderSide(
                                                                      width: 2,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                    )
                                                                  : null,
                                                              activeColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              checkColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (_model
                                                          .autocheckCheckboxValue ??
                                                      true)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textController7,
                                                          focusNode: _model
                                                              .textFieldFocusNode,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.textController7',
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                            () => safeSetState(
                                                                () {}),
                                                          ),
                                                          autofocus: false,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .done,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelText:
                                                                'Название plpgsql функции автопроверки',
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .inputFieldBorder,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        20.0,
                                                                        16.0,
                                                                        20.0),
                                                            hoverColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .textController7Validator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                ]
                                                    .divide(
                                                        SizedBox(height: 16.0))
                                                    .addToStart(
                                                        SizedBox(height: 24.0))
                                                    .addToEnd(
                                                        SizedBox(height: 24.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) {
                                          if (widget.missionsRow != null) {
                                            return FFButtonWidget(
                                              onPressed: () async {
                                                await MissionsTable().update(
                                                  data: {
                                                    'title': _model
                                                        .nameInputTextController
                                                        .text,
                                                    'description': _model
                                                        .descriptionInputTextController
                                                        .text,
                                                    'required_rank_id': _model
                                                        .requiredRankInputValue,
                                                    'type':
                                                        _model.typeInputValue,
                                                    'xp_points': int.tryParse(_model
                                                        .xpPointsInputTextController
                                                        .text),
                                                    'coins': int.tryParse(_model
                                                        .coinsInputTextController
                                                        .text),
                                                    'role':
                                                        _model.roleInputValue,
                                                    'task': _model
                                                        .taskInputTextController
                                                        .text,
                                                    'order_index': int.tryParse(
                                                        _model
                                                            .orderIndexInputTextController
                                                            .text),
                                                    'is_archived': _model
                                                        .archiveChecboxValue,
                                                    'archived_at': supaSerialize<
                                                        DateTime>(_model
                                                            .archiveChecboxValue!
                                                        ? getCurrentTimestamp
                                                        : null),
                                                    'content': _model.content,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'id',
                                                    widget.missionsRow?.id,
                                                  ),
                                                );
                                                if (functions
                                                    .getIdsToDelete(
                                                        _model.initialBranchIds
                                                            .toList(),
                                                        _model.requiredBranchIds
                                                            .toList())
                                                    .isNotEmpty) {
                                                  for (int loop1Index = 0;
                                                      loop1Index <
                                                          functions
                                                              .getIdsToDelete(
                                                                  _model
                                                                      .initialBranchIds
                                                                      .toList(),
                                                                  _model
                                                                      .requiredBranchIds
                                                                      .toList())
                                                              .length;
                                                      loop1Index++) {
                                                    final currentLoop1Item =
                                                        functions.getIdsToDelete(
                                                            _model
                                                                .initialBranchIds
                                                                .toList(),
                                                            _model
                                                                .requiredBranchIds
                                                                .toList())[loop1Index];
                                                    await MissionRequiredBranchesTable()
                                                        .delete(
                                                      matchingRows: (rows) =>
                                                          rows
                                                              .eqOrNull(
                                                                'mission_id',
                                                                widget
                                                                    .missionsRow
                                                                    ?.id,
                                                              )
                                                              .eqOrNull(
                                                                'required_branch_id',
                                                                currentLoop1Item,
                                                              ),
                                                    );
                                                  }
                                                }
                                                _model.saveloops =
                                                    _model.saveloops + 1;
                                                safeSetState(() {});
                                                if (functions
                                                    .getIdsToAdd(
                                                        _model.initialBranchIds
                                                            .toList(),
                                                        _model.requiredBranchIds
                                                            .toList())
                                                    .isNotEmpty) {
                                                  for (int loop2Index = 0;
                                                      loop2Index <
                                                          functions
                                                              .getIdsToAdd(
                                                                  _model
                                                                      .initialBranchIds
                                                                      .toList(),
                                                                  _model
                                                                      .requiredBranchIds
                                                                      .toList())
                                                              .length;
                                                      loop2Index++) {
                                                    final currentLoop2Item =
                                                        functions.getIdsToAdd(
                                                            _model
                                                                .initialBranchIds
                                                                .toList(),
                                                            _model
                                                                .requiredBranchIds
                                                                .toList())[loop2Index];
                                                    await MissionRequiredBranchesTable()
                                                        .insert({
                                                      'required_branch_id':
                                                          currentLoop2Item,
                                                      'mission_id': widget
                                                          .missionsRow?.id,
                                                    });
                                                  }
                                                }
                                                _model.saveloops =
                                                    _model.saveloops + 1;
                                                safeSetState(() {});
                                                if (functions
                                                    .getIdsToDelete(
                                                        _model.initialRewardIds
                                                            .toList(),
                                                        _model.missionRewardIds
                                                            .toList())
                                                    .isNotEmpty) {
                                                  for (int loop3Index = 0;
                                                      loop3Index <
                                                          functions
                                                              .getIdsToDelete(
                                                                  _model
                                                                      .initialRewardIds
                                                                      .toList(),
                                                                  _model
                                                                      .missionRewardIds
                                                                      .toList())
                                                              .length;
                                                      loop3Index++) {
                                                    final currentLoop3Item =
                                                        functions.getIdsToDelete(
                                                            _model
                                                                .initialRewardIds
                                                                .toList(),
                                                            _model
                                                                .missionRewardIds
                                                                .toList())[loop3Index];
                                                    await MissionRewardsTable()
                                                        .delete(
                                                      matchingRows: (rows) =>
                                                          rows
                                                              .eqOrNull(
                                                                'mission_id',
                                                                widget
                                                                    .missionsRow
                                                                    ?.id,
                                                              )
                                                              .eqOrNull(
                                                                'reward_id',
                                                                currentLoop3Item,
                                                              ),
                                                    );
                                                  }
                                                }
                                                _model.saveloops =
                                                    _model.saveloops + 1;
                                                safeSetState(() {});
                                                if (functions
                                                    .getIdsToAdd(
                                                        _model.initialRewardIds
                                                            .toList(),
                                                        _model.missionRewardIds
                                                            .toList())
                                                    .isNotEmpty) {
                                                  for (int loop4Index = 0;
                                                      loop4Index <
                                                          functions
                                                              .getIdsToAdd(
                                                                  _model
                                                                      .initialBranchIds
                                                                      .toList(),
                                                                  _model
                                                                      .missionRewardIds
                                                                      .toList())
                                                              .length;
                                                      loop4Index++) {
                                                    final currentLoop4Item =
                                                        functions.getIdsToAdd(
                                                            _model
                                                                .initialBranchIds
                                                                .toList(),
                                                            _model
                                                                .missionRewardIds
                                                                .toList())[loop4Index];
                                                    await MissionRewardsTable()
                                                        .insert({
                                                      'mission_id': widget
                                                          .missionsRow?.id,
                                                      'reward_id':
                                                          currentLoop4Item,
                                                    });
                                                  }
                                                }
                                                _model.saveloops =
                                                    _model.saveloops + 1;
                                                safeSetState(() {});
                                                if (functions
                                                    .getIdsToDelete(
                                                        _model.initialMissionIds
                                                            .toList(),
                                                        _model
                                                            .requiredMissionIds
                                                            .toList())
                                                    .isNotEmpty) {
                                                  for (int loop5Index = 0;
                                                      loop5Index <
                                                          functions
                                                              .getIdsToDelete(
                                                                  _model
                                                                      .initialMissionIds
                                                                      .toList(),
                                                                  _model
                                                                      .requiredMissionIds
                                                                      .toList())
                                                              .length;
                                                      loop5Index++) {
                                                    final currentLoop5Item =
                                                        functions.getIdsToDelete(
                                                            _model
                                                                .initialMissionIds
                                                                .toList(),
                                                            _model
                                                                .requiredMissionIds
                                                                .toList())[loop5Index];
                                                    await MissionRequiredMissionsTable()
                                                        .delete(
                                                      matchingRows: (rows) =>
                                                          rows
                                                              .eqOrNull(
                                                                'mission_id',
                                                                widget
                                                                    .missionsRow
                                                                    ?.id,
                                                              )
                                                              .eqOrNull(
                                                                'required_mission_id',
                                                                currentLoop5Item,
                                                              ),
                                                    );
                                                  }
                                                }
                                                _model.saveloops =
                                                    _model.saveloops + 1;
                                                safeSetState(() {});
                                                if (functions
                                                    .getIdsToAdd(
                                                        _model.initialMissionIds
                                                            .toList(),
                                                        _model
                                                            .requiredMissionIds
                                                            .toList())
                                                    .isNotEmpty) {
                                                  for (int loop6Index = 0;
                                                      loop6Index <
                                                          functions
                                                              .getIdsToAdd(
                                                                  _model
                                                                      .initialMissionIds
                                                                      .toList(),
                                                                  _model
                                                                      .requiredMissionIds
                                                                      .toList())
                                                              .length;
                                                      loop6Index++) {
                                                    final currentLoop6Item =
                                                        functions.getIdsToAdd(
                                                            _model
                                                                .initialMissionIds
                                                                .toList(),
                                                            _model
                                                                .requiredMissionIds
                                                                .toList())[loop6Index];
                                                    await MissionRequiredMissionsTable()
                                                        .insert({
                                                      'mission_id': widget
                                                          .missionsRow?.id,
                                                      'required_mission_id':
                                                          currentLoop6Item,
                                                    });
                                                  }
                                                }
                                                _model.saveloops =
                                                    _model.saveloops + 1;
                                                safeSetState(() {});
                                                if (_model.requiredSkills
                                                    .where((e) =>
                                                        (e.id != null) &&
                                                        e.isDeleted)
                                                    .toList()
                                                    .isNotEmpty) {
                                                  for (int loop7Index = 0;
                                                      loop7Index <
                                                          _model.requiredSkills
                                                              .where((e) =>
                                                                  (e.id !=
                                                                      null) &&
                                                                  e.isDeleted)
                                                              .toList()
                                                              .length;
                                                      loop7Index++) {
                                                    final currentLoop7Item =
                                                        _model.requiredSkills
                                                                .where((e) =>
                                                                    (e.id !=
                                                                        null) &&
                                                                    e.isDeleted)
                                                                .toList()[
                                                            loop7Index];
                                                    await MissionRequiredSkillsTable()
                                                        .delete(
                                                      matchingRows: (rows) =>
                                                          rows
                                                              .eqOrNull(
                                                                'id',
                                                                currentLoop7Item
                                                                    .id,
                                                              )
                                                              .eqOrNull(
                                                                'mission_id',
                                                                widget
                                                                    .missionsRow
                                                                    ?.id,
                                                              ),
                                                    );
                                                  }
                                                }
                                                _model.saveloops =
                                                    _model.saveloops + 1;
                                                safeSetState(() {});
                                                if (_model.requiredSkills
                                                    .where((e) =>
                                                        (e.skillId != null) &&
                                                        (e.skillPoints !=
                                                            null) &&
                                                        !e.isDeleted &&
                                                        (e.id == null))
                                                    .toList()
                                                    .isNotEmpty) {
                                                  for (int loop8Index = 0;
                                                      loop8Index <
                                                          _model.requiredSkills
                                                              .where((e) =>
                                                                  (e.skillId !=
                                                                      null) &&
                                                                  (e.skillPoints !=
                                                                      null) &&
                                                                  !e.isDeleted &&
                                                                  (e.id == null))
                                                              .toList()
                                                              .length;
                                                      loop8Index++) {
                                                    final currentLoop8Item = _model
                                                        .requiredSkills
                                                        .where((e) =>
                                                            (e.skillId !=
                                                                null) &&
                                                            (e.skillPoints !=
                                                                null) &&
                                                            !e.isDeleted &&
                                                            (e.id == null))
                                                        .toList()[loop8Index];
                                                    await MissionRequiredSkillsTable()
                                                        .insert({
                                                      'mission_id': widget
                                                          .missionsRow?.id,
                                                      'required_skill_id':
                                                          currentLoop8Item
                                                              .skillId,
                                                      'required_skill_points':
                                                          currentLoop8Item
                                                              .skillPoints,
                                                    });
                                                  }
                                                }
                                                _model.saveloops =
                                                    _model.saveloops + 1;
                                                safeSetState(() {});
                                                if (_model.requiredSkills
                                                    .where((e) =>
                                                        (e.skillId != null) &&
                                                        (e.skillPoints !=
                                                            null) &&
                                                        !e.isDeleted &&
                                                        (e.id != null) &&
                                                        e.isUpdated)
                                                    .toList()
                                                    .isNotEmpty) {
                                                  for (int loop9Index = 0;
                                                      loop9Index <
                                                          _model.requiredSkills
                                                              .where((e) =>
                                                                  (e.skillId !=
                                                                      null) &&
                                                                  (e.skillPoints !=
                                                                      null) &&
                                                                  !e
                                                                      .isDeleted &&
                                                                  (e.id !=
                                                                      null) &&
                                                                  e.isUpdated)
                                                              .toList()
                                                              .length;
                                                      loop9Index++) {
                                                    final currentLoop9Item = _model
                                                        .requiredSkills
                                                        .where((e) =>
                                                            (e.skillId !=
                                                                null) &&
                                                            (e.skillPoints !=
                                                                null) &&
                                                            !e.isDeleted &&
                                                            (e.id != null) &&
                                                            e.isUpdated)
                                                        .toList()[loop9Index];
                                                    await MissionRequiredSkillsTable()
                                                        .update(
                                                      data: {
                                                        'required_skill_id':
                                                            currentLoop9Item
                                                                .skillId,
                                                        'required_skill_points':
                                                            currentLoop9Item
                                                                .skillPoints,
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eqOrNull(
                                                        'id',
                                                        currentLoop9Item.id,
                                                      ),
                                                    );
                                                  }
                                                }
                                                _model.saveloops =
                                                    _model.saveloops + 1;
                                                safeSetState(() {});
                                                if (_model.missionSkills
                                                    .where((e) =>
                                                        (e.id != null) &&
                                                        e.isDeleted)
                                                    .toList()
                                                    .isNotEmpty) {
                                                  for (int loop10Index = 0;
                                                      loop10Index <
                                                          _model.missionSkills
                                                              .where((e) =>
                                                                  (e.id !=
                                                                      null) &&
                                                                  e.isDeleted)
                                                              .toList()
                                                              .length;
                                                      loop10Index++) {
                                                    final currentLoop10Item =
                                                        _model.missionSkills
                                                                .where((e) =>
                                                                    (e.id !=
                                                                        null) &&
                                                                    e.isDeleted)
                                                                .toList()[
                                                            loop10Index];
                                                    await MissionSkillsTable()
                                                        .delete(
                                                      matchingRows: (rows) =>
                                                          rows.eqOrNull(
                                                        'id',
                                                        currentLoop10Item.id,
                                                      ),
                                                    );
                                                  }
                                                }
                                                _model.saveloops =
                                                    _model.saveloops + 1;
                                                safeSetState(() {});
                                                if (_model.missionSkills
                                                    .where((e) =>
                                                        (e.id == null) &&
                                                        (e.skillId != null) &&
                                                        (e.skillPoints !=
                                                            null) &&
                                                        !e.isDeleted)
                                                    .toList()
                                                    .isNotEmpty) {
                                                  for (int loop11Index = 0;
                                                      loop11Index <
                                                          _model.missionSkills
                                                              .where((e) =>
                                                                  (e.id ==
                                                                      null) &&
                                                                  (e.skillId !=
                                                                      null) &&
                                                                  (e.skillPoints !=
                                                                      null) &&
                                                                  !e.isDeleted)
                                                              .toList()
                                                              .length;
                                                      loop11Index++) {
                                                    final currentLoop11Item = _model
                                                        .missionSkills
                                                        .where((e) =>
                                                            (e.id == null) &&
                                                            (e.skillId !=
                                                                null) &&
                                                            (e.skillPoints !=
                                                                null) &&
                                                            !e.isDeleted)
                                                        .toList()[loop11Index];
                                                    await MissionSkillsTable()
                                                        .insert({
                                                      'mission_id': widget
                                                          .missionsRow?.id,
                                                      'skill_id':
                                                          currentLoop11Item
                                                              .skillId,
                                                      'skill_up_points':
                                                          currentLoop11Item
                                                              .skillPoints,
                                                    });
                                                  }
                                                }
                                                _model.saveloops =
                                                    _model.saveloops + 1;
                                                safeSetState(() {});
                                                if (_model.missionSkills
                                                    .where((e) =>
                                                        (e.id != null) &&
                                                        !e.isDeleted &&
                                                        e.isUpdated &&
                                                        (e.skillId != null) &&
                                                        (e.skillPoints != null))
                                                    .toList()
                                                    .isNotEmpty) {
                                                  for (int loop12Index = 0;
                                                      loop12Index <
                                                          _model.missionSkills
                                                              .where((e) =>
                                                                  (e.id !=
                                                                      null) &&
                                                                  !e
                                                                      .isDeleted &&
                                                                  e.isUpdated &&
                                                                  (e.skillId !=
                                                                      null) &&
                                                                  (e.skillPoints !=
                                                                      null))
                                                              .toList()
                                                              .length;
                                                      loop12Index++) {
                                                    final currentLoop12Item = _model
                                                        .missionSkills
                                                        .where((e) =>
                                                            (e.id != null) &&
                                                            !e.isDeleted &&
                                                            e.isUpdated &&
                                                            (e.skillId !=
                                                                null) &&
                                                            (e.skillPoints !=
                                                                null))
                                                        .toList()[loop12Index];
                                                    await MissionSkillsTable()
                                                        .update(
                                                      data: {
                                                        'skill_id':
                                                            currentLoop12Item
                                                                .skillId,
                                                        'skill_up_points':
                                                            currentLoop12Item
                                                                .skillPoints,
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eqOrNull(
                                                        'id',
                                                        currentLoop12Item.id,
                                                      ),
                                                    );
                                                  }
                                                }
                                                _model.saveloops =
                                                    _model.saveloops + 1;
                                                safeSetState(() {});
                                                context.safePop();
                                              },
                                              text: 'Обновить',
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 52.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            );
                                          } else {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  if (_model.formKey
                                                              .currentState ==
                                                          null ||
                                                      !_model
                                                          .formKey.currentState!
                                                          .validate()) {
                                                    return;
                                                  }
                                                  if (_model.roleInputValue ==
                                                      null) {
                                                    return;
                                                  }
                                                  if (_model.typeInputValue ==
                                                      null) {
                                                    return;
                                                  }
                                                  _model.insertRow =
                                                      await MissionsTable()
                                                          .insert({
                                                    'title': _model
                                                        .nameInputTextController
                                                        .text,
                                                    'description': _model
                                                        .descriptionInputTextController
                                                        .text,
                                                    'required_rank_id': _model
                                                        .requiredRankInputValue,
                                                    'type':
                                                        _model.typeInputValue,
                                                    'xp_points': int.tryParse(_model
                                                        .xpPointsInputTextController
                                                        .text),
                                                    'coins': int.tryParse(_model
                                                        .coinsInputTextController
                                                        .text),
                                                    'task': _model
                                                        .taskInputTextController
                                                        .text,
                                                    'order_index': int.tryParse(
                                                        _model
                                                            .orderIndexInputTextController
                                                            .text),
                                                    'is_archived': _model
                                                        .archiveChecboxValue,
                                                    'archived_at': supaSerialize<
                                                        DateTime>(_model
                                                            .archiveChecboxValue!
                                                        ? getCurrentTimestamp
                                                        : null),
                                                    'content': _model.content,
                                                  });
                                                  if (functions
                                                      .getIdsToAdd(
                                                          _model
                                                              .initialBranchIds
                                                              .toList(),
                                                          _model
                                                              .requiredBranchIds
                                                              .toList())
                                                      .isNotEmpty) {
                                                    for (int loop1Index = 0;
                                                        loop1Index <
                                                            functions
                                                                .getIdsToAdd(
                                                                    _model
                                                                        .initialBranchIds
                                                                        .toList(),
                                                                    _model
                                                                        .requiredBranchIds
                                                                        .toList())
                                                                .length;
                                                        loop1Index++) {
                                                      final currentLoop1Item =
                                                          functions.getIdsToAdd(
                                                              _model
                                                                  .initialBranchIds
                                                                  .toList(),
                                                              _model
                                                                  .requiredBranchIds
                                                                  .toList())[loop1Index];
                                                      await MissionRequiredBranchesTable()
                                                          .insert({
                                                        'required_branch_id':
                                                            currentLoop1Item,
                                                        'mission_id': _model
                                                            .insertRow?.id,
                                                      });
                                                    }
                                                  }
                                                  _model.saveloops =
                                                      _model.saveloops + 1;
                                                  safeSetState(() {});
                                                  if (functions
                                                      .getIdsToAdd(
                                                          _model
                                                              .initialRewardIds
                                                              .toList(),
                                                          _model
                                                              .missionRewardIds
                                                              .toList())
                                                      .isNotEmpty) {
                                                    for (int loop2Index = 0;
                                                        loop2Index <
                                                            functions
                                                                .getIdsToAdd(
                                                                    _model
                                                                        .initialBranchIds
                                                                        .toList(),
                                                                    _model
                                                                        .missionRewardIds
                                                                        .toList())
                                                                .length;
                                                        loop2Index++) {
                                                      final currentLoop2Item =
                                                          functions.getIdsToAdd(
                                                              _model
                                                                  .initialBranchIds
                                                                  .toList(),
                                                              _model
                                                                  .missionRewardIds
                                                                  .toList())[loop2Index];
                                                      await MissionRewardsTable()
                                                          .insert({
                                                        'mission_id': _model
                                                            .insertRow?.id,
                                                        'reward_id':
                                                            currentLoop2Item,
                                                      });
                                                    }
                                                  }
                                                  _model.saveloops =
                                                      _model.saveloops + 1;
                                                  safeSetState(() {});
                                                  if (functions
                                                      .getIdsToAdd(
                                                          _model
                                                              .initialMissionIds
                                                              .toList(),
                                                          _model
                                                              .requiredMissionIds
                                                              .toList())
                                                      .isNotEmpty) {
                                                    for (int loop3Index = 0;
                                                        loop3Index <
                                                            functions
                                                                .getIdsToAdd(
                                                                    _model
                                                                        .initialMissionIds
                                                                        .toList(),
                                                                    _model
                                                                        .requiredMissionIds
                                                                        .toList())
                                                                .length;
                                                        loop3Index++) {
                                                      final currentLoop3Item =
                                                          functions.getIdsToAdd(
                                                              _model
                                                                  .initialMissionIds
                                                                  .toList(),
                                                              _model
                                                                  .requiredMissionIds
                                                                  .toList())[loop3Index];
                                                      await MissionRequiredMissionsTable()
                                                          .insert({
                                                        'mission_id': _model
                                                            .insertRow?.id,
                                                        'required_mission_id':
                                                            currentLoop3Item,
                                                      });
                                                    }
                                                  }
                                                  _model.saveloops =
                                                      _model.saveloops + 1;
                                                  safeSetState(() {});
                                                  if (_model.requiredSkills
                                                      .where((e) =>
                                                          (e.skillId != null) &&
                                                          (e.skillPoints !=
                                                              null) &&
                                                          !e.isDeleted)
                                                      .toList()
                                                      .isNotEmpty) {
                                                    for (int loop4Index = 0;
                                                        loop4Index <
                                                            _model
                                                                .requiredSkills
                                                                .where((e) =>
                                                                    (e.skillId != null) &&
                                                                    (e.skillPoints !=
                                                                        null) &&
                                                                    !e.isDeleted)
                                                                .toList()
                                                                .length;
                                                        loop4Index++) {
                                                      final currentLoop4Item = _model
                                                          .requiredSkills
                                                          .where((e) =>
                                                              (e.skillId !=
                                                                  null) &&
                                                              (e.skillPoints !=
                                                                  null) &&
                                                              !e.isDeleted)
                                                          .toList()[loop4Index];
                                                      await MissionRequiredSkillsTable()
                                                          .insert({
                                                        'mission_id': _model
                                                            .insertRow?.id,
                                                        'required_skill_id':
                                                            currentLoop4Item
                                                                .skillId,
                                                        'required_skill_points':
                                                            currentLoop4Item
                                                                .skillPoints,
                                                      });
                                                    }
                                                  }
                                                  if (_model.missionSkills
                                                      .where((e) =>
                                                          (e.skillId != null) &&
                                                          (e.skillPoints !=
                                                              null) &&
                                                          !e.isDeleted)
                                                      .toList()
                                                      .isNotEmpty) {
                                                    for (int loop5Index = 0;
                                                        loop5Index <
                                                            _model.missionSkills
                                                                .where((e) =>
                                                                    (e.skillId != null) &&
                                                                    (e.skillPoints !=
                                                                        null) &&
                                                                    !e.isDeleted)
                                                                .toList()
                                                                .length;
                                                        loop5Index++) {
                                                      final currentLoop5Item = _model
                                                          .missionSkills
                                                          .where((e) =>
                                                              (e.skillId !=
                                                                  null) &&
                                                              (e.skillPoints !=
                                                                  null) &&
                                                              !e.isDeleted)
                                                          .toList()[loop5Index];
                                                      await MissionSkillsTable()
                                                          .insert({
                                                        'mission_id': _model
                                                            .insertRow?.id,
                                                        'skill_id':
                                                            currentLoop5Item
                                                                .skillId,
                                                        'skill_up_points':
                                                            currentLoop5Item
                                                                .skillPoints,
                                                      });
                                                    }
                                                  }
                                                  _model.saveloops =
                                                      _model.saveloops + 1;
                                                  safeSetState(() {});
                                                  context.safePop();

                                                  safeSetState(() {});
                                                },
                                                text: 'Сохранить',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 52.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (responsiveVisibility(
                    context: context,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    wrapWithModel(
                      model: _model.navbarMobileModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavbarMobileWidget(
                        index: 0,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
