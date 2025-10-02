import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'ban_checkbox_model.dart';
export 'ban_checkbox_model.dart';

class BanCheckboxWidget extends StatefulWidget {
  const BanCheckboxWidget({
    super.key,
    required this.usersRow,
  });

  final UsersRow? usersRow;

  @override
  State<BanCheckboxWidget> createState() => _BanCheckboxWidgetState();
}

class _BanCheckboxWidgetState extends State<BanCheckboxWidget> {
  late BanCheckboxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BanCheckboxModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        if (_model.isCheck) {
          return Icon(
            Icons.check_box,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 28.0,
          );
        } else {
          return Icon(
            Icons.check_box_outline_blank_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 28.0,
          );
        }
      },
    );
  }
}
