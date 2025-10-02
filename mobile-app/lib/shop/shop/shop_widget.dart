import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/choice_chips_widget.dart';
import '/components/coins_item_widget.dart';
import '/components/navbar_widget.dart';
import '/components/shop_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'shop_model.dart';
export 'shop_model.dart';

class ShopWidget extends StatefulWidget {
  const ShopWidget({super.key});

  static String routeName = 'Shop';
  static String routePath = '/shop';

  @override
  State<ShopWidget> createState() => _ShopWidgetState();
}

class _ShopWidgetState extends State<ShopWidget> with TickerProviderStateMixin {
  late ShopModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShopModel());

    animationsMap.addAll({
      'rowOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 32.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 250.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 250.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 32.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 500.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 500.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 32.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'gridViewOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 750.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 750.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 32.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'gridViewOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 750.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 750.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 32.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
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
            Opacity(
              opacity: 0.8,
              child: Lottie.asset(
                'assets/jsons/stars_lottie.json',
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 180.0,
                fit: BoxFit.contain,
                animate: true,
              ),
            ),
            FutureBuilder<List<UsersRow>>(
              future: UsersTable().querySingleRow(
                queryFn: (q) => q.eqOrNull(
                  'id',
                  currentUserUid,
                ),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 28.0,
                      height: 28.0,
                      child: SpinKitPulse(
                        color: FlutterFlowTheme.of(context).primary,
                        size: 28.0,
                      ),
                    ),
                  );
                }
                List<UsersRow> queryUsersUsersRowList = snapshot.data!;

                final queryUsersUsersRow = queryUsersUsersRowList.isNotEmpty
                    ? queryUsersUsersRowList.first
                    : null;

                return Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: wrapWithModel(
                                model: _model.coinsItemModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: CoinsItemWidget(
                                  coins: valueOrDefault<int>(
                                    queryUsersUsersRow?.coins,
                                    0,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context
                                    .pushNamed(ShopMyPurchasesWidget.routeName);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'МОИ\nПОКУПКИ',
                                      textAlign: TextAlign.end,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                            lineHeight: 1.4,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        FFIcons.kshoppingCart,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 28.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ).animateOnPageLoad(
                            animationsMap['rowOnPageLoadAnimation1']!),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 0.0),
                          child: Text(
                            'КосмоЛавка',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation']!),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  HapticFeedback.selectionClick();
                                  _model.categoryId = null;
                                  safeSetState(() {});
                                },
                                child: wrapWithModel(
                                  model: _model.choiceChipsModel1,
                                  updateCallback: () => safeSetState(() {}),
                                  updateOnChange: true,
                                  child: ChoiceChipsWidget(
                                    text: 'Все',
                                    isPicked: _model.categoryId == null,
                                  ),
                                ),
                              ),
                              FutureBuilder<List<ShopCategoriesRow>>(
                                future: ShopCategoriesTable().queryRows(
                                  queryFn: (q) =>
                                      q.order('order_index', ascending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 28.0,
                                        height: 28.0,
                                        child: SpinKitPulse(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 28.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<ShopCategoriesRow>
                                      rowShopCategoriesRowList = snapshot.data!;

                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        rowShopCategoriesRowList.length,
                                        (rowIndex) {
                                      final rowShopCategoriesRow =
                                          rowShopCategoriesRowList[rowIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          HapticFeedback.selectionClick();
                                          _model.categoryId =
                                              rowShopCategoriesRow.id;
                                          safeSetState(() {});
                                        },
                                        child: ChoiceChipsWidget(
                                          key: Key(
                                              'Key8j0_${rowIndex}_of_${rowShopCategoriesRowList.length}'),
                                          text: rowShopCategoriesRow.name!,
                                          isPicked: rowShopCategoriesRow.id ==
                                              _model.categoryId,
                                        ),
                                      );
                                    }).divide(SizedBox(width: 8.0)),
                                  );
                                },
                              ),
                            ]
                                .divide(SizedBox(width: 8.0))
                                .addToStart(SizedBox(width: 16.0))
                                .addToEnd(SizedBox(width: 16.0)),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['rowOnPageLoadAnimation2']!),
                      ),
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            if (_model.categoryId != null) {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 0.0),
                                child: FutureBuilder<List<ViewShopProductsRow>>(
                                  future: ViewShopProductsTable().queryRows(
                                    queryFn: (q) => q
                                        .eqOrNull(
                                          'cateogry_id',
                                          _model.categoryId,
                                        )
                                        .order('created_at'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 28.0,
                                          height: 28.0,
                                          child: SpinKitPulse(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 28.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<ViewShopProductsRow>
                                        queryFilterViewShopProductsRowList =
                                        snapshot.data!;

                                    return GridView.builder(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        0,
                                        0,
                                        128.0,
                                      ),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio:
                                            valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width *
                                              0.8 /
                                              393,
                                          0.8,
                                        ),
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          queryFilterViewShopProductsRowList
                                              .length,
                                      itemBuilder: (context, queryFilterIndex) {
                                        final queryFilterViewShopProductsRow =
                                            queryFilterViewShopProductsRowList[
                                                queryFilterIndex];
                                        return ShopItemWidget(
                                          key: Key(
                                              'Key0yc_${queryFilterIndex}_of_${queryFilterViewShopProductsRowList.length}'),
                                          viewShopProductsRow:
                                              queryFilterViewShopProductsRow,
                                        );
                                      },
                                    ).animateOnPageLoad(animationsMap[
                                        'gridViewOnPageLoadAnimation1']!);
                                  },
                                ),
                              );
                            } else {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 0.0),
                                child: FutureBuilder<List<ViewShopProductsRow>>(
                                  future: ViewShopProductsTable().queryRows(
                                    queryFn: (q) => q.order('created_at'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 28.0,
                                          height: 28.0,
                                          child: SpinKitPulse(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 28.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<ViewShopProductsRow>
                                        queryAllViewShopProductsRowList =
                                        snapshot.data!;

                                    return GridView.builder(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        0,
                                        0,
                                        128.0,
                                      ),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio:
                                            valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width *
                                              0.8 /
                                              393,
                                          0.8,
                                        ),
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemCount: queryAllViewShopProductsRowList
                                          .length,
                                      itemBuilder: (context, queryAllIndex) {
                                        final queryAllViewShopProductsRow =
                                            queryAllViewShopProductsRowList[
                                                queryAllIndex];
                                        return ShopItemWidget(
                                          key: Key(
                                              'Keyjre_${queryAllIndex}_of_${queryAllViewShopProductsRowList.length}'),
                                          viewShopProductsRow:
                                              queryAllViewShopProductsRow,
                                        );
                                      },
                                    ).animateOnPageLoad(animationsMap[
                                        'gridViewOnPageLoadAnimation2']!);
                                  },
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ].addToStart(SizedBox(height: 60.0)),
                  ),
                );
              },
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 52.0),
                child: wrapWithModel(
                  model: _model.navbarModel,
                  updateCallback: () => safeSetState(() {}),
                  updateOnChange: true,
                  child: NavbarWidget(
                    index: 2,
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
