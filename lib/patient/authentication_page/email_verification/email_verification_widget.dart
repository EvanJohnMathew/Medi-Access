import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'email_verification_model.dart';
export 'email_verification_model.dart';

class EmailVerificationWidget extends StatefulWidget {
  const EmailVerificationWidget({super.key});

  @override
  State<EmailVerificationWidget> createState() =>
      _EmailVerificationWidgetState();
}

class _EmailVerificationWidgetState extends State<EmailVerificationWidget> {
  late EmailVerificationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmailVerificationModel());
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
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x1A000000),
                offset: Offset(
                  0.0,
                  2.0,
                ),
                spreadRadius: 0.0,
              )
            ],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.mark_email_read_rounded,
                  color: FlutterFlowTheme.of(context).teal,
                  size: 64.0,
                ),
                Text(
                  'Verify Your Email',
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Rosemary',
                        letterSpacing: 0.0,
                      ),
                ),
                Text(
                  'We\'ve sent a verification link to your email address. Please check your inbox and click the link to verify your account.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Rosemary',
                        letterSpacing: 0.0,
                      ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        await authManager.sendEmailVerification();
                      },
                      text: 'Resend Verification Link',
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 44.0,
                        padding: EdgeInsets.all(8.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).teal,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Rosemary',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        await authManager.refreshUser();
                        if (currentUserEmailVerified) {
                          context.pushNamed(
                            ProfilecreateWidget.routeName,
                            queryParameters: {
                              'eaddress': serializeParam(
                                '',
                                ParamType.String,
                              ),
                              'patient': serializeParam(
                                'Patient',
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        } else {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            isDismissible: false,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: EmailVerificationWidget(),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        }
                      },
                      text: 'Confirm',
                      options: FFButtonOptions(
                        width: 120.0,
                        height: 44.0,
                        padding: EdgeInsets.all(8.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).teal,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Rosemary',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                    ),
                  ],
                ),
                RichText(
                  textScaler: MediaQuery.of(context).textScaler,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Didn\'t receive the email? Check your spam folder or ',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Rosemary',
                              letterSpacing: 0.0,
                            ),
                      ),
                      TextSpan(
                        text: 'contact support',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Rosemary',
                              color: FlutterFlowTheme.of(context).teal,
                              letterSpacing: 0.0,
                            ),
                      )
                    ],
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Rosemary',
                          letterSpacing: 0.0,
                        ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
