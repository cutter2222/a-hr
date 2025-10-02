import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/circle_button_widget.dart';
import '/components/message_widget.dart';
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
import 'registration_candidate1_model.dart';
export 'registration_candidate1_model.dart';

class RegistrationCandidate1Widget extends StatefulWidget {
  const RegistrationCandidate1Widget({super.key});

  static String routeName = 'RegistrationCandidate1';
  static String routePath = '/registrationCandidate1';

  @override
  State<RegistrationCandidate1Widget> createState() =>
      _RegistrationCandidate1WidgetState();
}

class _RegistrationCandidate1WidgetState
    extends State<RegistrationCandidate1Widget> {
  late RegistrationCandidate1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegistrationCandidate1Model());
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
                              title:
                                  'Добро пожаловать на борт программы «Алабуга»!',
                              text:
                                  'Все участники имеют ранги, давай и тебе выдадим твой первый ранг. Нажми кнопку ниже.',
                              rightSide: false,
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
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 128.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    HapticFeedback.vibrate();
                    await UsersTable().update(
                      data: {
                        'rank_id': 1,
                        'level': 1,
                      },
                      matchingRows: (rows) => rows.eqOrNull(
                        'id',
                        currentUserUid,
                      ),
                    );

                    context.pushNamed(RegistrationCandidate2Widget.routeName);
                  },
                  child: wrapWithModel(
                    model: _model.circleButtonModel,
                    updateCallback: () => safeSetState(() {}),
                    child: CircleButtonWidget(),
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
