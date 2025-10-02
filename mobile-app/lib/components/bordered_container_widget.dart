import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bordered_container_model.dart';
export 'bordered_container_model.dart';

class BorderedContainerWidget extends StatefulWidget {
  const BorderedContainerWidget({
    super.key,
    this.title,
    this.text,
    Color? color1,
    Color? color2,
    double? gradientAngle,
  })  : this.color1 = color1 ?? const Color(0xFF0099FF),
        this.color2 = color2 ?? const Color(0xD90C1547),
        this.gradientAngle = gradientAngle ?? 0.0;

  final String? title;
  final String? text;
  final Color color1;
  final Color color2;
  final double gradientAngle;

  @override
  State<BorderedContainerWidget> createState() =>
      _BorderedContainerWidgetState();
}

class _BorderedContainerWidgetState extends State<BorderedContainerWidget> {
  late BorderedContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BorderedContainerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            valueOrDefault<Color>(
              widget!.color1,
              FlutterFlowTheme.of(context).primary,
            ),
            valueOrDefault<Color>(
              widget!.color2,
              FlutterFlowTheme.of(context).containerAccent,
            )
          ],
          stops: [0.0, 1.0],
          begin: AlignmentDirectional(0.64, -1.0),
          end: AlignmentDirectional(-0.64, 1.0),
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(2.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget!.title != null && widget!.title != '')
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget!.title,
                        'null',
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                if (widget!.text != null && widget!.text != '')
                  Text(
                    valueOrDefault<String>(
                      widget!.text,
                      'null',
                    ),
                    textAlign: TextAlign.start,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
