import '/backend/supabase/supabase.dart';
import '/components/bottom_reward_details_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_reward_row_item_model.dart';
export 'home_reward_row_item_model.dart';

class HomeRewardRowItemWidget extends StatefulWidget {
  const HomeRewardRowItemWidget({
    super.key,
    required this.viewRewards,
    bool? isUnlocked,
    int? index,
  })  : this.isUnlocked = isUnlocked ?? false,
        this.index = index ?? 0;

  final ViewRewardsRow? viewRewards;
  final bool isUnlocked;
  final int index;

  @override
  State<HomeRewardRowItemWidget> createState() =>
      _HomeRewardRowItemWidgetState();
}

class _HomeRewardRowItemWidgetState extends State<HomeRewardRowItemWidget>
    with TickerProviderStateMixin {
  late HomeRewardRowItemModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeRewardRowItemModel());

    animationsMap.addAll({
      'conditionalBuilderOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: valueOrDefault<double>(
              5000 + (widget!.index * 500),
              5000.0,
            ).ms,
            duration: 1000.0.ms,
            color: Color(0x80FFFFFF),
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
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: BottomRewardDetailsWidget(
                viewRewardsRow: widget!.viewRewards!,
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      },
      child: Container(
        width: 82.0,
        height: 82.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).bottomBackground,
          shape: BoxShape.circle,
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Builder(
            builder: (context) {
              if (widget!.isUnlocked) {
                return Image.network(
                  valueOrDefault<String>(
                    widget!.viewRewards?.imageUrl,
                    'null',
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.contain,
                  alignment: Alignment(0.0, 0.0),
                );
              } else {
                return Opacity(
                  opacity: 0.8,
                  child: Image.network(
                    valueOrDefault<String>(
                      widget!.viewRewards?.imageUrl,
                      'null',
                    ),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.contain,
                    alignment: Alignment(0.0, 0.0),
                  ),
                );
              }
            },
          ).animateOnPageLoad(
              animationsMap['conditionalBuilderOnPageLoadAnimation']!),
        ),
      ),
    );
  }
}
