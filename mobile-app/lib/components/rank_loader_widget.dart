import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rank_loader_model.dart';
export 'rank_loader_model.dart';

class RankLoaderWidget extends StatefulWidget {
  const RankLoaderWidget({super.key});

  @override
  State<RankLoaderWidget> createState() => _RankLoaderWidgetState();
}

class _RankLoaderWidgetState extends State<RankLoaderWidget> {
  late RankLoaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RankLoaderModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: Image.asset(
        'assets/images/rank_loader.jpeg',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
        alignment: Alignment(0.0, -1.0),
      ),
    );
  }
}
