import '/components/message_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_about_model.dart';
export 'profile_about_model.dart';

class ProfileAboutWidget extends StatefulWidget {
  const ProfileAboutWidget({super.key});

  static String routeName = 'ProfileAbout';
  static String routePath = '/profileAbout';

  @override
  State<ProfileAboutWidget> createState() => _ProfileAboutWidgetState();
}

class _ProfileAboutWidgetState extends State<ProfileAboutWidget> {
  late ProfileAboutModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileAboutModel());
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
                    Expanded(
                      child: Text(
                        'О приложении',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              font: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(),
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.messageModel,
                                updateCallback: () => safeSetState(() {}),
                                child: MessageWidget(
                                  title: 'Очень рад что Вы зашли сюда : )',
                                  text:
                                      'Это приложение было сделано командой МАИ для ОЭЗ \"Алабуга\" с любовью, скоростью и вниманию к деталям!',
                                  rightSide: true,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/mai_logo.png',
                                    width: 128.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ]
                              .addToStart(SizedBox(height: 42.0))
                              .addToEnd(SizedBox(height: 128.0)),
                        ),
                      ),
                    ),
                  ),
                ),
              ].addToStart(SizedBox(height: 60.0)),
            ),
          ],
        ),
      ),
    );
  }
}
