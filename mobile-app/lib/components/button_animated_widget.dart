import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_animated_model.dart';
export 'button_animated_model.dart';

class ButtonAnimatedWidget extends StatefulWidget {
  const ButtonAnimatedWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  State<ButtonAnimatedWidget> createState() => _ButtonAnimatedWidgetState();
}

class _ButtonAnimatedWidgetState extends State<ButtonAnimatedWidget> {
  late ButtonAnimatedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonAnimatedModel());
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
      height: 56.0,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: custom_widgets.AnimatedBorderContainer(
              width: double.infinity,
              height: double.infinity,
              borderRadius: 50.0,
              index: 0,
              color1: Color(0xFFEDFAFE),
              color2: Color(0xFF38A6CD),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).primary,
                    FlutterFlowTheme.of(context).secondary
                  ],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget!.text,
                  'null',
                ),
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      font: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
