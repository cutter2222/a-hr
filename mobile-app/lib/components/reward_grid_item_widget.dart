import '/backend/supabase/supabase.dart';
import '/components/bottom_reward_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reward_grid_item_model.dart';
export 'reward_grid_item_model.dart';

class RewardGridItemWidget extends StatefulWidget {
  const RewardGridItemWidget({
    super.key,
    required this.viewRewards,
    required this.index,
    bool? isUnlocked,
  }) : this.isUnlocked = isUnlocked ?? false;

  final ViewRewardsRow? viewRewards;
  final int? index;
  final bool isUnlocked;

  @override
  State<RewardGridItemWidget> createState() => _RewardGridItemWidgetState();
}

class _RewardGridItemWidgetState extends State<RewardGridItemWidget> {
  late RewardGridItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RewardGridItemModel());
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
        width: 140.0,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 140.0,
              height: 140.0,
              child: Stack(
                children: [
                  Builder(
                    builder: (context) {
                      if (widget!.isUnlocked) {
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: custom_widgets.AnimatedBorderContainer(
                            width: double.infinity,
                            height: double.infinity,
                            borderRadius: 200.0,
                            index: widget!.index,
                            color1: colorFromCssString(
                              widget!.viewRewards!.rarityColor!,
                              defaultColor:
                                  FlutterFlowTheme.of(context).primaryText,
                            ),
                            color2: Color(0xFF90B2C1),
                          ),
                        );
                      } else {
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).inputBorder,
                            shape: BoxShape.circle,
                          ),
                        );
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: ClipOval(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFF111F36),
                          shape: BoxShape.circle,
                        ),
                        child: Builder(
                          builder: (context) {
                            if (widget!.isUnlocked) {
                              return CachedNetworkImage(
                                fadeInDuration: Duration(milliseconds: 0),
                                fadeOutDuration: Duration(milliseconds: 0),
                                imageUrl: valueOrDefault<String>(
                                  widget!.viewRewards?.imageUrl,
                                  'null',
                                ),
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.contain,
                              );
                            } else {
                              return Opacity(
                                opacity: 0.8,
                                child: CachedNetworkImage(
                                  fadeInDuration: Duration(milliseconds: 0),
                                  fadeOutDuration: Duration(milliseconds: 0),
                                  imageUrl: valueOrDefault<String>(
                                    widget!.viewRewards?.imageUrl,
                                    'null',
                                  ),
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.contain,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Builder(
              builder: (context) {
                if (widget!.isUnlocked) {
                  return Text(
                    valueOrDefault<String>(
                      widget!.viewRewards?.name,
                      'null',
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                          color: colorFromCssString(
                            widget!.viewRewards!.rarityColor!,
                            defaultColor:
                                FlutterFlowTheme.of(context).primaryText,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                        ),
                  );
                } else {
                  return Opacity(
                    opacity: 0.8,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget!.viewRewards?.name,
                          'null',
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              font: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                              color: colorFromCssString(
                                widget!.viewRewards!.rarityColor!,
                                defaultColor:
                                    FlutterFlowTheme.of(context).primaryText,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                              lineHeight: 1.4,
                            ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
