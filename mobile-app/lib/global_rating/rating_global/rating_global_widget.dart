import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/choose3_widget.dart';
import '/components/message_widget.dart';
import '/components/user_rating_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rating_global_model.dart';
export 'rating_global_model.dart';

class RatingGlobalWidget extends StatefulWidget {
  const RatingGlobalWidget({super.key});

  static String routeName = 'RatingGlobal';
  static String routePath = '/ratingGlobal';

  @override
  State<RatingGlobalWidget> createState() => _RatingGlobalWidgetState();
}

class _RatingGlobalWidgetState extends State<RatingGlobalWidget>
    with TickerProviderStateMixin {
  late RatingGlobalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingGlobalModel());

    animationsMap.addAll({
      'userRatingItemOnPageLoadAnimation1': AnimationInfo(
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
      'userRatingItemOnPageLoadAnimation2': AnimationInfo(
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
      'userRatingItemOnPageLoadAnimation3': AnimationInfo(
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
      'choose3OnPageLoadAnimation': AnimationInfo(
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
      'columnOnPageLoadAnimation1': AnimationInfo(
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
      'columnOnPageLoadAnimation2': AnimationInfo(
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
      'columnOnPageLoadAnimation3': AnimationInfo(
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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    'Глобальный рейтиг',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
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
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 98.0,
                      decoration: BoxDecoration(),
                      child: Builder(
                        builder: (context) {
                          if (_model.filter == 'Неделя') {
                            return FutureBuilder<List<ViewTopUsersWeekRow>>(
                              future: ViewTopUsersWeekTable().querySingleRow(
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 28.0,
                                      ),
                                    ),
                                  );
                                }
                                List<ViewTopUsersWeekRow>
                                    personalWeekViewTopUsersWeekRowList =
                                    snapshot.data!;

                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final personalWeekViewTopUsersWeekRow =
                                    personalWeekViewTopUsersWeekRowList
                                            .isNotEmpty
                                        ? personalWeekViewTopUsersWeekRowList
                                            .first
                                        : null;

                                return wrapWithModel(
                                  model: _model.personalWeekModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: UserRatingItemWidget(
                                    rankPosition:
                                        personalWeekViewTopUsersWeekRow
                                            ?.rankPositionByXp,
                                    imagePath: personalWeekViewTopUsersWeekRow
                                        ?.photoUrl,
                                    firstName: personalWeekViewTopUsersWeekRow
                                        ?.firstName,
                                    lastName: personalWeekViewTopUsersWeekRow
                                        ?.lastName,
                                    points: personalWeekViewTopUsersWeekRow
                                        ?.totalXpChange,
                                    userId: personalWeekViewTopUsersWeekRow!
                                        .userId!,
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'userRatingItemOnPageLoadAnimation1']!);
                              },
                            );
                          } else if (_model.filter == 'Месяц') {
                            return FutureBuilder<List<ViewTopUsersMonthRow>>(
                              future: ViewTopUsersMonthTable().querySingleRow(
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 28.0,
                                      ),
                                    ),
                                  );
                                }
                                List<ViewTopUsersMonthRow>
                                    personalMonthViewTopUsersMonthRowList =
                                    snapshot.data!;

                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final personalMonthViewTopUsersMonthRow =
                                    personalMonthViewTopUsersMonthRowList
                                            .isNotEmpty
                                        ? personalMonthViewTopUsersMonthRowList
                                            .first
                                        : null;

                                return wrapWithModel(
                                  model: _model.personalMonthModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: UserRatingItemWidget(
                                    rankPosition:
                                        personalMonthViewTopUsersMonthRow
                                            ?.rankPositionByXp,
                                    imagePath: personalMonthViewTopUsersMonthRow
                                        ?.photoUrl,
                                    firstName: personalMonthViewTopUsersMonthRow
                                        ?.firstName,
                                    lastName: personalMonthViewTopUsersMonthRow
                                        ?.lastName,
                                    points: personalMonthViewTopUsersMonthRow
                                        ?.totalXpChange,
                                    userId: personalMonthViewTopUsersMonthRow!
                                        .userId!,
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'userRatingItemOnPageLoadAnimation2']!);
                              },
                            );
                          } else if (_model.filter == 'Год') {
                            return FutureBuilder<List<ViewTopUsersYearRow>>(
                              future: ViewTopUsersYearTable().querySingleRow(
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 28.0,
                                      ),
                                    ),
                                  );
                                }
                                List<ViewTopUsersYearRow>
                                    personalYearViewTopUsersYearRowList =
                                    snapshot.data!;

                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final personalYearViewTopUsersYearRow =
                                    personalYearViewTopUsersYearRowList
                                            .isNotEmpty
                                        ? personalYearViewTopUsersYearRowList
                                            .first
                                        : null;

                                return wrapWithModel(
                                  model: _model.personalYearModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: UserRatingItemWidget(
                                    rankPosition:
                                        personalYearViewTopUsersYearRow
                                            ?.rankPositionByXp,
                                    imagePath: personalYearViewTopUsersYearRow
                                        ?.photoUrl,
                                    firstName: personalYearViewTopUsersYearRow
                                        ?.firstName,
                                    lastName: personalYearViewTopUsersYearRow
                                        ?.lastName,
                                    points: personalYearViewTopUsersYearRow
                                        ?.totalXpChange,
                                    userId: personalYearViewTopUsersYearRow!
                                        .userId!,
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'userRatingItemOnPageLoadAnimation3']!);
                              },
                            );
                          } else {
                            return wrapWithModel(
                              model: _model.messageModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: MessageWidget(
                                title: 'Кажется здесь не хватает данных ;(',
                                text: 'Ничего страшного, скоро поправим.',
                                rightSide: false,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.choose3Model,
                        updateCallback: () => safeSetState(() {}),
                        child: Choose3Widget(
                          option1: 'Неделя',
                          option2: 'Месяц',
                          option3: 'Год',
                          valuePicked: _model.filter,
                          onTap: (value) async {
                            _model.filter = value!;
                            safeSetState(() {});
                          },
                        ),
                      ).animateOnPageLoad(
                          animationsMap['choose3OnPageLoadAnimation']!),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (_model.filter == 'Неделя') {
                                    return FutureBuilder<
                                        List<ViewTopUsersWeekRow>>(
                                      future: ViewTopUsersWeekTable().queryRows(
                                        queryFn: (q) => q.order(
                                            'rank_position_by_xp',
                                            ascending: true),
                                        limit: 100,
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
                                        List<ViewTopUsersWeekRow>
                                            weekViewTopUsersWeekRowList =
                                            snapshot.data!;

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              weekViewTopUsersWeekRowList
                                                  .length, (weekIndex) {
                                            final weekViewTopUsersWeekRow =
                                                weekViewTopUsersWeekRowList[
                                                    weekIndex];
                                            return UserRatingItemWidget(
                                              key: Key(
                                                  'Keydzh_${weekIndex}_of_${weekViewTopUsersWeekRowList.length}'),
                                              rankPosition:
                                                  weekViewTopUsersWeekRow
                                                      .rankPositionByXp,
                                              imagePath: weekViewTopUsersWeekRow
                                                  .photoUrl,
                                              firstName: weekViewTopUsersWeekRow
                                                  .firstName,
                                              lastName: weekViewTopUsersWeekRow
                                                  .lastName,
                                              points: weekViewTopUsersWeekRow
                                                  .totalXpChange,
                                              userId: weekViewTopUsersWeekRow
                                                  .userId!,
                                            );
                                          }).divide(SizedBox(height: 16.0)),
                                        ).animateOnPageLoad(animationsMap[
                                            'columnOnPageLoadAnimation1']!);
                                      },
                                    );
                                  } else if (_model.filter == 'Месяц') {
                                    return FutureBuilder<
                                        List<ViewTopUsersMonthRow>>(
                                      future:
                                          ViewTopUsersMonthTable().queryRows(
                                        queryFn: (q) => q.order(
                                            'rank_position_by_xp',
                                            ascending: true),
                                        limit: 100,
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
                                        List<ViewTopUsersMonthRow>
                                            monthViewTopUsersMonthRowList =
                                            snapshot.data!;

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              monthViewTopUsersMonthRowList
                                                  .length, (monthIndex) {
                                            final monthViewTopUsersMonthRow =
                                                monthViewTopUsersMonthRowList[
                                                    monthIndex];
                                            return UserRatingItemWidget(
                                              key: Key(
                                                  'Keyoha_${monthIndex}_of_${monthViewTopUsersMonthRowList.length}'),
                                              rankPosition:
                                                  monthViewTopUsersMonthRow
                                                      .rankPositionByXp,
                                              imagePath:
                                                  monthViewTopUsersMonthRow
                                                      .photoUrl,
                                              firstName:
                                                  monthViewTopUsersMonthRow
                                                      .firstName,
                                              lastName:
                                                  monthViewTopUsersMonthRow
                                                      .lastName,
                                              points: monthViewTopUsersMonthRow
                                                  .totalXpChange,
                                              userId: monthViewTopUsersMonthRow
                                                  .userId!,
                                            );
                                          }).divide(SizedBox(height: 16.0)),
                                        ).animateOnPageLoad(animationsMap[
                                            'columnOnPageLoadAnimation2']!);
                                      },
                                    );
                                  } else if (_model.filter == 'Год') {
                                    return FutureBuilder<
                                        List<ViewTopUsersYearRow>>(
                                      future: ViewTopUsersYearTable().queryRows(
                                        queryFn: (q) => q.order(
                                            'rank_position_by_xp',
                                            ascending: true),
                                        limit: 100,
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
                                        List<ViewTopUsersYearRow>
                                            yearViewTopUsersYearRowList =
                                            snapshot.data!;

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              yearViewTopUsersYearRowList
                                                  .length, (yearIndex) {
                                            final yearViewTopUsersYearRow =
                                                yearViewTopUsersYearRowList[
                                                    yearIndex];
                                            return UserRatingItemWidget(
                                              key: Key(
                                                  'Keyvw7_${yearIndex}_of_${yearViewTopUsersYearRowList.length}'),
                                              rankPosition:
                                                  yearViewTopUsersYearRow
                                                      .rankPositionByXp,
                                              imagePath: yearViewTopUsersYearRow
                                                  .photoUrl,
                                              firstName: yearViewTopUsersYearRow
                                                  .firstName,
                                              lastName: yearViewTopUsersYearRow
                                                  .lastName,
                                              points: yearViewTopUsersYearRow
                                                  .totalXpChange,
                                              userId: yearViewTopUsersYearRow
                                                  .userId!,
                                            );
                                          }).divide(SizedBox(height: 16.0)),
                                        ).animateOnPageLoad(animationsMap[
                                            'columnOnPageLoadAnimation3']!);
                                      },
                                    );
                                  } else {
                                    return wrapWithModel(
                                      model: _model.messageModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: MessageWidget(
                                        title: 'Список топа пуст',
                                        text:
                                            'Ничего страшного, скоро поправим.',
                                        rightSide: true,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ].addToStart(SizedBox(height: 24.0)),
                ),
              ),
            ),
          ].addToStart(SizedBox(height: 60.0)),
        ),
      ),
    );
  }
}
