import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_avatar_model.dart';
export 'profile_avatar_model.dart';

class ProfileAvatarWidget extends StatefulWidget {
  const ProfileAvatarWidget({
    super.key,
    this.imagePath,
    this.firstName,
    this.lastName,
  });

  final String? imagePath;
  final String? firstName;
  final String? lastName;

  @override
  State<ProfileAvatarWidget> createState() => _ProfileAvatarWidgetState();
}

class _ProfileAvatarWidgetState extends State<ProfileAvatarWidget> {
  late ProfileAvatarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileAvatarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 136.0,
          height: 136.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).primary,
                FlutterFlowTheme.of(context).containerAccent
              ],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(-1.0, -0.34),
              end: AlignmentDirectional(1.0, 0.34),
            ),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: ClipOval(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).bottomBackground,
                  shape: BoxShape.circle,
                ),
                child: Builder(
                  builder: (context) {
                    if (widget!.imagePath != null && widget!.imagePath != '') {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 500),
                          fadeOutDuration: Duration(milliseconds: 500),
                          imageUrl: valueOrDefault<String>(
                            widget!.imagePath,
                            'null',
                          ),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      );
                    } else {
                      return Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          FFIcons.kuser,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 56.0,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ),
        if ((widget!.firstName != null && widget!.firstName != '') &&
            (widget!.lastName != null && widget!.lastName != ''))
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            child: Text(
              '${valueOrDefault<String>(
                widget!.firstName,
                'null',
              )} ${valueOrDefault<String>(
                widget!.lastName,
                'null',
              )}',
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    font: GoogleFonts.montserrat(
                      fontWeight:
                          FlutterFlowTheme.of(context).labelMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).labelMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelMedium.fontStyle,
                  ),
            ),
          ),
      ],
    );
  }
}
