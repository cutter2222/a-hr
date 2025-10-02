import '/components/navbar_menu_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navbar_model.dart';
export 'navbar_model.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({
    super.key,
    required this.index,
  });

  final int? index;

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  late NavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 248.0,
      height: 68.0,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: custom_widgets.AnimatedBorderContainer(
              width: double.infinity,
              height: double.infinity,
              borderRadius: 32.0,
              index: 0,
              color1: FlutterFlowTheme.of(context).primary,
              color2: FlutterFlowTheme.of(context).secondaryBackground,
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (widget!.index == 0) {
                              return;
                            }

                            HapticFeedback.mediumImpact();

                            context.pushNamed(
                              HomeWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: wrapWithModel(
                            model: _model.navbarMenuItemModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: NavbarMenuItemWidget(
                              isPicked: widget!.index == 0,
                              icon: Icon(
                                FFIcons.khome,
                                color: widget!.index == 0
                                    ? FlutterFlowTheme.of(context)
                                        .secondaryBackground
                                    : FlutterFlowTheme.of(context).primaryText,
                                size: 28.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (widget!.index == 1) {
                              return;
                            }

                            HapticFeedback.mediumImpact();

                            context.pushNamed(
                              EventsWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: wrapWithModel(
                            model: _model.navbarMenuItemModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: NavbarMenuItemWidget(
                              isPicked: widget!.index == 1,
                              icon: Icon(
                                FFIcons.kcalendar,
                                color: widget!.index == 1
                                    ? FlutterFlowTheme.of(context)
                                        .secondaryBackground
                                    : FlutterFlowTheme.of(context).primaryText,
                                size: 28.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (widget!.index == 2) {
                              return;
                            }

                            HapticFeedback.mediumImpact();

                            context.pushNamed(
                              ShopWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: wrapWithModel(
                            model: _model.navbarMenuItemModel3,
                            updateCallback: () => safeSetState(() {}),
                            child: NavbarMenuItemWidget(
                              isPicked: widget!.index == 2,
                              icon: Icon(
                                FFIcons.kshoppingCartCheck,
                                color: widget!.index == 2
                                    ? FlutterFlowTheme.of(context)
                                        .secondaryBackground
                                    : FlutterFlowTheme.of(context).primaryText,
                                size: 28.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (widget!.index == 3) {
                              return;
                            }

                            HapticFeedback.mediumImpact();

                            context.pushNamed(
                              ProfileWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: wrapWithModel(
                            model: _model.navbarMenuItemModel4,
                            updateCallback: () => safeSetState(() {}),
                            child: NavbarMenuItemWidget(
                              isPicked: widget!.index == 3,
                              icon: Icon(
                                FFIcons.kuser,
                                color: widget!.index == 3
                                    ? FlutterFlowTheme.of(context)
                                        .secondaryBackground
                                    : FlutterFlowTheme.of(context).primaryText,
                                size: 28.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
