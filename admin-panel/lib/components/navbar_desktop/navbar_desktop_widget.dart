import '/components/menu_pc_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'navbar_desktop_model.dart';
export 'navbar_desktop_model.dart';

class NavbarDesktopWidget extends StatefulWidget {
  const NavbarDesktopWidget({super.key});

  @override
  State<NavbarDesktopWidget> createState() => _NavbarDesktopWidgetState();
}

class _NavbarDesktopWidgetState extends State<NavbarDesktopWidget> {
  late NavbarDesktopModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarDesktopModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.0,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(12.0),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 52.0, 12.0, 52.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 32.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/logo.webp',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (getCurrentRoute(context) != '/users') {
                      context.pushNamed(
                        UsersWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    } else {
                      return;
                    }
                  },
                  child: wrapWithModel(
                    model: _model.menuPcItemModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: MenuPcItemWidget(
                      text: 'Пользователи',
                      icon: Icon(
                        Icons.groups,
                        color: getCurrentRoute(context) == '/users'
                            ? FlutterFlowTheme.of(context).secondary
                            : FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      isSelect: getCurrentRoute(context) == '/users',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (getCurrentRoute(context) != '/missions') {
                      context.pushNamed(
                        MissionsWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    } else {
                      return;
                    }
                  },
                  child: wrapWithModel(
                    model: _model.menuPcItemModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: MenuPcItemWidget(
                      text: 'Миссии',
                      icon: Icon(
                        Icons.emoji_flags,
                        color: getCurrentRoute(context) == '/missions'
                            ? FlutterFlowTheme.of(context).secondary
                            : FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      isSelect: getCurrentRoute(context) == '/missions',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (getCurrentRoute(context) != '/checkingMissions') {
                      context.pushNamed(
                        CheckingMissionsWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    } else {
                      return;
                    }
                  },
                  child: wrapWithModel(
                    model: _model.menuPcItemModel3,
                    updateCallback: () => safeSetState(() {}),
                    child: MenuPcItemWidget(
                      text: 'Проверка миссий',
                      icon: Icon(
                        Icons.task_alt,
                        color: getCurrentRoute(context) == '/checkingMissions'
                            ? FlutterFlowTheme.of(context).secondary
                            : FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      isSelect: getCurrentRoute(context) == '/checkingMissions',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (getCurrentRoute(context) != '/ranks') {
                      context.pushNamed(
                        RanksWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    } else {
                      return;
                    }
                  },
                  child: wrapWithModel(
                    model: _model.menuPcItemModel4,
                    updateCallback: () => safeSetState(() {}),
                    child: MenuPcItemWidget(
                      text: 'Ранги',
                      icon: Icon(
                        Icons.military_tech,
                        color: getCurrentRoute(context) == '/ranks'
                            ? FlutterFlowTheme.of(context).secondary
                            : FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      isSelect: getCurrentRoute(context) == '/ranks',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (getCurrentRoute(context) != '/skills') {
                      context.pushNamed(
                        SkillsWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    } else {
                      return;
                    }
                  },
                  child: wrapWithModel(
                    model: _model.menuPcItemModel5,
                    updateCallback: () => safeSetState(() {}),
                    child: MenuPcItemWidget(
                      text: 'Навыки',
                      icon: Icon(
                        Icons.school,
                        color: getCurrentRoute(context) == '/skills'
                            ? FlutterFlowTheme.of(context).secondary
                            : FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      isSelect: getCurrentRoute(context) == '/skills',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (getCurrentRoute(context) != '/branches') {
                      context.pushNamed(
                        BranchesWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    } else {
                      return;
                    }
                  },
                  child: wrapWithModel(
                    model: _model.menuPcItemModel6,
                    updateCallback: () => safeSetState(() {}),
                    child: MenuPcItemWidget(
                      text: 'Ветки',
                      icon: Icon(
                        Icons.account_tree_outlined,
                        color: getCurrentRoute(context) == '/branches'
                            ? FlutterFlowTheme.of(context).secondary
                            : FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      isSelect: getCurrentRoute(context) == '/branches',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (getCurrentRoute(context) != '/rewards') {
                      context.pushNamed(
                        RewardsWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    } else {
                      return;
                    }
                  },
                  child: wrapWithModel(
                    model: _model.menuPcItemModel7,
                    updateCallback: () => safeSetState(() {}),
                    child: MenuPcItemWidget(
                      text: 'Награды',
                      icon: Icon(
                        Icons.emoji_events_outlined,
                        color: getCurrentRoute(context) == '/rewards'
                            ? FlutterFlowTheme.of(context).secondary
                            : FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      isSelect: getCurrentRoute(context) == '/rewards',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (getCurrentRoute(context) != '/rewardsrarities') {
                      context.pushNamed(
                        RewardRaritiesWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    } else {
                      return;
                    }
                  },
                  child: wrapWithModel(
                    model: _model.menuPcItemModel8,
                    updateCallback: () => safeSetState(() {}),
                    child: MenuPcItemWidget(
                      text: 'Уровни наград',
                      icon: Icon(
                        Icons.workspaces,
                        color: getCurrentRoute(context) == '/rewardsrarities'
                            ? FlutterFlowTheme.of(context).secondary
                            : FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      isSelect: getCurrentRoute(context) == '/rewardsrarities',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (getCurrentRoute(context) != '/shop') {
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
                    } else {
                      return;
                    }
                  },
                  child: wrapWithModel(
                    model: _model.menuPcItemModel9,
                    updateCallback: () => safeSetState(() {}),
                    child: MenuPcItemWidget(
                      text: 'Магазин',
                      icon: Icon(
                        Icons.shopping_cart_rounded,
                        color: getCurrentRoute(context) == '/shop'
                            ? FlutterFlowTheme.of(context).secondary
                            : FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      isSelect: getCurrentRoute(context) == '/shop',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (getCurrentRoute(context) != '/shopcategory') {
                      context.pushNamed(
                        ShopCategoryWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    } else {
                      return;
                    }
                  },
                  child: wrapWithModel(
                    model: _model.menuPcItemModel10,
                    updateCallback: () => safeSetState(() {}),
                    child: MenuPcItemWidget(
                      text: 'Категори Магазина',
                      icon: Icon(
                        Icons.category_sharp,
                        color: getCurrentRoute(context) == '/shopcategory'
                            ? FlutterFlowTheme.of(context).secondary
                            : FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      isSelect: getCurrentRoute(context) == '/shopcategory',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (getCurrentRoute(context) != '/purchases') {
                      context.pushNamed(
                        PurchasesWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    } else {
                      return;
                    }
                  },
                  child: wrapWithModel(
                    model: _model.menuPcItemModel11,
                    updateCallback: () => safeSetState(() {}),
                    child: MenuPcItemWidget(
                      text: 'Итория покупок',
                      icon: Icon(
                        Icons.receipt_long_rounded,
                        color: getCurrentRoute(context) == '/purchases'
                            ? FlutterFlowTheme.of(context).secondary
                            : FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      isSelect: getCurrentRoute(context) == '/purchases',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (getCurrentRoute(context) != '/analytics') {
                      context.pushNamed(
                        AnalyticsWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    } else {
                      return;
                    }
                  },
                  child: wrapWithModel(
                    model: _model.menuPcItemModel12,
                    updateCallback: () => safeSetState(() {}),
                    child: MenuPcItemWidget(
                      text: 'Аналитика',
                      icon: Icon(
                        Icons.analytics_outlined,
                        color: getCurrentRoute(context) == '/analytics'
                            ? FlutterFlowTheme.of(context).secondary
                            : FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      isSelect: getCurrentRoute(context) == '/analytics',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (getCurrentRoute(context) != '/profile') {
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
                    } else {
                      return;
                    }
                  },
                  child: wrapWithModel(
                    model: _model.menuPcItemModel13,
                    updateCallback: () => safeSetState(() {}),
                    child: MenuPcItemWidget(
                      text: 'Мой профиль',
                      icon: Icon(
                        Icons.person,
                        color: getCurrentRoute(context) != '/profile'
                            ? FlutterFlowTheme.of(context).secondary
                            : FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      isSelect: getCurrentRoute(context) == '/profile',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
