import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'choice_chips_model.dart';
export 'choice_chips_model.dart';

class ChoiceChipsWidget extends StatefulWidget {
  const ChoiceChipsWidget({
    super.key,
    required this.text,
    bool? isPicked,
  }) : this.isPicked = isPicked ?? false;

  final String? text;
  final bool isPicked;

  @override
  State<ChoiceChipsWidget> createState() => _ChoiceChipsWidgetState();
}

class _ChoiceChipsWidgetState extends State<ChoiceChipsWidget> {
  late ChoiceChipsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChoiceChipsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1D2F51),
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(
          color: valueOrDefault<Color>(
            widget!.isPicked
                ? FlutterFlowTheme.of(context).primary
                : Colors.transparent,
            Colors.transparent,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(14.0, 6.0, 14.0, 6.0),
        child: Text(
          valueOrDefault<String>(
            widget!.text,
            'null',
          ),
          style: FlutterFlowTheme.of(context).bodyLarge.override(
                font: GoogleFonts.montserrat(
                  fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                ),
                color: valueOrDefault<Color>(
                  widget!.isPicked
                      ? FlutterFlowTheme.of(context).primaryText
                      : FlutterFlowTheme.of(context).secondaryText,
                  FlutterFlowTheme.of(context).secondaryText,
                ),
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
              ),
        ),
      ),
    );
  }
}
