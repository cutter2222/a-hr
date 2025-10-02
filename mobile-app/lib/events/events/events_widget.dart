import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/activity_item_widget.dart';
import '/components/calendar_date_item_widget.dart';
import '/components/choice_chips_widget.dart';
import '/components/message_widget.dart';
import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'events_model.dart';
export 'events_model.dart';

class EventsWidget extends StatefulWidget {
  const EventsWidget({super.key});

  static String routeName = 'Events';
  static String routePath = '/events';

  @override
  State<EventsWidget> createState() => _EventsWidgetState();
}

class _EventsWidgetState extends State<EventsWidget> {
  late EventsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.currentDate = functions.dateTimeToDate(getCurrentTimestamp);
      _model.datePicked = functions.dateTimeToDate(getCurrentTimestamp);
      _model.dateList =
          functions.calendar(_model.currentDate)!.toList().cast<DateTime>();
      _model.initialIndex = functions.calendarCurrentDateIndex(
          _model.dateList.toList(), _model.datePicked);
      safeSetState(() {});
    });

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false);
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
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if ((_model.dateList.isNotEmpty) &&
                      (_model.initialIndex != null))
                    Builder(
                      builder: (context) {
                        final calendar = _model.dateList
                            .where((e) => e.secondsSinceEpoch > 0)
                            .toList();

                        return Container(
                          width: double.infinity,
                          height: 80.0,
                          child: CarouselSlider.builder(
                            itemCount: calendar.length,
                            itemBuilder: (context, calendarIndex, _) {
                              final calendarItem = calendar[calendarIndex];
                              return Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.datePicked = calendarItem;
                                    safeSetState(() {});
                                  },
                                  child: CalendarDateItemWidget(
                                    key: Key(
                                        'Keybum_${calendarIndex}_of_${calendar.length}'),
                                    isPicked: calendarItem == _model.datePicked,
                                    dateTime: calendarItem,
                                  ),
                                ),
                              );
                            },
                            carouselController: _model.carouselController ??=
                                CarouselSliderController(),
                            options: CarouselOptions(
                              initialPage: max(
                                  0,
                                  min(
                                      valueOrDefault<int>(
                                        _model.initialIndex,
                                        0,
                                      ),
                                      calendar.length - 1)),
                              viewportFraction: 0.15,
                              disableCenter: true,
                              enlargeCenterPage: false,
                              enlargeFactor: 0.0,
                              enableInfiniteScroll: false,
                              scrollDirection: Axis.horizontal,
                              autoPlay: false,
                              onPageChanged: (index, _) async {
                                _model.carouselCurrentIndex = index;
                                if (_model.carouselCurrentIndex ==
                                    functions
                                        .subtractOne(_model.dateList.length)) {
                                  _model.dateList = functions
                                      .calendarMergeDates(
                                          _model.dateList.toList(),
                                          functions
                                              .calendar(functions.dateTimePlusDay(
                                                  _model.dateList
                                                      .elementAtOrNull(_model
                                                          .carouselCurrentIndex),
                                                  1))
                                              ?.toList())!
                                      .toList()
                                      .cast<DateTime>();
                                  safeSetState(() {});
                                } else {
                                  return;
                                }
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  Expanded(
                    child: FutureBuilder<List<ViewUsersRow>>(
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
                        List<ViewUsersRow> viewUsersViewUsersRowList =
                            snapshot.data!;

                        final viewUsersViewUsersRow =
                            viewUsersViewUsersRowList.isNotEmpty
                                ? viewUsersViewUsersRowList.first
                                : null;

                        return Container(
                          decoration: BoxDecoration(),
                          child: FutureBuilder<List<ViewEventsRow>>(
                            future: ViewEventsTable().queryRows(
                              queryFn: (q) => q
                                  .gtOrNull(
                                    'start_date',
                                    supaSerialize<DateTime>(functions
                                        .dateTimeToDate(_model.datePicked)),
                                  )
                                  .ltOrNull(
                                    'start_date',
                                    supaSerialize<DateTime>(functions
                                        .dateTimePlusDay(_model.datePicked, 1)),
                                  )
                                  .order('start_date'),
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
                              List<ViewEventsRow> viewEventsViewEventsRowList =
                                  snapshot.data!;

                              return Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 0.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                    EventAddWidget.routeName);
                                              },
                                              child: wrapWithModel(
                                                model: _model.choiceChipsModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ChoiceChipsWidget(
                                                  text: 'Новое событие',
                                                  isPicked: true,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        if (viewEventsViewEventsRowList
                                            .where((e) =>
                                                e.userId == currentUserUid)
                                            .toList()
                                            .isNotEmpty)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              color: Color(0x00000000),
                                              child: ExpandableNotifier(
                                                controller: _model
                                                    .expandableExpandableController,
                                                child: ExpandablePanel(
                                                  header: Text(
                                                    'Созданные мной',
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
                                                  collapsed: Container(),
                                                  expanded: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final childViewEvents =
                                                            viewEventsViewEventsRowList
                                                                .where((e) =>
                                                                    e.userId ==
                                                                    currentUserUid)
                                                                .toList();

                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              childViewEvents
                                                                  .length,
                                                              (childViewEventsIndex) {
                                                            final childViewEventsItem =
                                                                childViewEvents[
                                                                    childViewEventsIndex];
                                                            return ActivityItemWidget(
                                                              key: Key(
                                                                  'Key0tp_${childViewEventsIndex}_of_${childViewEvents.length}'),
                                                              viewEventsRow:
                                                                  childViewEventsItem,
                                                              index:
                                                                  childViewEventsIndex,
                                                              myEvent: true,
                                                            );
                                                          }).divide(SizedBox(
                                                              height: 16.0)),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  theme: ExpandableThemeData(
                                                    tapHeaderToExpand: true,
                                                    tapBodyToExpand: false,
                                                    tapBodyToCollapse: false,
                                                    headerAlignment:
                                                        ExpandablePanelHeaderAlignment
                                                            .center,
                                                    hasIcon: true,
                                                    expandIcon:
                                                        FFIcons.kchevronDown,
                                                    collapseIcon:
                                                        FFIcons.kchevronUp,
                                                    iconSize: 24.0,
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final childViewEvents =
                                                  viewEventsViewEventsRowList
                                                      .where((e) =>
                                                          e.userId !=
                                                          currentUserUid)
                                                      .toList();
                                              if (childViewEvents.isEmpty) {
                                                return Center(
                                                  child: MessageWidget(
                                                    title:
                                                        'Космос ждёт твоих открытий!',
                                                    text:
                                                        'Пока событий нет, но ты можешь стать первым! Создай своё космическое приключение и запусти звёзды в движение!',
                                                  ),
                                                );
                                              }

                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: List.generate(
                                                    childViewEvents.length,
                                                    (childViewEventsIndex) {
                                                  final childViewEventsItem =
                                                      childViewEvents[
                                                          childViewEventsIndex];
                                                  return ActivityItemWidget(
                                                    key: Key(
                                                        'Key5wj_${childViewEventsIndex}_of_${childViewEvents.length}'),
                                                    viewEventsRow:
                                                        childViewEventsItem,
                                                    index: childViewEventsIndex,
                                                  );
                                                }).divide(
                                                    SizedBox(height: 16.0)),
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
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ].addToStart(SizedBox(height: 80.0)),
              ),
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
                    index: 1,
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
