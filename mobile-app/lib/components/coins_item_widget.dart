import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'coins_item_model.dart';
export 'coins_item_model.dart';

class CoinsItemWidget extends StatefulWidget {
  const CoinsItemWidget({
    super.key,
    this.coins,
  });

  final int? coins;

  @override
  State<CoinsItemWidget> createState() => _CoinsItemWidgetState();
}

class _CoinsItemWidgetState extends State<CoinsItemWidget>
    with TickerProviderStateMixin {
  late CoinsItemModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoinsItemModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 5000.0.ms,
            duration: 1000.0.ms,
            color: Color(0x80FFF9B8),
            angle: 0.524,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 42.0,
            height: 42.0,
            decoration: BoxDecoration(
              color: Color(0xFFE8BE16),
              image: DecorationImage(
                fit: BoxFit.cover,
                alignment: AlignmentDirectional(0.0, 0.0),
                image: Image.asset(
                  'assets/images/coin.webp',
                ).image,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 15.0,
                  color: Color(0x8DFFE100),
                  offset: Offset(
                    0.0,
                    0.0,
                  ),
                )
              ],
              shape: BoxShape.circle,
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  functions.formatCoins(widget!.coins?.toDouble()),
                  '0',
                ),
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
          ),
        ],
      ),
    );
  }
}
