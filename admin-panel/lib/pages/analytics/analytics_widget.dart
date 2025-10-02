import '/components/button_choice/button_choice_widget.dart';
import '/components/button_icon/button_icon_widget.dart';
import '/components/chart_widget.dart';
import '/components/navbar_desktop/navbar_desktop_widget.dart';
import '/components/navbar_mobile/navbar_mobile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'analytics_model.dart';
export 'analytics_model.dart';

class AnalyticsWidget extends StatefulWidget {
  const AnalyticsWidget({super.key});

  static String routeName = 'Analytics';
  static String routePath = 'analytics';

  @override
  State<AnalyticsWidget> createState() => _AnalyticsWidgetState();
}

class _AnalyticsWidgetState extends State<AnalyticsWidget> {
  late AnalyticsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnalyticsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.endDate = functions.dateTimeToDate(getCurrentTimestamp);
      _model.startDate = functions.dateTimeMinusDay(getCurrentTimestamp, 180);
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
                        width: MediaQuery.sizeOf(context).width * 1.0,
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
                              Text(
                                'Аналитика',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .labelMediumIsCustom,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.tab = 'users';
                                        safeSetState(() {});
                                      },
                                      child: wrapWithModel(
                                        model: _model.buttonChoiceModel1,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: ButtonChoiceWidget(
                                          isPicked: _model.tab == 'users',
                                          text: 'Пользователи',
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.tab = 'objects';
                                        safeSetState(() {});
                                      },
                                      child: wrapWithModel(
                                        model: _model.buttonChoiceModel2,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: ButtonChoiceWidget(
                                          isPicked: _model.tab == 'tracks',
                                          text: 'Треки',
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                              ),
                              if ((_model.startDate != null) &&
                                  (_model.endDate != null))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          final _datePicked1Date =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: (_model.startDate ??
                                                DateTime.now()),
                                            firstDate: DateTime(1900),
                                            lastDate: (_model.endDate ??
                                                DateTime(2050)),
                                          );

                                          if (_datePicked1Date != null) {
                                            safeSetState(() {
                                              _model.datePicked1 = DateTime(
                                                _datePicked1Date.year,
                                                _datePicked1Date.month,
                                                _datePicked1Date.day,
                                              );
                                            });
                                          } else if (_model.datePicked1 !=
                                              null) {
                                            safeSetState(() {
                                              _model.datePicked1 =
                                                  _model.startDate;
                                            });
                                          }
                                          if (_model.datePicked1 != null) {
                                            _model.startDate =
                                                _model.datePicked1;
                                            safeSetState(() {});
                                          } else {
                                            return;
                                          }
                                        },
                                        child: wrapWithModel(
                                          model: _model.buttonIconModel1,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ButtonIconWidget(
                                            text: valueOrDefault<String>(
                                              dateTimeFormat(
                                                  "dd.MM.yy", _model.startDate),
                                              'null',
                                            ),
                                            icon: Icon(
                                              Icons.calendar_month,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 14.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '-',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          final _datePicked2Date =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: (_model.endDate ??
                                                DateTime.now()),
                                            firstDate: (_model.startDate ??
                                                DateTime(1900)),
                                            lastDate: DateTime(2050),
                                          );

                                          if (_datePicked2Date != null) {
                                            safeSetState(() {
                                              _model.datePicked2 = DateTime(
                                                _datePicked2Date.year,
                                                _datePicked2Date.month,
                                                _datePicked2Date.day,
                                              );
                                            });
                                          } else if (_model.datePicked2 !=
                                              null) {
                                            safeSetState(() {
                                              _model.datePicked2 =
                                                  _model.endDate;
                                            });
                                          }
                                          if (_model.datePicked2 != null) {
                                            _model.endDate = _model.datePicked2;
                                            safeSetState(() {});
                                          } else {
                                            return;
                                          }
                                        },
                                        child: wrapWithModel(
                                          model: _model.buttonIconModel2,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ButtonIconWidget(
                                            text: valueOrDefault<String>(
                                              dateTimeFormat(
                                                  "dd.MM.yy", _model.endDate),
                                              'null',
                                            ),
                                            icon: Icon(
                                              Icons.calendar_month,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 14.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 4.0)),
                                  ),
                                ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        wrapWithModel(
                                          model: _model.chartModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ChartWidget(
                                            axisX: _model.test2,
                                            axisY: _model.test,
                                          ),
                                        ),
                                      ],
                                    ),
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
                        index: 2,
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
