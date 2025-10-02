import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_blue_widget.dart';
import '/components/message_widget.dart';
import '/components/photo_add_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'registration_candidate2_model.dart';
export 'registration_candidate2_model.dart';

class RegistrationCandidate2Widget extends StatefulWidget {
  const RegistrationCandidate2Widget({super.key});

  static String routeName = 'RegistrationCandidate2';
  static String routePath = '/registrationCandidate2';

  @override
  State<RegistrationCandidate2Widget> createState() =>
      _RegistrationCandidate2WidgetState();
}

class _RegistrationCandidate2WidgetState
    extends State<RegistrationCandidate2Widget> {
  late RegistrationCandidate2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegistrationCandidate2Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      buttonSize: 50.0,
                      icon: Icon(
                        FFIcons.kchevronLeft,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.safePop();
                      },
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          wrapWithModel(
                            model: _model.messageModel,
                            updateCallback: () => safeSetState(() {}),
                            child: MessageWidget(
                              title: 'Ты отлично справляешься!',
                              text:
                                  'Помимо ранга, тебе понадобиться особая валюта - монеты. Выполняй миссии, зарабатывай их! Давай начнём, добавь своё фото.',
                              rightSide: true,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.photoAddModel,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: PhotoAddWidget(
                                imagePath: _model.imagePath,
                                onUpload: (imagePath) async {
                                  _model.imagePath = imagePath;
                                  safeSetState(() {});
                                },
                              ),
                            ),
                          ),
                        ]
                            .addToStart(SizedBox(height: 16.0))
                            .addToEnd(SizedBox(height: 520.0)),
                      ),
                    ),
                  ),
                ),
              ].addToStart(SizedBox(height: 60.0)),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.01),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 50.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    HapticFeedback.mediumImpact();
                    await UsersTable().update(
                      data: {
                        'photo_url': _model.imagePath,
                      },
                      matchingRows: (rows) => rows.eqOrNull(
                        'id',
                        currentUserUid,
                      ),
                    );

                    context.goNamed(HomeWidget.routeName);
                  },
                  child: wrapWithModel(
                    model: _model.buttonBlueModel,
                    updateCallback: () => safeSetState(() {}),
                    child: ButtonBlueWidget(
                      name: 'Далее',
                      isInactive: false,
                    ),
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
