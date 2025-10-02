import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'event_user_item_model.dart';
export 'event_user_item_model.dart';

class EventUserItemWidget extends StatefulWidget {
  const EventUserItemWidget({
    super.key,
    this.imagePath,
    this.firstName,
    this.lastName,
    required this.userId,
  });

  final String? imagePath;
  final String? firstName;
  final String? lastName;
  final String? userId;

  @override
  State<EventUserItemWidget> createState() => _EventUserItemWidgetState();
}

class _EventUserItemWidgetState extends State<EventUserItemWidget> {
  late EventUserItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventUserItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.pushNamed(
          ProfileDetailsWidget.routeName,
          queryParameters: {
            'userId': serializeParam(
              widget!.userId,
              ParamType.String,
            ),
          }.withoutNulls,
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 82.0,
              height: 82.0,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: ClipOval(
                      child: Container(
                        width: 68.0,
                        height: 68.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).bottomBackground,
                          shape: BoxShape.circle,
                        ),
                        child: Builder(
                          builder: (context) {
                            if (widget!.imagePath != null &&
                                widget!.imagePath != '') {
                              return Image.network(
                                valueOrDefault<String>(
                                  widget!.imagePath,
                                  'null',
                                ),
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                                alignment: Alignment(0.0, 0.0),
                              );
                            } else {
                              return Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  FFIcons.kuser,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 32.0,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${valueOrDefault<String>(
                        widget!.firstName,
                        'null',
                      )} ${valueOrDefault<String>(
                        widget!.lastName,
                        'null',
                      )}',
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
                          ),
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
