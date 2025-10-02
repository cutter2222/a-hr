import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/message_widget.dart';
import '/components/shop_purchase_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'shop_my_purchases_model.dart';
export 'shop_my_purchases_model.dart';

class ShopMyPurchasesWidget extends StatefulWidget {
  const ShopMyPurchasesWidget({super.key});

  static String routeName = 'ShopMyPurchases';
  static String routePath = '/shopMyPurchases';

  @override
  State<ShopMyPurchasesWidget> createState() => _ShopMyPurchasesWidgetState();
}

class _ShopMyPurchasesWidgetState extends State<ShopMyPurchasesWidget>
    with TickerProviderStateMixin {
  late ShopMyPurchasesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShopMyPurchasesModel());

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
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
        body: Column(
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
                    'Мои покупки',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
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
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: FutureBuilder<List<ViewUserPurchasesRow>>(
                  future: ViewUserPurchasesTable().queryRows(
                    queryFn: (q) => q
                        .eqOrNull(
                          'user_id',
                          currentUserUid,
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
                            color: FlutterFlowTheme.of(context).primary,
                            size: 28.0,
                          ),
                        ),
                      );
                    }
                    List<ViewUserPurchasesRow> columnViewUserPurchasesRowList =
                        snapshot.data!;

                    if (columnViewUserPurchasesRowList.isEmpty) {
                      return Center(
                        child: MessageWidget(
                          title: 'Список покупок в невесомости!',
                          text:
                              'Пока здесь пусто, как в межзвёздном вакууме. Отправляйтесь в КосмоЛавку за гаджетами, которые сделают вашу галактику ярче!',
                        ),
                      );
                    }

                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children:
                            List.generate(columnViewUserPurchasesRowList.length,
                                    (columnIndex) {
                          final columnViewUserPurchasesRow =
                              columnViewUserPurchasesRowList[columnIndex];
                          return ShopPurchaseItemWidget(
                            key: Key(
                                'Keyj0o_${columnIndex}_of_${columnViewUserPurchasesRowList.length}'),
                            viewUserPurchases: columnViewUserPurchasesRow,
                          );
                        })
                                .divide(SizedBox(height: 16.0))
                                .addToStart(SizedBox(height: 24.0))
                                .addToEnd(SizedBox(height: 128.0)),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['columnOnPageLoadAnimation']!);
                  },
                ),
              ),
            ),
          ].addToStart(SizedBox(height: 60.0)),
        ),
      ),
    );
  }
}
