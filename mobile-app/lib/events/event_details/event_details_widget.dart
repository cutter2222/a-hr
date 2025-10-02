import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/bordered_container_widget.dart';
import '/components/button_blue_widget.dart';
import '/components/event_user_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'event_details_model.dart';
export 'event_details_model.dart';

class EventDetailsWidget extends StatefulWidget {
  const EventDetailsWidget({
    super.key,
    required this.eventId,
    bool? myEvent,
  }) : this.myEvent = myEvent ?? false;

  final int? eventId;
  final bool myEvent;

  static String routeName = 'EventDetails';
  static String routePath = '/eventDetails';

  @override
  State<EventDetailsWidget> createState() => _EventDetailsWidgetState();
}

class _EventDetailsWidgetState extends State<EventDetailsWidget>
    with TickerProviderStateMixin {
  late EventDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventDetailsModel());

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
      'columnOnPageLoadAnimation1': AnimationInfo(
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
      'borderedContainerOnPageLoadAnimation1': AnimationInfo(
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
      'borderedContainerOnPageLoadAnimation2': AnimationInfo(
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
      'columnOnPageLoadAnimation2': AnimationInfo(
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
                    'Событие',
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
                Builder(
                  builder: (context) {
                    if (widget!.myEvent) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          var _shouldSetState = false;
                          _model.queryEvents = await EventsTable().queryRows(
                            queryFn: (q) => q.eqOrNull(
                              'id',
                              widget!.eventId,
                            ),
                          );
                          _shouldSetState = true;
                          if (_model.queryEvents != null &&
                              (_model.queryEvents)!.isNotEmpty) {
                            context.pushNamed(
                              EventAddWidget.routeName,
                              queryParameters: {
                                'eventsRow': serializeParam(
                                  _model.queryEvents?.elementAtOrNull(0),
                                  ParamType.SupabaseRow,
                                ),
                              }.withoutNulls,
                            );
                          } else {
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }

                          if (_shouldSetState) safeSetState(() {});
                        },
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              FFIcons.kedit,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(),
                      );
                    }
                  },
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder<List<ViewEventsRow>>(
                future: ViewEventsTable().querySingleRow(
                  queryFn: (q) => q.eqOrNull(
                    'id',
                    widget!.eventId,
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
                  List<ViewEventsRow> queryViewEventsViewEventsRowList =
                      snapshot.data!;

                  final queryViewEventsViewEventsRow =
                      queryViewEventsViewEventsRowList.isNotEmpty
                          ? queryViewEventsViewEventsRowList.first
                          : null;

                  return Container(
                    decoration: BoxDecoration(),
                    child: FutureBuilder<List<ViewUserEventsRow>>(
                      future: ViewUserEventsTable().queryRows(
                        queryFn: (q) => q.eqOrNull(
                          'event_id',
                          widget!.eventId,
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
                        List<ViewUserEventsRow>
                            queryUserEventViewUserEventsRowList =
                            snapshot.data!;

                        return Container(
                          decoration: BoxDecoration(),
                          child: Stack(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 240.0,
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 240.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bottomBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child:
                                                        FlutterFlowVideoPlayer(
                                                      path:
                                                          'assets/videos/mission_pattern.mp4',
                                                      videoType:
                                                          VideoType.asset,
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      autoPlay: true,
                                                      looping: true,
                                                      showControls: false,
                                                      allowFullScreen: false,
                                                      allowPlaybackSpeedMenu:
                                                          false,
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
                                                    text:
                                                        valueOrDefault<String>(
                                                      queryViewEventsViewEventsRow
                                                          ?.name,
                                                      'null',
                                                    ),
                                                    textColor:
                                                        Color(0xFFE1F4FF),
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 24.0, 16.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Дата начала: ${valueOrDefault<String>(
                                                    dateTimeFormat(
                                                      "dd.MM.y HH:mm",
                                                      queryViewEventsViewEventsRow
                                                          ?.startDate,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    'null',
                                                  )}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ],
                                            ).animateOnPageLoad(animationsMap[
                                                'columnOnPageLoadAnimation1']!),
                                          ),
                                          if (queryViewEventsViewEventsRow
                                                      ?.location !=
                                                  null &&
                                              queryViewEventsViewEventsRow
                                                      ?.location !=
                                                  '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 24.0, 0.0, 0.0),
                                              child: wrapWithModel(
                                                model: _model
                                                    .borderedContainerModel1,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: BorderedContainerWidget(
                                                  title: 'Место проведения',
                                                  text:
                                                      queryViewEventsViewEventsRow
                                                          ?.location,
                                                  color1: FlutterFlowTheme.of(
                                                          context)
                                                      .gradient1n1,
                                                  color2: FlutterFlowTheme.of(
                                                          context)
                                                      .gradient1n2,
                                                  gradientAngle: 140.0,
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'borderedContainerOnPageLoadAnimation1']!),
                                            ),
                                          if (queryViewEventsViewEventsRow
                                                      ?.description !=
                                                  null &&
                                              queryViewEventsViewEventsRow
                                                      ?.description !=
                                                  '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 24.0, 0.0, 0.0),
                                              child: wrapWithModel(
                                                model: _model
                                                    .borderedContainerModel2,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: BorderedContainerWidget(
                                                  title: 'Описание',
                                                  text:
                                                      queryViewEventsViewEventsRow
                                                          ?.description,
                                                  color1: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  color2: FlutterFlowTheme.of(
                                                          context)
                                                      .containerAccent,
                                                  gradientAngle: 140.0,
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'borderedContainerOnPageLoadAnimation2']!),
                                            ),
                                          if (queryUserEventViewUserEventsRowList
                                              .isNotEmpty)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 24.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Участники события',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
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
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final childViewUserEvents =
                                                            queryUserEventViewUserEventsRowList
                                                                .toList();

                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: List.generate(
                                                              childViewUserEvents
                                                                  .length,
                                                              (childViewUserEventsIndex) {
                                                            final childViewUserEventsItem =
                                                                childViewUserEvents[
                                                                    childViewUserEventsIndex];
                                                            return EventUserItemWidget(
                                                              key: Key(
                                                                  'Keys34_${childViewUserEventsIndex}_of_${childViewUserEvents.length}'),
                                                              imagePath:
                                                                  childViewUserEventsItem
                                                                      .userPhotoUrl,
                                                              firstName:
                                                                  childViewUserEventsItem
                                                                      .userFirstName,
                                                              lastName:
                                                                  childViewUserEventsItem
                                                                      .userLastName,
                                                              userId:
                                                                  childViewUserEventsItem
                                                                      .userId!,
                                                            );
                                                          }).divide(SizedBox(
                                                              height: 8.0)),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ).animateOnPageLoad(animationsMap[
                                                  'columnOnPageLoadAnimation2']!),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ]
                                      .addToStart(SizedBox(height: 24.0))
                                      .addToEnd(SizedBox(height: 128.0)),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 50.0),
                                  child: Builder(
                                    builder: (context) {
                                      if (widget!.myEvent) {
                                        return Visibility(
                                          visible: queryViewEventsViewEventsRow!
                                                  .startDate! >=
                                              functions.dateTimeToDate(
                                                  getCurrentTimestamp)!,
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (queryViewEventsViewEventsRow
                                                      ?.participantCount !=
                                                  queryViewEventsViewEventsRow
                                                      ?.maxUsers) {
                                                HapticFeedback.mediumImpact();

                                                context.pushNamed(
                                                  EventCompleteWidget.routeName,
                                                  queryParameters: {
                                                    'eventId': serializeParam(
                                                      widget!.eventId,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                HapticFeedback.vibrate();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'В событии участвуют максимальное количество пользователей',
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
                                                return;
                                              }
                                            },
                                            child: wrapWithModel(
                                              model: _model.buttonBlueModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              updateOnChange: true,
                                              child: ButtonBlueWidget(
                                                name: 'Завершить событие',
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Builder(
                                          builder: (context) {
                                            if (!(queryUserEventViewUserEventsRowList
                                                .where((e) =>
                                                    e.userId == currentUserUid)
                                                .toList()
                                                .isNotEmpty)) {
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (queryViewEventsViewEventsRow
                                                          ?.participantCount !=
                                                      queryViewEventsViewEventsRow
                                                          ?.maxUsers) {
                                                    HapticFeedback
                                                        .mediumImpact();
                                                    await UserEventsTable()
                                                        .insert({
                                                      'user_id': currentUserUid,
                                                      'event_id':
                                                          widget!.eventId,
                                                    });
                                                    safeSetState(() {});
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Вы добавились к событию!',
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
                                                  } else {
                                                    HapticFeedback.vibrate();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'В событии участвуют максимальное количество пользователей',
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
                                                    return;
                                                  }
                                                },
                                                child: wrapWithModel(
                                                  model:
                                                      _model.buttonBlueModel2,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  updateOnChange: true,
                                                  child: ButtonBlueWidget(
                                                    name: 'Я участвую!',
                                                    isInactive: queryViewEventsViewEventsRow
                                                            ?.participantCount ==
                                                        queryViewEventsViewEventsRow
                                                            ?.maxUsers,
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.safePop();
                                                },
                                                child: wrapWithModel(
                                                  model:
                                                      _model.buttonBlueModel3,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  updateOnChange: true,
                                                  child: ButtonBlueWidget(
                                                    name: 'Вы добавлены',
                                                    isInactive: true,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
