import '/components/button_blue_widget.dart';
import '/components/message_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'page_info_model.dart';
export 'page_info_model.dart';

class PageInfoWidget extends StatefulWidget {
  const PageInfoWidget({
    super.key,
    required this.title,
    required this.text,
    bool? isRightSide,
    required this.onTap,
  }) : this.isRightSide = isRightSide ?? false;

  final String? title;
  final String? text;
  final bool isRightSide;
  final Future Function()? onTap;

  @override
  State<PageInfoWidget> createState() => _PageInfoWidgetState();
}

class _PageInfoWidgetState extends State<PageInfoWidget> {
  late PageInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageInfoModel());
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
      height: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0x9D090E29),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.messageModel,
                      updateCallback: () => safeSetState(() {}),
                      child: MessageWidget(
                        title: widget!.title!,
                        text: widget!.text!,
                        rightSide: widget!.isRightSide,
                      ),
                    ),
                  ),
                ]
                    .addToStart(SizedBox(height: 240.0))
                    .addToEnd(SizedBox(height: 128.0)),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 50.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  HapticFeedback.mediumImpact();
                  await widget.onTap?.call();
                },
                child: wrapWithModel(
                  model: _model.buttonBlueModel,
                  updateCallback: () => safeSetState(() {}),
                  child: ButtonBlueWidget(
                    name: 'Ок',
                    isInactive: false,
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
