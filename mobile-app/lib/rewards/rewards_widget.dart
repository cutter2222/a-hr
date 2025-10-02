import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/choice_chips_widget.dart';
import '/components/message_widget.dart';
import '/components/reward_grid_item_widget.dart';
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
import 'rewards_model.dart';
export 'rewards_model.dart';

class RewardsWidget extends StatefulWidget {
  const RewardsWidget({super.key});

  static String routeName = 'Rewards';
  static String routePath = '/rewards';

  @override
  State<RewardsWidget> createState() => _RewardsWidgetState();
}

class _RewardsWidgetState extends State<RewardsWidget>
    with TickerProviderStateMixin {
  late RewardsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RewardsModel());

    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
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
      'gridViewOnPageLoadAnimation1': AnimationInfo(
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
      'gridViewOnPageLoadAnimation2': AnimationInfo(
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
      'gridViewOnPageLoadAnimation3': AnimationInfo(
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
                    'Артефакты',
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.rarityId = null;
                        _model.isMyRewards = false;
                        safeSetState(() {});
                      },
                      child: wrapWithModel(
                        model: _model.choiceChipsModel1,
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: ChoiceChipsWidget(
                          text: 'Все',
                          isPicked:
                              (_model.rarityId == null) && !_model.isMyRewards,
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.rarityId = null;
                        _model.isMyRewards = true;
                        safeSetState(() {});
                      },
                      child: wrapWithModel(
                        model: _model.choiceChipsModel2,
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: ChoiceChipsWidget(
                          text: 'Доступные мне',
                          isPicked: _model.isMyRewards,
                        ),
                      ),
                    ),
                    FutureBuilder<List<RewardRaritiesRow>>(
                      future: RewardRaritiesTable().queryRows(
                        queryFn: (q) => q.order('name', ascending: true),
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
                        List<RewardRaritiesRow> rowRewardRaritiesRowList =
                            snapshot.data!;

                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                              rowRewardRaritiesRowList.length, (rowIndex) {
                            final rowRewardRaritiesRow =
                                rowRewardRaritiesRowList[rowIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.rarityId = rowRewardRaritiesRow.id;
                                _model.isMyRewards = false;
                                safeSetState(() {});
                              },
                              child: ChoiceChipsWidget(
                                key: Key(
                                    'Keyl2k_${rowIndex}_of_${rowRewardRaritiesRowList.length}'),
                                text: rowRewardRaritiesRow.name!,
                                isPicked:
                                    _model.rarityId == rowRewardRaritiesRow.id,
                              ),
                            );
                          }).divide(SizedBox(width: 8.0)),
                        );
                      },
                    ),
                  ]
                      .divide(SizedBox(width: 8.0))
                      .addToStart(SizedBox(width: 16.0))
                      .addToEnd(SizedBox(width: 16.0)),
                ),
              ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
            ),
            Expanded(
              child: FutureBuilder<List<UserRewardsRow>>(
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
                          color: FlutterFlowTheme.of(context).primary,
                          size: 28.0,
                        ),
                      ),
                    );
                  }
                  List<UserRewardsRow> containerUserRewardsRowList =
                      snapshot.data!;

                  return Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          if (_model.isMyRewards) {
                            return FutureBuilder<List<ViewRewardsRow>>(
                              future: ViewRewardsTable().queryRows(
                                queryFn: (q) => q.inFilterOrNull(
                                  'id',
                                  containerUserRewardsRowList
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
                                    viewMyRewardsViewRewardsRowList =
                                    snapshot.data!;

                                return GridView.builder(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    128.0,
                                  ),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 16.0,
                                    mainAxisSpacing: 16.0,
                                    childAspectRatio: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).width *
                                          0.91 /
                                          393,
                                      0.91,
                                    ),
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      viewMyRewardsViewRewardsRowList.length,
                                  itemBuilder: (context, viewMyRewardsIndex) {
                                    final viewMyRewardsViewRewardsRow =
                                        viewMyRewardsViewRewardsRowList[
                                            viewMyRewardsIndex];
                                    return RewardGridItemWidget(
                                      key: Key(
                                          'Keymyl_${viewMyRewardsIndex}_of_${viewMyRewardsViewRewardsRowList.length}'),
                                      index: viewMyRewardsIndex,
                                      viewRewards: viewMyRewardsViewRewardsRow,
                                      isUnlocked:
                                          viewMyRewardsViewRewardsRow.isEarned,
                                    );
                                  },
                                ).animateOnPageLoad(animationsMap[
                                    'gridViewOnPageLoadAnimation1']!);
                              },
                            );
                          } else if (_model.rarityId != null) {
                            return FutureBuilder<List<ViewRewardsRow>>(
                              future: ViewRewardsTable().queryRows(
                                queryFn: (q) => q.eqOrNull(
                                  'rarity_id',
                                  _model.rarityId,
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
                                    viewRewardsFilterViewRewardsRowList =
                                    snapshot.data!;

                                if (viewRewardsFilterViewRewardsRowList
                                    .isEmpty) {
                                  return Center(
                                    child: MessageWidget(
                                      title: 'Артефакты ещё не обнаружены!',
                                      text:
                                          'Галактика полна тайн, но твой архив пока пуст. Исследуй космос, собирай редкие реликвии и стань настоящим охотником за сокровищами! ',
                                    ),
                                  );
                                }

                                return GridView.builder(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    24.0,
                                    0,
                                    128.0,
                                  ),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 16.0,
                                    mainAxisSpacing: 16.0,
                                    childAspectRatio: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).width *
                                          0.91 /
                                          393,
                                      0.91,
                                    ),
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount: viewRewardsFilterViewRewardsRowList
                                      .length,
                                  itemBuilder:
                                      (context, viewRewardsFilterIndex) {
                                    final viewRewardsFilterViewRewardsRow =
                                        viewRewardsFilterViewRewardsRowList[
                                            viewRewardsFilterIndex];
                                    return RewardGridItemWidget(
                                      key: Key(
                                          'Key1pk_${viewRewardsFilterIndex}_of_${viewRewardsFilterViewRewardsRowList.length}'),
                                      index: viewRewardsFilterIndex,
                                      viewRewards:
                                          viewRewardsFilterViewRewardsRow,
                                      isUnlocked:
                                          viewRewardsFilterViewRewardsRow
                                              .isEarned,
                                    );
                                  },
                                ).animateOnPageLoad(animationsMap[
                                    'gridViewOnPageLoadAnimation2']!);
                              },
                            );
                          } else {
                            return FutureBuilder<List<ViewRewardsRow>>(
                              future: ViewRewardsTable().queryRows(
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 28.0,
                                      ),
                                    ),
                                  );
                                }
                                List<ViewRewardsRow>
                                    viewRewardsAllViewRewardsRowList =
                                    snapshot.data!;

                                if (viewRewardsAllViewRewardsRowList.isEmpty) {
                                  return Center(
                                    child: MessageWidget(
                                      title: 'Артефакты ещё не обнаружены!',
                                      text:
                                          'Галактика полна тайн, но твой архив пока пуст. Исследуй космос, собирай редкие реликвии и стань настоящим охотником за сокровищами!',
                                      rightSide: true,
                                    ),
                                  );
                                }

                                return GridView.builder(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    24.0,
                                    0,
                                    128.0,
                                  ),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 16.0,
                                    mainAxisSpacing: 16.0,
                                    childAspectRatio: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).width *
                                          0.91 /
                                          393,
                                      0.91,
                                    ),
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      viewRewardsAllViewRewardsRowList.length,
                                  itemBuilder: (context, viewRewardsAllIndex) {
                                    final viewRewardsAllViewRewardsRow =
                                        viewRewardsAllViewRewardsRowList[
                                            viewRewardsAllIndex];
                                    return RewardGridItemWidget(
                                      key: Key(
                                          'Key494_${viewRewardsAllIndex}_of_${viewRewardsAllViewRewardsRowList.length}'),
                                      index: viewRewardsAllIndex,
                                      viewRewards: viewRewardsAllViewRewardsRow,
                                      isUnlocked:
                                          viewRewardsAllViewRewardsRow.isEarned,
                                    );
                                  },
                                ).animateOnPageLoad(animationsMap[
                                    'gridViewOnPageLoadAnimation3']!);
                              },
                            );
                          }
                        },
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
