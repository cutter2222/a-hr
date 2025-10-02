import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'menu_pc_item_model.dart';
export 'menu_pc_item_model.dart';

class MenuPcItemWidget extends StatefulWidget {
  const MenuPcItemWidget({
    super.key,
    required this.text,
    required this.icon,
    bool? isSelect,
  }) : this.isSelect = isSelect ?? false;

  final String? text;
  final Widget? icon;
  final bool isSelect;

  @override
  State<MenuPcItemWidget> createState() => _MenuPcItemWidgetState();
}

class _MenuPcItemWidgetState extends State<MenuPcItemWidget> {
  late MenuPcItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuPcItemModel());

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
      height: 48.0,
      decoration: BoxDecoration(
        color: widget.isSelect
            ? FlutterFlowTheme.of(context).lineColor
            : Color(0x00868D94),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            widget.icon!,
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.text,
                    'null',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: widget.isSelect
                            ? FlutterFlowTheme.of(context).primaryText
                            : FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
