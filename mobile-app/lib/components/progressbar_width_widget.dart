import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'progressbar_width_model.dart';
export 'progressbar_width_model.dart';

class ProgressbarWidthWidget extends StatefulWidget {
  const ProgressbarWidthWidget({
    super.key,
    required this.plan,
    required this.fact,
    required this.width,
  });

  final double? plan;
  final double? fact;
  final double? width;

  @override
  State<ProgressbarWidthWidget> createState() => _ProgressbarWidthWidgetState();
}

class _ProgressbarWidthWidgetState extends State<ProgressbarWidthWidget> {
  late ProgressbarWidthModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProgressbarWidthModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Container(
        width: valueOrDefault<double>(
          widget!.width,
          80.0,
        ),
        height: 8.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).bottomBackground,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Align(
          alignment: AlignmentDirectional(-1.0, 0.0),
          child: Container(
            width: valueOrDefault<double>(
              widget!.width,
              20.0,
            ),
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).primary,
                  FlutterFlowTheme.of(context).secondary
                ],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.0, 1.0),
                end: AlignmentDirectional(0, -1.0),
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      ),
    );
  }
}
