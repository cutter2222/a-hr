import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'chart_model.dart';
export 'chart_model.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({
    super.key,
    this.axisX,
    this.axisY,
  });

  final List<DateTime>? axisX;
  final List<double>? axisY;

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  late ChartModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChartModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if ((widget.axisX != null && (widget.axisX)!.isNotEmpty) &&
            (widget.axisY != null && (widget.axisY)!.isNotEmpty)) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                child: Container(
                  height: 213.0,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 4.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final axisYchild = functions
                                .chartAxisYpx(widget.axisY?.toList())
                                ?.toList() ??
                            [];

                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(axisYchild.length,
                              (axisYchildIndex) {
                            final axisYchildItem = axisYchild[axisYchildIndex];
                            return Text(
                              valueOrDefault<String>(
                                formatNumber(
                                  axisYchildItem,
                                  formatType: FormatType.custom,
                                  format: '#',
                                  locale: '',
                                ),
                                'null',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                        child: Container(
                          width: valueOrDefault<double>(
                            functions.chartWidthPx(
                                widget.axisX?.length.toDouble(), 120.0),
                            240.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    40.0, 0.0, 40.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 200.0,
                                  child: FlutterFlowLineChart(
                                    data: [
                                      FFLineChartData(
                                        xData: functions.chartAxisXitems(
                                            widget.axisX?.length)!,
                                        yData: widget.axisY!,
                                        settings: LineChartBarData(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          barWidth: 5.0,
                                          isCurved: true,
                                          preventCurveOverShooting: true,
                                        ),
                                      )
                                    ],
                                    chartStylingInfo: ChartStylingInfo(
                                      enableTooltip: true,
                                      tooltipBackgroundColor: Color(0x40000000),
                                      backgroundColor: Color(0x00FFFFFF),
                                      showGrid: true,
                                      showBorder: false,
                                    ),
                                    axisBounds: AxisBounds(),
                                    xAxisLabelInfo: AxisLabelInfo(),
                                    yAxisLabelInfo: AxisLabelInfo(),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 20.0),
                                child: Builder(
                                  builder: (context) {
                                    final chart = widget.axisX?.toList() ?? [];

                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: List.generate(chart.length,
                                          (chartIndex) {
                                        final chartItem = chart[chartIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  dateTimeFormat(
                                                      "dd.MM", chartItem),
                                                  'null',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallIsCustom,
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
              ),
            ],
          );
        } else {
          return Container(
            width: double.infinity,
            height: 213.0,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.show_chart_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Text(
                    'Нет данных для построения графика',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
