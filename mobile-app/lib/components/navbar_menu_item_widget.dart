import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navbar_menu_item_model.dart';
export 'navbar_menu_item_model.dart';

class NavbarMenuItemWidget extends StatefulWidget {
  const NavbarMenuItemWidget({
    super.key,
    bool? isPicked,
    required this.icon,
  }) : this.isPicked = isPicked ?? false;

  final bool isPicked;
  final Widget? icon;

  @override
  State<NavbarMenuItemWidget> createState() => _NavbarMenuItemWidgetState();
}

class _NavbarMenuItemWidgetState extends State<NavbarMenuItemWidget> {
  late NavbarMenuItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarMenuItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget!.isPicked) {
          return Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).primary,
                  FlutterFlowTheme.of(context).secondary
                ],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
              shape: BoxShape.circle,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: widget!.icon!,
            ),
          );
        } else {
          return Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: widget!.icon!,
            ),
          );
        }
      },
    );
  }
}
