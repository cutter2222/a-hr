import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_rating_item_model.dart';
export 'user_rating_item_model.dart';

class UserRatingItemWidget extends StatefulWidget {
  const UserRatingItemWidget({
    super.key,
    this.rankPosition,
    this.imagePath,
    this.firstName,
    this.lastName,
    this.points,
    required this.userId,
  });

  final int? rankPosition;
  final String? imagePath;
  final String? firstName;
  final String? lastName;
  final int? points;
  final String? userId;

  @override
  State<UserRatingItemWidget> createState() => _UserRatingItemWidgetState();
}

class _UserRatingItemWidgetState extends State<UserRatingItemWidget> {
  late UserRatingItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserRatingItemModel());
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
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Builder(
                      builder: (context) {
                        if (widget!.rankPosition == 1) {
                          return Container(
                            width: 32.0,
                            height: 32.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/medal_gold.webp',
                                ).image,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8.0,
                                  color: Color(0x2EE7B711),
                                  offset: Offset(
                                    0.0,
                                    0.0,
                                  ),
                                )
                              ],
                              shape: BoxShape.circle,
                            ),
                          );
                        } else if (widget!.rankPosition == 2) {
                          return Container(
                            width: 32.0,
                            height: 32.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/medal_silver.webp',
                                ).image,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8.0,
                                  color: Color(0x2E1185E7),
                                  offset: Offset(
                                    0.0,
                                    0.0,
                                  ),
                                )
                              ],
                              shape: BoxShape.circle,
                            ),
                          );
                        } else if (widget!.rankPosition == 3) {
                          return Container(
                            width: 32.0,
                            height: 32.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/medal_bronze.webp',
                                ).image,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8.0,
                                  color: Color(0x2EA85A16),
                                  offset: Offset(
                                    0.0,
                                    0.0,
                                  ),
                                )
                              ],
                              shape: BoxShape.circle,
                            ),
                          );
                        } else {
                          return Container(
                            width: 32.0,
                            height: 32.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                          );
                        }
                      },
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          if (widget!.rankPosition! < 4) {
                            return Text(
                              '#${valueOrDefault<String>(
                                widget!.rankPosition?.toString(),
                                '0',
                              )}',
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                  ),
                            );
                          } else {
                            return Text(
                              '#${valueOrDefault<String>(
                                widget!.rankPosition?.toString(),
                                '0',
                              )}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                            );
                          }
                        },
                      ),
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  functions.formatCoins(widget!.points?.toDouble()),
                  'null',
                ),
                maxLines: 1,
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      font: GoogleFonts.montserrat(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
