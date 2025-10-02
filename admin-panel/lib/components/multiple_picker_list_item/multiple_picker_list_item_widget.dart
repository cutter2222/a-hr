import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'multiple_picker_list_item_model.dart';
export 'multiple_picker_list_item_model.dart';

class MultiplePickerListItemWidget extends StatefulWidget {
  const MultiplePickerListItemWidget({
    super.key,
    required this.text,
    bool? isPicked,
  }) : this.isPicked = isPicked ?? false;

  final String? text;
  final bool isPicked;

  @override
  State<MultiplePickerListItemWidget> createState() =>
      _MultiplePickerListItemWidgetState();
}

class _MultiplePickerListItemWidgetState
    extends State<MultiplePickerListItemWidget> {
  late MultiplePickerListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MultiplePickerListItemModel());

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
      width: double.infinity,
      height: 60.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    valueOrDefault<String>(
                      widget.text,
                      'null',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (widget.isPicked) {
                      return Icon(
                        Icons.check_box,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 28.0,
                      );
                    } else {
                      return Icon(
                        Icons.check_box_outline_blank_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 28.0,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
          ),
        ],
      ),
    );
  }
}
