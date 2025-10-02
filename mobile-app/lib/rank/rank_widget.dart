import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/home_reward_row_item_widget.dart';
import '/components/missions_list_item_widget.dart';
import '/components/progress_bar_widget.dart';
import '/components/skill_compare_item_widget.dart';
import '/components/user_rank_video_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rank_model.dart';
export 'rank_model.dart';

class RankWidget extends StatefulWidget {
  const RankWidget({
    super.key,
    required this.viewUsers,
  });

  final ViewUsersRow? viewUsers;

  static String routeName = 'Rank';
  static String routePath = '/rank';

  @override
  State<RankWidget> createState() => _RankWidgetState();
}

class _RankWidgetState extends State<RankWidget> {
  late RankModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RankModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((widget!.viewUsers != null) &&
          (widget!.viewUsers?.rankOrderIndex != null)) {
        _model.index = widget!.viewUsers!.rankOrderIndex!;
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
                    'Ранг',
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
              child: FutureBuilder<List<RanksRow>>(
                future: RanksTable().queryRows(
                  queryFn: (q) => q.order('order_index', ascending: true),
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
                  List<RanksRow> ranksRanksRowList = snapshot.data!;

                  return Container(
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final childRanks = ranksRanksRowList.toList();

                                return Container(
                                  width: double.infinity,
                                  height: 380.0,
                                  child: CarouselSlider.builder(
                                    itemCount: childRanks.length,
                                    itemBuilder: (context, childRanksIndex, _) {
                                      final childRanksItem =
                                          childRanks[childRanksIndex];
                                      return UserRankVideoWidget(
                                        key: Key(
                                            'Keyyht_${childRanksIndex}_of_${childRanks.length}'),
                                        videoPath: () {
                                          if (widget!.viewUsers?.gender ==
                                              Gender.male.name) {
                                            return childRanksItem
                                                .characterVideoMaleUrl;
                                          } else if (widget!
                                                  .viewUsers?.gender ==
                                              Gender.female.name) {
                                            return childRanksItem
                                                .characterVideoFemaleUrl;
                                          } else {
                                            return childRanksItem
                                                .characterVideoMaleUrl;
                                          }
                                        }(),
                                        rankBadgeUrl: valueOrDefault<String>(
                                          childRanksItem.badgeImageUrl,
                                          'null',
                                        ),
                                        rankTitle: valueOrDefault<String>(
                                          childRanksItem.title,
                                          'null',
                                        ),
                                        isPlaying:
                                            childRanksIndex == _model.index,
                                      );
                                    },
                                    carouselController:
                                        _model.carouselController ??=
                                            CarouselSliderController(),
                                    options: CarouselOptions(
                                      initialPage: max(
                                          0,
                                          min(
                                              valueOrDefault<int>(
                                                widget!
                                                    .viewUsers?.rankOrderIndex,
                                                0,
                                              ),
                                              childRanks.length - 1)),
                                      viewportFraction: 0.65,
                                      disableCenter: true,
                                      enlargeCenterPage: true,
                                      enlargeFactor: 0.25,
                                      enableInfiniteScroll: true,
                                      scrollDirection: Axis.horizontal,
                                      autoPlay: false,
                                      onPageChanged: (index, _) async {
                                        _model.carouselCurrentIndex = index;
                                        _model.index =
                                            _model.carouselCurrentIndex;
                                        safeSetState(() {});
                                        HapticFeedback.selectionClick();
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 24.0, 16.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Мой уровень ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: valueOrDefault<String>(
                                                widget!.viewUsers?.level
                                                    ?.toString(),
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    Expanded(
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Уровень ранга ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: valueOrDefault<String>(
                                                ranksRanksRowList
                                                    .elementAtOrNull(
                                                        _model.index)
                                                    ?.requiredLevel
                                                    ?.toString(),
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.progressBarModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ProgressBarWidget(
                                      fact:
                                          widget!.viewUsers?.level?.toDouble(),
                                      plan: ranksRanksRowList
                                          .elementAtOrNull(_model.index)
                                          ?.requiredLevel
                                          ?.toDouble(),
                                      padding: 16,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        ranksRanksRowList
                                            .elementAtOrNull(_model.index)
                                            ?.description,
                                        'null',
                                      ),
                                      textAlign: TextAlign.center,
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
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                                FutureBuilder<List<RankRequiredSkillsRow>>(
                                  future: RankRequiredSkillsTable().queryRows(
                                    queryFn: (q) => q.eqOrNull(
                                      'rank_id',
                                      ranksRanksRowList
                                          .elementAtOrNull(_model.index)
                                          ?.id,
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
                                    List<RankRequiredSkillsRow>
                                        rankRequiredSkillsRankRequiredSkillsRowList =
                                        snapshot.data!;

                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: Visibility(
                                        visible:
                                            rankRequiredSkillsRankRequiredSkillsRowList
                                                .isNotEmpty,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 42.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Требуемые навыки для получения ранга',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: FutureBuilder<
                                                    List<ViewSkillsRow>>(
                                                  future: ViewSkillsTable()
                                                      .queryRows(
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: List.generate(
                                                          columnViewSkillsRowList
                                                              .length,
                                                          (columnIndex) {
                                                        final columnViewSkillsRow =
                                                            columnViewSkillsRowList[
                                                                columnIndex];
                                                        return Visibility(
                                                          visible: rankRequiredSkillsRankRequiredSkillsRowList
                                                              .where((e) =>
                                                                  e.requiredSkillId ==
                                                                  columnViewSkillsRow
                                                                      .id)
                                                              .toList()
                                                              .isNotEmpty,
                                                          child:
                                                              SkillCompareItemWidget(
                                                            key: Key(
                                                                'Key488_${columnIndex}_of_${columnViewSkillsRowList.length}'),
                                                            skillRequiredPoints: rankRequiredSkillsRankRequiredSkillsRowList
                                                                .where((e) =>
                                                                    e.requiredSkillId ==
                                                                    columnViewSkillsRow
                                                                        .id)
                                                                .toList()
                                                                .elementAtOrNull(
                                                                    0)
                                                                ?.requiredSkillPoints,
                                                            viewSkillsRow:
                                                                columnViewSkillsRow,
                                                          ),
                                                        );
                                                      }).divide(
                                                        SizedBox(height: 8.0),
                                                        filterFn:
                                                            (columnIndex) {
                                                          final columnViewSkillsRow =
                                                              columnViewSkillsRowList[
                                                                  columnIndex];
                                                          return rankRequiredSkillsRankRequiredSkillsRowList
                                                              .where((e) =>
                                                                  e.requiredSkillId ==
                                                                  columnViewSkillsRow
                                                                      .id)
                                                              .toList()
                                                              .isNotEmpty;
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                FutureBuilder<List<RankRequiredMissionsRow>>(
                                  future: RankRequiredMissionsTable().queryRows(
                                    queryFn: (q) => q.eqOrNull(
                                      'rank_id',
                                      ranksRanksRowList
                                          .elementAtOrNull(_model.index)
                                          ?.id,
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
                                    List<RankRequiredMissionsRow>
                                        rankRequiredMissionsRankRequiredMissionsRowList =
                                        snapshot.data!;

                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: Visibility(
                                        visible:
                                            rankRequiredMissionsRankRequiredMissionsRowList
                                                .isNotEmpty,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 42.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Требуемые миссии для получения ранга',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: FutureBuilder<
                                                    List<ViewMissionsRow>>(
                                                  future: ViewMissionsTable()
                                                      .queryRows(
                                                    queryFn: (q) =>
                                                        q.inFilterOrNull(
                                                      'id',
                                                      rankRequiredMissionsRankRequiredMissionsRowList
                                                          .map((e) => e
                                                              .requiredMissionId)
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: List.generate(
                                                          viewMissionsViewMissionsRowList
                                                              .length,
                                                          (viewMissionsIndex) {
                                                        final viewMissionsViewMissionsRow =
                                                            viewMissionsViewMissionsRowList[
                                                                viewMissionsIndex];
                                                        return MissionsListItemWidget(
                                                          key: Key(
                                                              'Keyhh3_${viewMissionsIndex}_of_${viewMissionsViewMissionsRowList.length}'),
                                                          index:
                                                              viewMissionsIndex,
                                                          isUnlocked:
                                                              viewMissionsViewMissionsRow
                                                                  .isUnlocked,
                                                          viewMissionsRow:
                                                              viewMissionsViewMissionsRow,
                                                        );
                                                      }).divide(SizedBox(
                                                          height: 8.0)),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          FutureBuilder<List<RankRewardsRow>>(
                            future: RankRewardsTable().queryRows(
                              queryFn: (q) => q.eqOrNull(
                                'rank_id',
                                ranksRanksRowList
                                    .elementAtOrNull(_model.index)
                                    ?.id,
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
                                          FlutterFlowTheme.of(context).primary,
                                      size: 28.0,
                                    ),
                                  ),
                                );
                              }
                              List<RankRewardsRow>
                                  rankRewardsRankRewardsRowList =
                                  snapshot.data!;

                              return Container(
                                decoration: BoxDecoration(),
                                child: FutureBuilder<List<ViewRewardsRow>>(
                                  future: ViewRewardsTable().queryRows(
                                    queryFn: (q) => q.inFilterOrNull(
                                      'id',
                                      rankRewardsRankRewardsRowList
                                          .map((e) => e.rewardId)
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
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 28.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<ViewRewardsRow>
                                        viewRewardsViewRewardsRowList =
                                        snapshot.data!;

                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: Visibility(
                                        visible: viewRewardsViewRewardsRowList
                                            .isNotEmpty,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 32.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Text(
                                                  'Артефакты после получения ранга',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: FutureBuilder<
                                                    List<ViewRewardsRow>>(
                                                  future: ViewRewardsTable()
                                                      .queryRows(
                                                    queryFn: (q) =>
                                                        q.inFilterOrNull(
                                                      'id',
                                                      rankRewardsRankRewardsRowList
                                                          .map(
                                                              (e) => e.rewardId)
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                            MainAxisSize.min,
                                                        children: List.generate(
                                                                rowViewRewardsRowList
                                                                    .length,
                                                                (rowIndex) {
                                                          final rowViewRewardsRow =
                                                              rowViewRewardsRowList[
                                                                  rowIndex];
                                                          return HomeRewardRowItemWidget(
                                                            key: Key(
                                                                'Keyqkr_${rowIndex}_of_${rowViewRewardsRowList.length}'),
                                                            isUnlocked:
                                                                rowViewRewardsRow
                                                                    .isEarned,
                                                            viewRewards:
                                                                rowViewRewardsRow,
                                                          );
                                                        })
                                                            .divide(SizedBox(
                                                                width: 16.0))
                                                            .addToStart(
                                                                SizedBox(
                                                                    width:
                                                                        16.0))
                                                            .addToEnd(SizedBox(
                                                                width: 16.0)),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ]
                            .addToStart(SizedBox(height: 24.0))
                            .addToEnd(SizedBox(height: 128.0)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ].addToStart(SizedBox(height: 60.0)),
        ),
      ),
    );
  }
}
