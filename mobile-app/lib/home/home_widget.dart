import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/bottom_logout_widget.dart';
import '/components/button_animated_widget.dart';
import '/components/coins_item_widget.dart';
import '/components/home_branch_item_widget.dart';
import '/components/home_rank_item_widget.dart';
import '/components/home_reward_row_item_widget.dart';
import '/components/home_skills_item_widget.dart';
import '/components/level_progress_widget.dart';
import '/components/message_widget.dart';
import '/components/missions_list_item_widget.dart';
import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'Home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.dark);
      await actions.logbookNotifications(
        context,
      );
    });

    animationsMap.addAll({
      'rowOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 32.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'levelProgressOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 250.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 250.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 32.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 500.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 500.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 32.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 750.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 750.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 32.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 750.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 750.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 32.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {
      await actions.logbookNotificationsUnsubscribe();
    }();

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
        body: Stack(
          children: [
            Opacity(
              opacity: 0.8,
              child: Lottie.asset(
                'assets/jsons/stars_lottie.json',
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 180.0,
                fit: BoxFit.contain,
                animate: true,
              ),
            ),
            FutureBuilder<List<ViewUsersRow>>(
              future: ViewUsersTable().querySingleRow(
                queryFn: (q) => q.eqOrNull(
                  'id',
                  currentUserUid,
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
                List<ViewUsersRow> viewUsersViewUsersRowList = snapshot.data!;

                final viewUsersViewUsersRow =
                    viewUsersViewUsersRowList.isNotEmpty
                        ? viewUsersViewUsersRowList.first
                        : null;

                return Container(
                  decoration: BoxDecoration(),
                  child: Builder(
                    builder: (context) {
                      if ((viewUsersViewUsersRow != null) &&
                          ((viewUsersViewUsersRow?.role != null &&
                                  viewUsersViewUsersRow?.role != '') &&
                              (viewUsersViewUsersRow?.firstName != null &&
                                  viewUsersViewUsersRow?.firstName != '') &&
                              (viewUsersViewUsersRow?.lastName != null &&
                                  viewUsersViewUsersRow?.lastName != '') &&
                              (viewUsersViewUsersRow?.birthDate != null) &&
                              (viewUsersViewUsersRow?.rankId != null))) {
                        return Stack(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      OnboardingWidget
                                                          .routeName);
                                                },
                                                child: wrapWithModel(
                                                  model: _model.coinsItemModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  updateOnChange: true,
                                                  child: CoinsItemWidget(
                                                    coins: valueOrDefault<int>(
                                                      viewUsersViewUsersRow
                                                          ?.coins,
                                                      0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      LogbookWidget.routeName);
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'БОРТОВОЙ\nЖУРНАЛ',
                                                      textAlign: TextAlign.end,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                                lineHeight: 1.4,
                                                              ),
                                                    ),
                                                    Container(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Icon(
                                                              FFIcons
                                                                  .kbookOpenText,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 28.0,
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 8.0,
                                                                height: 8.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFEEBC60),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ).animateOnPageLoad(animationsMap[
                                            'rowOnPageLoadAnimation1']!),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 24.0, 0.0, 0.0),
                                          child: wrapWithModel(
                                            model: _model.levelProgressModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            updateOnChange: true,
                                            child: LevelProgressWidget(
                                              viewUsers: viewUsersViewUsersRow!,
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'levelProgressOnPageLoadAnimation']!),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 42.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: wrapWithModel(
                                                  model:
                                                      _model.homeRankItemModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: HomeRankItemWidget(
                                                    viewUsersRow:
                                                        viewUsersViewUsersRow!,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    wrapWithModel(
                                                      model: _model
                                                          .homeBranchItemModel,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          HomeBranchItemWidget(
                                                        viewUsersRow:
                                                            viewUsersViewUsersRow,
                                                      ),
                                                    ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .homeSkillsItemModel,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          HomeSkillsItemWidget(),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 16.0)),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 16.0)),
                                          ).animateOnPageLoad(animationsMap[
                                              'rowOnPageLoadAnimation2']!),
                                        ),
                                      ],
                                    ),
                                  ),
                                  FutureBuilder<List<UserRewardsRow>>(
                                    future: UserRewardsTable().queryRows(
                                      queryFn: (q) => q.eqOrNull(
                                        'user_id',
                                        currentUserUid,
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
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 28.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<UserRewardsRow>
                                          userRewardsUserRewardsRowList =
                                          snapshot.data!;

                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 42.0, 16.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                            RewardsWidget
                                                                .routeName);
                                                      },
                                                      child: Text(
                                                        'Артефакты',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                            RewardsWidget
                                                                .routeName);
                                                      },
                                                      child: Text(
                                                        'Все',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  if (userRewardsUserRewardsRowList
                                                      .isNotEmpty) {
                                                    return Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: FutureBuilder<
                                                          List<ViewRewardsRow>>(
                                                        future:
                                                            ViewRewardsTable()
                                                                .queryRows(
                                                          queryFn: (q) =>
                                                              q.inFilterOrNull(
                                                            'id',
                                                            userRewardsUserRewardsRowList
                                                                .map((e) =>
                                                                    e.rewardId)
                                                                .withoutNulls
                                                                .toList(),
                                                          ),
                                                          limit: 5,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 28.0,
                                                                height: 28.0,
                                                                child:
                                                                    SpinKitPulse(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 28.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<ViewRewardsRow>
                                                              rowViewRewardsRowList =
                                                              snapshot.data!;

                                                          return SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: List.generate(
                                                                      rowViewRewardsRowList
                                                                          .length,
                                                                      (rowIndex) {
                                                                final rowViewRewardsRow =
                                                                    rowViewRewardsRowList[
                                                                        rowIndex];
                                                                return HomeRewardRowItemWidget(
                                                                  key: Key(
                                                                      'Key31j_${rowIndex}_of_${rowViewRewardsRowList.length}'),
                                                                  isUnlocked:
                                                                      rowViewRewardsRow
                                                                          .isEarned,
                                                                  viewRewards:
                                                                      rowViewRewardsRow,
                                                                  index:
                                                                      rowIndex,
                                                                );
                                                              })
                                                                  .divide(SizedBox(
                                                                      width:
                                                                          16.0))
                                                                  .addToStart(
                                                                      SizedBox(
                                                                          width:
                                                                              16.0))
                                                                  .addToEnd(
                                                                      SizedBox(
                                                                          width:
                                                                              16.0)),
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'rowOnPageLoadAnimation3']!);
                                                        },
                                                      ),
                                                    );
                                                  } else {
                                                    return Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: FutureBuilder<
                                                          List<ViewRewardsRow>>(
                                                        future:
                                                            ViewRewardsTable()
                                                                .queryRows(
                                                          queryFn: (q) => q,
                                                          limit: 5,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 28.0,
                                                                height: 28.0,
                                                                child:
                                                                    SpinKitPulse(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 28.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<ViewRewardsRow>
                                                              rowViewRewardsRowList =
                                                              snapshot.data!;

                                                          return SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: List.generate(
                                                                      rowViewRewardsRowList
                                                                          .length,
                                                                      (rowIndex) {
                                                                final rowViewRewardsRow =
                                                                    rowViewRewardsRowList[
                                                                        rowIndex];
                                                                return HomeRewardRowItemWidget(
                                                                  key: Key(
                                                                      'Key5i1_${rowIndex}_of_${rowViewRewardsRowList.length}'),
                                                                  isUnlocked:
                                                                      rowViewRewardsRow
                                                                          .isEarned,
                                                                  viewRewards:
                                                                      rowViewRewardsRow,
                                                                  index:
                                                                      rowIndex,
                                                                );
                                                              })
                                                                  .divide(SizedBox(
                                                                      width:
                                                                          16.0))
                                                                  .addToStart(
                                                                      SizedBox(
                                                                          width:
                                                                              16.0))
                                                                  .addToEnd(
                                                                      SizedBox(
                                                                          width:
                                                                              16.0)),
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'rowOnPageLoadAnimation4']!);
                                                        },
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  FutureBuilder<List<ViewMissionsRow>>(
                                    future: ViewMissionsTable().queryRows(
                                      queryFn: (q) => q.eqOrNull(
                                        'is_archived',
                                        false,
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
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 28.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<ViewMissionsRow>
                                          viewMissionsViewMissionsRowList =
                                          snapshot.data!;

                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 42.0, 16.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                            RewardsWidget
                                                                .routeName);
                                                      },
                                                      child: Text(
                                                        'Мои миссии',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                            MissionArchiveWidget
                                                                .routeName);
                                                      },
                                                      child: Text(
                                                        'Архив',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final childViewMissions = viewMissionsViewMissionsRowList
                                                            .where((e) =>
                                                                (e.requiredBranchIds.contains(
                                                                        viewUsersViewUsersRow
                                                                            ?.branchId) ||
                                                                    !(e.requiredBranchIds
                                                                        .isNotEmpty)) &&
                                                                ((e.role ==
                                                                        viewUsersViewUsersRow
                                                                            ?.role) ||
                                                                    (e.role ==
                                                                        UserRole
                                                                            .all
                                                                            .name)) &&
                                                                ((e.userMissionsStatus !=
                                                                        UserMissionStatus
                                                                            .completed
                                                                            .name) &&
                                                                    (e.userMissionsStatus !=
                                                                        UserMissionStatus
                                                                            .failed
                                                                            .name)))
                                                            .toList();
                                                        if (childViewMissions
                                                            .isEmpty) {
                                                          return MessageWidget(
                                                            title:
                                                                'Список миссий пуст, как тёмная сторона луны!',
                                                            text:
                                                                'Смени ветку в своём космическом навигаторе, и откроются новые галактические задания, ждущие твоего героизма!',
                                                            rightSide: false,
                                                          );
                                                        }

                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: List.generate(
                                                              childViewMissions
                                                                  .length,
                                                              (childViewMissionsIndex) {
                                                            final childViewMissionsItem =
                                                                childViewMissions[
                                                                    childViewMissionsIndex];
                                                            return Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child:
                                                                  MissionsListItemWidget(
                                                                key: Key(
                                                                    'Keyo5m_${childViewMissionsIndex}_of_${childViewMissions.length}'),
                                                                index:
                                                                    childViewMissionsIndex,
                                                                isUnlocked:
                                                                    childViewMissionsItem
                                                                        .isUnlocked,
                                                                viewMissionsRow:
                                                                    childViewMissionsItem,
                                                              ),
                                                            );
                                                          }).divide(SizedBox(
                                                              height: 16.0)),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ]
                                    .addToStart(SizedBox(height: 60.0))
                                    .addToEnd(SizedBox(height: 130.0)),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                wrapWithModel(
                                  model: _model.messageModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: MessageWidget(
                                    title:
                                        'Упс, кажется вы не до конца заполнили  профиль',
                                    text:
                                        'Просим вас пройти и заполнить повторно форму регистрации',
                                    rightSide: false,
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context
                                        .goNamed(Registration2Widget.routeName);
                                  },
                                  child: wrapWithModel(
                                    model: _model.buttonAnimatedModel,
                                    updateCallback: () => safeSetState(() {}),
                                    updateOnChange: true,
                                    child: ButtonAnimatedWidget(
                                      text: 'Заполнить профиль',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      var _shouldSetState = false;
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: BottomLogoutWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(
                                          () => _model.logout = value));

                                      _shouldSetState = true;
                                      if (_model.logout!) {
                                        GoRouter.of(context).prepareAuthEvent();
                                        await authManager.signOut();
                                        GoRouter.of(context)
                                            .clearRedirectLocation();
                                      } else {
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }

                                      context.goNamedAuth(
                                          OnboardingWidget.routeName,
                                          context.mounted);

                                      if (_shouldSetState) safeSetState(() {});
                                    },
                                    text: 'Выйти из аккаунта',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 56.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).button10,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                  ),
                                ),
                              ]
                                  .addToStart(SizedBox(height: 180.0))
                                  .addToEnd(SizedBox(height: 130.0)),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                );
              },
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 52.0),
                child: wrapWithModel(
                  model: _model.navbarModel,
                  updateCallback: () => safeSetState(() {}),
                  updateOnChange: true,
                  child: NavbarWidget(
                    index: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
