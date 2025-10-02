import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'button_choice_model.dart';
export 'button_choice_model.dart';

class ButtonChoiceWidget extends StatefulWidget {
  const ButtonChoiceWidget({
    super.key,
    bool? isPicked,
    required this.text,
  }) : this.isPicked = isPicked ?? false;

  final bool isPicked;
  final String? text;

  @override
  State<ButtonChoiceWidget> createState() => _ButtonChoiceWidgetState();
}

class _ButtonChoiceWidgetState extends State<ButtonChoiceWidget> {
  late ButtonChoiceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonChoiceModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: widget.isPicked
              ? FlutterFlowTheme.of(context).primaryText
              : FlutterFlowTheme.of(context).inputFieldBorder,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              valueOrDefault<String>(
                widget.text,
                'null',
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    color: widget.isPicked
                        ? FlutterFlowTheme.of(context).primaryText
                        : FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
