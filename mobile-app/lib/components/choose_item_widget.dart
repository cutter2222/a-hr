import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'choose_item_model.dart';
export 'choose_item_model.dart';

class ChooseItemWidget extends StatefulWidget {
  const ChooseItemWidget({
    super.key,
    required this.index,
    bool? isPicked,
    required this.text,
  }) : this.isPicked = isPicked ?? false;

  final int? index;
  final bool isPicked;
  final String? text;

  @override
  State<ChooseItemWidget> createState() => _ChooseItemWidgetState();
}

class _ChooseItemWidgetState extends State<ChooseItemWidget> {
  late ChooseItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseItemModel());
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
      height: 120.0,
      child: Stack(
        children: [
          Builder(
            builder: (context) {
              if (widget!.isPicked) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: custom_widgets.AnimatedBorderContainer(
                    width: double.infinity,
                    height: double.infinity,
                    borderRadius: 16.0,
                    index: widget!.index,
                    color1: Color(0xFF724DD9),
                    color2: Color(0xFFF08A93),
                  ),
                );
              } else {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).inputBorder,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                );
              }
            },
          ),
          Padding(
            padding: EdgeInsets.all(2.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(14.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget!.text,
                        'null',
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontStyle,
                            ),
                            color: valueOrDefault<Color>(
                              widget!.isPicked
                                  ? FlutterFlowTheme.of(context).primaryText
                                  : FlutterFlowTheme.of(context).secondaryText,
                              FlutterFlowTheme.of(context).primaryText,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                            lineHeight: 1.5,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
