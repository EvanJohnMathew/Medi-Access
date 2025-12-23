import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_medication_model.dart';
export 'no_medication_model.dart';

class NoMedicationWidget extends StatefulWidget {
  const NoMedicationWidget({super.key});

  @override
  State<NoMedicationWidget> createState() => _NoMedicationWidgetState();
}

class _NoMedicationWidgetState extends State<NoMedicationWidget> {
  late NoMedicationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoMedicationModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 26.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.medication_liquid,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 48.0,
              ),
              Text(
                'No Medications',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Rosemary',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                'You currently have no medications added to your record.',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Rosemary',
                      letterSpacing: 0.0,
                    ),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
