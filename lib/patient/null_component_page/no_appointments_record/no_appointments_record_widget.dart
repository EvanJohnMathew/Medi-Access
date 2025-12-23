import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_appointments_record_model.dart';
export 'no_appointments_record_model.dart';

class NoAppointmentsRecordWidget extends StatefulWidget {
  const NoAppointmentsRecordWidget({super.key});

  @override
  State<NoAppointmentsRecordWidget> createState() =>
      _NoAppointmentsRecordWidgetState();
}

class _NoAppointmentsRecordWidgetState
    extends State<NoAppointmentsRecordWidget> {
  late NoAppointmentsRecordModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoAppointmentsRecordModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.event_busy,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 48.0,
                ),
                Text(
                  'No Appointments',
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Rosemary',
                        letterSpacing: 0.0,
                      ),
                ),
                Text(
                  'You don\'t have any appointments scheduled.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Rosemary',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    context.goNamed(SpecizatiomWidget.routeName);
                  },
                  text: 'Schedule Appointment',
                  options: FFButtonOptions(
                    width: 200.0,
                    height: 48.0,
                    padding: EdgeInsets.all(8.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).teal,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Rosemary',
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
