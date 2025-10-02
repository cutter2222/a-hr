import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'button_filter_model.dart';
export 'button_filter_model.dart';

class ButtonFilterWidget extends StatefulWidget {
  const ButtonFilterWidget({
    super.key,
    bool? isActive,
  }) : this.isActive = isActive ?? false;

  final bool isActive;

  @override
  State<ButtonFilterWidget> createState() => _ButtonFilterWidgetState();
}

class _ButtonFilterWidgetState extends State<ButtonFilterWidget> {
  late ButtonFilterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonFilterModel());

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
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).inputFieldBorder,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Icon(
              Icons.filter_list,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
          ),
          if (widget.isActive)
            Align(
              alignment: AlignmentDirectional(1.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).error,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
