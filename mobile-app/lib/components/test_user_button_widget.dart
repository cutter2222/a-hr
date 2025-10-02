import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_user_button_model.dart';
export 'test_user_button_model.dart';

class TestUserButtonWidget extends StatefulWidget {
  const TestUserButtonWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  State<TestUserButtonWidget> createState() => _TestUserButtonWidgetState();
}

class _TestUserButtonWidgetState extends State<TestUserButtonWidget> {
  late TestUserButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestUserButtonModel());
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
      height: 60.0,
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
              color1: FlutterFlowTheme.of(context).gradient2n1,
              color2: FlutterFlowTheme.of(context).gradient2n2,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2.0),
            child: Container(
              width: double.infinity,
              height: 60.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).bottomBackground,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
