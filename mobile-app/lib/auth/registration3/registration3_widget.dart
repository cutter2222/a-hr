import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_blue_widget.dart';
import '/components/choose_item_widget.dart';
import '/components/message_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'registration3_model.dart';
export 'registration3_model.dart';

class Registration3Widget extends StatefulWidget {
  const Registration3Widget({super.key});

  static String routeName = 'Registration3';
  static String routePath = '/registration3';

  @override
  State<Registration3Widget> createState() => _Registration3WidgetState();
}

class _Registration3WidgetState extends State<Registration3Widget> {
  late Registration3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Registration3Model());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
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
                              title: 'Рад знакомству!',
                              text: 'Расскажи, ты раньше был\nв Алабуге?',
                              rightSide: true,
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              HapticFeedback.mediumImpact();
                              _model.role = UserRole.candidate;
                              safeSetState(() {});
                            },
                            child: wrapWithModel(
                              model: _model.chooseItemModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: ChooseItemWidget(
                                index: 0,
                                isPicked: _model.role == UserRole.candidate,
                                text: 'Нет, я только начинаю свой путь',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.role = UserRole.employee;
                                safeSetState(() {});
                                HapticFeedback.mediumImpact();
                              },
                              child: wrapWithModel(
                                model: _model.chooseItemModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: ChooseItemWidget(
                                  index: 0,
                                  isPicked: _model.role == UserRole.employee,
                                  text: 'Да, я уже работаю на предприятии',
                                ),
                              ),
                            ),
                          ),
                        ]
                            .addToStart(SizedBox(height: 16.0))
                            .addToEnd(SizedBox(height: 128.0)),
                      ),
                    ),
                  ),
                ),
              ].addToStart(SizedBox(height: 60.0)),
            ),
            if (!(isWeb
                ? MediaQuery.viewInsetsOf(context).bottom > 0
                : _isKeyboardVisible))
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 50.0),
                  child: wrapWithModel(
                    model: _model.buttonBlueModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: ButtonBlueWidget(
                      name: 'Далее',
                    ),
                  ),
                ),
              ),
            if (!(isWeb
                ? MediaQuery.viewInsetsOf(context).bottom > 0
                : _isKeyboardVisible))
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 50.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (_model.role != null) {
                        HapticFeedback.mediumImpact();
                        await UsersTable().update(
                          data: {
                            'role': _model.role?.name,
                            'rank_id': () {
                              if (_model.role == UserRole.candidate) {
                                return 1;
                              } else if (_model.role == UserRole.employee) {
                                return 5;
                              } else {
                                return 1;
                              }
                            }(),
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'id',
                            currentUserUid,
                          ),
                        );
                        if (_model.role == UserRole.candidate) {
                          context.pushNamed(
                              RegistrationCandidate1Widget.routeName);
                        } else if (_model.role == UserRole.employee) {
                          context
                              .pushNamed(RegistrationEmployee1Widget.routeName);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Выберите один из вариантов',
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
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                          return;
                        }
                      } else {
                        HapticFeedback.vibrate();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Выберите один из вариантов',
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
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).bottomBackground,
                          ),
                        );
                        return;
                      }
                    },
                    child: wrapWithModel(
                      model: _model.buttonBlueModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: ButtonBlueWidget(
                        name: 'Далее',
                        isInactive: _model.role == null,
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
