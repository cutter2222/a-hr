import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bordered_quiz_container_model.dart';
export 'bordered_quiz_container_model.dart';

class BorderedQuizContainerWidget extends StatefulWidget {
  const BorderedQuizContainerWidget({
    super.key,
    required this.text,
    bool? isPicked,
  }) : this.isPicked = isPicked ?? false;

  final String? text;
  final bool isPicked;

  @override
  State<BorderedQuizContainerWidget> createState() =>
      _BorderedQuizContainerWidgetState();
}

class _BorderedQuizContainerWidgetState
    extends State<BorderedQuizContainerWidget> {
  late BorderedQuizContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BorderedQuizContainerModel());
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
              widget!.isPicked
                  ? FlutterFlowTheme.of(context).gradient1n1
                  : FlutterFlowTheme.of(context).primary,
              FlutterFlowTheme.of(context).primary,
            ),
            valueOrDefault<Color>(
              widget!.isPicked
                  ? FlutterFlowTheme.of(context).gradient1n2
                  : FlutterFlowTheme.of(context).secondary,
              FlutterFlowTheme.of(context).secondary,
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
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).inputBorder,
                    ),
                  ),
                  child: Builder(
                    builder: (context) {
                      if (widget!.isPicked) {
                        return Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.elasticOut,
                            width: 18.0,
                            height: 18.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFA604F9),
                                  FlutterFlowTheme.of(context).secondary
                                ],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(1.0, 0.0),
                                end: AlignmentDirectional(-1.0, 0),
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget!.text,
                        'null',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
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
