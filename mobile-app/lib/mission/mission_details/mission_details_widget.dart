import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/bordered_container_widget.dart';
import '/components/bottom_mission_is_locked_widget.dart';
import '/components/bottom_mission_pending_widget.dart';
import '/components/button_blue_widget.dart';
import '/components/home_reward_row_item_widget.dart';
import '/components/skill_mission_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mission_details_model.dart';
export 'mission_details_model.dart';

class MissionDetailsWidget extends StatefulWidget {
  const MissionDetailsWidget({
    super.key,
    required this.missionId,
  });

  final int? missionId;

  static String routeName = 'MissionDetails';
  static String routePath = '/missionDetails';

  @override
  State<MissionDetailsWidget> createState() => _MissionDetailsWidgetState();
}

class _MissionDetailsWidgetState extends State<MissionDetailsWidget>
    with TickerProviderStateMixin {
  late MissionDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MissionDetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.logbookNotifications(
        context,
      );
    });

    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
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
      'columnOnPageLoadAnimation': AnimationInfo(
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
      'containerOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 3000.0.ms,
            duration: 1000.0.ms,
            color: Color(0x4CFFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 3000.0.ms,
            duration: 1200.0.ms,
            color: Color(0x4CFFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'borderedContainerOnPageLoadAnimation1': AnimationInfo(
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
      'borderedContainerOnPageLoadAnimation2': AnimationInfo(
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
      'containerOnPageLoadAnimation3': AnimationInfo(
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
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
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
                    'Миссия',
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
                  List<ViewMissionsRow> queryViewMissionsViewMissionsRowList =
                      snapshot.data!;

                  final queryViewMissionsViewMissionsRow =
                      queryViewMissionsViewMissionsRowList.isNotEmpty
                          ? queryViewMissionsViewMissionsRowList.first
                          : null;

                  return Container(
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 240.0,
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 240.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .bottomBackground,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: FlutterFlowVideoPlayer(
                                                path:
                                                    'assets/videos/mission_pattern.mp4',
                                                videoType: VideoType.asset,
                                                width: double.infinity,
                                                height: double.infinity,
                                                autoPlay: true,
                                                looping: true,
                                                showControls: false,
                                                allowFullScreen: false,
                                                allowPlaybackSpeedMenu: false,
                                                pauseOnNavigate: false,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 240.0,
                                            child: custom_widgets
                                                .PrintableTextWidget(
                                              width: double.infinity,
                                              height: 240.0,
                                              text: valueOrDefault<String>(
                                                queryViewMissionsViewMissionsRow
                                                    ?.title,
                                                'null',
                                              ),
                                              textColor: Color(0xFFE1F4FF),
                                              textSize: 24.0,
                                              speed: 300.0,
                                              fontWeight: 600,
                                              fontName: 'Montserrat',
                                              position: 'C',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'stackOnPageLoadAnimation']!),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 24.0, 16.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (queryViewMissionsViewMissionsRow
                                                  ?.deadlineAt !=
                                              null)
                                            Text(
                                              ' Миссия до ${valueOrDefault<String>(
                                                dateTimeFormat(
                                                  "dd.MM.y HH:mm",
                                                  queryViewMissionsViewMissionsRow
                                                      ?.deadlineAt,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                'null',
                                              )}',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (queryViewMissionsViewMissionsRow
                                                        ?.xpPoints !=
                                                    null)
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 24.0,
                                                          height: 24.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              image:
                                                                  Image.asset(
                                                                'assets/images/xp_icon.webp',
                                                              ).image,
                                                            ),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                        ).animateOnPageLoad(
                                                            animationsMap[
                                                                'containerOnPageLoadAnimation1']!),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '+${valueOrDefault<String>(
                                                                queryViewMissionsViewMissionsRow
                                                                    ?.xpPoints
                                                                    ?.toString(),
                                                                '0',
                                                              )} опыта',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                if (queryViewMissionsViewMissionsRow
                                                        ?.coins !=
                                                    null)
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 24.0,
                                                          height: 24.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              image:
                                                                  Image.asset(
                                                                'assets/images/coin.webp',
                                                              ).image,
                                                            ),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                        ).animateOnPageLoad(
                                                            animationsMap[
                                                                'containerOnPageLoadAnimation2']!),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '+${valueOrDefault<String>(
                                                                queryViewMissionsViewMissionsRow
                                                                    ?.coins
                                                                    ?.toString(),
                                                                '0',
                                                              )} монет',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (queryViewMissionsViewMissionsRow
                                                            ?.requiredRankName !=
                                                        null &&
                                                    queryViewMissionsViewMissionsRow
                                                            ?.requiredRankName !=
                                                        '')
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      ClipRRect(
                                                        child: Container(
                                                          width: 48.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              queryViewMissionsViewMissionsRow
                                                                  ?.requiredRankImageUrl,
                                                              'null',
                                                            ),
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Доступно для ранга',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .montserrat(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    queryViewMissionsViewMissionsRow
                                                                        ?.requiredRankName,
                                                                    'null',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                if (queryViewMissionsViewMissionsRow
                                                            ?.requiredBranchNames !=
                                                        null &&
                                                    (queryViewMissionsViewMissionsRow
                                                            ?.requiredBranchNames)!
                                                        .isNotEmpty)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 15.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 48.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Visibility(
                                                            visible: queryViewMissionsViewMissionsRow
                                                                        ?.requiredBranchImageUrls !=
                                                                    null &&
                                                                (queryViewMissionsViewMissionsRow
                                                                        ?.requiredBranchImageUrls)!
                                                                    .isNotEmpty,
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                queryViewMissionsViewMissionsRow
                                                                    ?.requiredBranchImageUrls
                                                                    ?.firstOrNull,
                                                                'null',
                                                              ),
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Доступно для веток',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final childRequiredBranchNames =
                                                                          queryViewMissionsViewMissionsRow?.requiredBranchNames?.toList() ??
                                                                              [];

                                                                      return Wrap(
                                                                        spacing:
                                                                            16.0,
                                                                        runSpacing:
                                                                            16.0,
                                                                        alignment:
                                                                            WrapAlignment.start,
                                                                        crossAxisAlignment:
                                                                            WrapCrossAlignment.start,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        runAlignment:
                                                                            WrapAlignment.start,
                                                                        verticalDirection:
                                                                            VerticalDirection.down,
                                                                        clipBehavior:
                                                                            Clip.none,
                                                                        children: List.generate(
                                                                            childRequiredBranchNames.length,
                                                                            (childRequiredBranchNamesIndex) {
                                                                          final childRequiredBranchNamesItem =
                                                                              childRequiredBranchNames[childRequiredBranchNamesIndex];
                                                                          return Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            children: [
                                                                              Container(
                                                                                width: 4.0,
                                                                                height: 4.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    childRequiredBranchNamesItem,
                                                                                    'null',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.montserrat(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        }),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ).animateOnPageLoad(animationsMap[
                                          'columnOnPageLoadAnimation']!),
                                    ),
                                    if (queryViewMissionsViewMissionsRow
                                                ?.description !=
                                            null &&
                                        queryViewMissionsViewMissionsRow
                                                ?.description !=
                                            '')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 0.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.borderedContainerModel1,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: BorderedContainerWidget(
                                            title: 'Описание',
                                            text:
                                                queryViewMissionsViewMissionsRow
                                                    ?.description,
                                            color1: FlutterFlowTheme.of(context)
                                                .primary,
                                            color2: FlutterFlowTheme.of(context)
                                                .containerAccent,
                                            gradientAngle: 140.0,
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'borderedContainerOnPageLoadAnimation1']!),
                                      ),
                                    if (queryViewMissionsViewMissionsRow
                                                ?.task !=
                                            null &&
                                        queryViewMissionsViewMissionsRow
                                                ?.task !=
                                            '')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 0.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.borderedContainerModel2,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: BorderedContainerWidget(
                                            title: 'Задача',
                                            text:
                                                queryViewMissionsViewMissionsRow
                                                    ?.task,
                                            color1: FlutterFlowTheme.of(context)
                                                .gradient1n1,
                                            color2: FlutterFlowTheme.of(context)
                                                .gradient1n2,
                                            gradientAngle: 140.0,
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'borderedContainerOnPageLoadAnimation2']!),
                                      ),
                                    FutureBuilder<List<MissionSkillsRow>>(
                                      future: MissionSkillsTable().queryRows(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 28.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<MissionSkillsRow>
                                            queryMissionSkillsMissionSkillsRowList =
                                            snapshot.data!;

                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: Visibility(
                                            visible:
                                                queryMissionSkillsMissionSkillsRowList
                                                    .isNotEmpty,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 42.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      'Миссия прокачает ваши навыки',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 15.0,
                                                                0.0, 0.0),
                                                    child: FutureBuilder<
                                                        List<ViewSkillsRow>>(
                                                      future: ViewSkillsTable()
                                                          .queryRows(
                                                        queryFn: (q) =>
                                                            q.inFilterOrNull(
                                                          'id',
                                                          queryMissionSkillsMissionSkillsRowList
                                                              .map((e) =>
                                                                  e.skillId)
                                                              .withoutNulls
                                                              .toList(),
                                                        ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
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
                                                        List<ViewSkillsRow>
                                                            columnViewSkillsRowList =
                                                            snapshot.data!;

                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              columnViewSkillsRowList
                                                                  .length,
                                                              (columnIndex) {
                                                            final columnViewSkillsRow =
                                                                columnViewSkillsRowList[
                                                                    columnIndex];
                                                            return SkillMissionItemWidget(
                                                              key: Key(
                                                                  'Keyu6k_${columnIndex}_of_${columnViewSkillsRowList.length}'),
                                                              skillUpPoints:
                                                                  valueOrDefault<
                                                                      double>(
                                                                queryMissionSkillsMissionSkillsRowList
                                                                        .where((e) =>
                                                                            e.skillId ==
                                                                            columnViewSkillsRow
                                                                                .id)
                                                                        .toList()
                                                                        .isNotEmpty
                                                                    ? queryMissionSkillsMissionSkillsRowList
                                                                        .where((e) =>
                                                                            e.skillId ==
                                                                            columnViewSkillsRow
                                                                                .id)
                                                                        .toList()
                                                                        .elementAtOrNull(
                                                                            0)
                                                                        ?.skillUpPoints
                                                                    : 0.0,
                                                                0.0,
                                                              ),
                                                              viewSkillsRow:
                                                                  columnViewSkillsRow,
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
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation3']!);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              FutureBuilder<List<MissionRewardsRow>>(
                                future: MissionRewardsTable().queryRows(
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
                                  List<MissionRewardsRow>
                                      missionRewardsMissionRewardsRowList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Visibility(
                                      visible:
                                          missionRewardsMissionRewardsRowList
                                              .isNotEmpty,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 42.0, 16.0, 0.0),
                                              child: Text(
                                                'Вы получите артефакты',
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
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
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
                                                    missionRewardsMissionRewardsRowList
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
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                              rowViewRewardsRowList
                                                                  .length,
                                                              (rowIndex) {
                                                        final rowViewRewardsRow =
                                                            rowViewRewardsRowList[
                                                                rowIndex];
                                                        return HomeRewardRowItemWidget(
                                                          key: Key(
                                                              'Keyvq7_${rowIndex}_of_${rowViewRewardsRowList.length}'),
                                                          isUnlocked:
                                                              rowViewRewardsRow
                                                                  .isEarned,
                                                          viewRewards:
                                                              rowViewRewardsRow,
                                                        );
                                                      })
                                                          .divide(SizedBox(
                                                              width: 16.0))
                                                          .addToStart(SizedBox(
                                                              width: 16.0))
                                                          .addToEnd(SizedBox(
                                                              width: 16.0)),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation4']!);
                                },
                              ),
                            ]
                                .addToStart(SizedBox(height: 24.0))
                                .addToEnd(SizedBox(height: 256.0)),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 50.0),
                            child: FutureBuilder<List<UserMissionsRow>>(
                              future: UserMissionsTable().querySingleRow(
                                queryFn: (q) => q
                                    .eqOrNull(
                                      'user_id',
                                      currentUserUid,
                                    )
                                    .eqOrNull(
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
                                List<UserMissionsRow>
                                    isUnlockedCheckUserMissionsRowList =
                                    snapshot.data!;

                                final isUnlockedCheckUserMissionsRow =
                                    isUnlockedCheckUserMissionsRowList
                                            .isNotEmpty
                                        ? isUnlockedCheckUserMissionsRowList
                                            .first
                                        : null;

                                return Builder(
                                  builder: (context) {
                                    if (queryViewMissionsViewMissionsRow
                                            ?.isUnlocked ??
                                        false) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (isUnlockedCheckUserMissionsRow ==
                                              null)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                var _shouldSetState = false;
                                                HapticFeedback.mediumImpact();
                                                if (queryViewMissionsViewMissionsRow!
                                                        .autoCheckEnabled! &&
                                                    (queryViewMissionsViewMissionsRow
                                                                ?.autoCheckFunctionName !=
                                                            null &&
                                                        queryViewMissionsViewMissionsRow
                                                                ?.autoCheckFunctionName !=
                                                            '')) {
                                                  _model.callAutoCheckFunction =
                                                      await actions
                                                          .callAutocheckFunction(
                                                    queryViewMissionsViewMissionsRow
                                                        ?.autoCheckFunctionName,
                                                    widget!.missionId,
                                                  );
                                                  _shouldSetState = true;
                                                  if (_model
                                                          .callAutoCheckFunction ==
                                                      'success') {
                                                    context.safePop();
                                                  } else {
                                                    HapticFeedback.vibrate();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          _model
                                                              .callAutoCheckFunction!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                                    .primaryText,
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
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bottomBackground,
                                                      ),
                                                    );
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                } else if (queryViewMissionsViewMissionsRow
                                                        ?.type ==
                                                    MissionType.take_photo_video
                                                        .name) {
                                                  context.pushNamed(
                                                    MissionTakePhotoVideoWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'viewMissionsRow':
                                                          serializeParam(
                                                        queryViewMissionsViewMissionsRow,
                                                        ParamType.SupabaseRow,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } else if (queryViewMissionsViewMissionsRow
                                                        ?.type ==
                                                    MissionType
                                                        .gallery_photo_video
                                                        .name) {
                                                  context.pushNamed(
                                                    MissionGalleryPhotoVideoWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'viewMissionsRow':
                                                          serializeParam(
                                                        queryViewMissionsViewMissionsRow,
                                                        ParamType.SupabaseRow,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } else if (queryViewMissionsViewMissionsRow
                                                        ?.type ==
                                                    MissionType.file.name) {
                                                  context.pushNamed(
                                                    MissionUploadFileWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'viewMissionsRow':
                                                          serializeParam(
                                                        queryViewMissionsViewMissionsRow,
                                                        ParamType.SupabaseRow,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } else if (queryViewMissionsViewMissionsRow
                                                        ?.type ==
                                                    MissionType.quiz.name) {
                                                  context.pushNamed(
                                                    MissionQuizWidget.routeName,
                                                    queryParameters: {
                                                      'viewMissionsRow':
                                                          serializeParam(
                                                        queryViewMissionsViewMissionsRow,
                                                        ParamType.SupabaseRow,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } else if (queryViewMissionsViewMissionsRow
                                                        ?.type ==
                                                    MissionType
                                                        .questionnaire.name) {
                                                  context.pushNamed(
                                                    MissionQuestionnaireWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'viewMissionsRow':
                                                          serializeParam(
                                                        queryViewMissionsViewMissionsRow,
                                                        ParamType.SupabaseRow,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                }

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.buttonBlueModel1,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                updateOnChange: true,
                                                child: ButtonBlueWidget(
                                                  name: 'Пройти миссию',
                                                  isInactive: false,
                                                ),
                                              ),
                                            ),
                                          if ((queryViewMissionsViewMissionsRow
                                                      ?.type ==
                                                  MissionType.quiz.name) &&
                                              (isUnlockedCheckUserMissionsRow
                                                      ?.playload !=
                                                  null))
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  MissionQuizResultWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'userMissionsRow':
                                                        serializeParam(
                                                      isUnlockedCheckUserMissionsRow,
                                                      ParamType.SupabaseRow,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: wrapWithModel(
                                                model: _model.buttonBlueModel2,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ButtonBlueWidget(
                                                  name: 'Результаты квиза',
                                                  isInactive: false,
                                                ),
                                              ),
                                            ),
                                          if (queryViewMissionsViewMissionsRow
                                                  ?.userMissionsStatus ==
                                              UserMissionStatus.pending.name)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            BottomMissionPendingWidget(),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: wrapWithModel(
                                                model: _model.buttonBlueModel3,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ButtonBlueWidget(
                                                  name: 'Миссия на проверке',
                                                  isInactive: true,
                                                ),
                                              ),
                                            ),
                                        ].divide(SizedBox(height: 8.0)),
                                      );
                                    } else {
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      BottomMissionIsLockedWidget(
                                                    missionId:
                                                        queryViewMissionsViewMissionsRow!
                                                            .id!,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        text: 'Почему недоступна?',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 56.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .bottomBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyLarge
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
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
