import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/patient/null_component_page/no_appointments_today/no_appointments_today_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page2_model.dart';
export 'home_page2_model.dart';

class HomePage2Widget extends StatefulWidget {
  const HomePage2Widget({
    super.key,
    String? patient,
  }) : this.patient = patient ?? 'Patient';

  final String patient;

  static String routeName = 'HomePage2';
  static String routePath = '/homePage2';

  @override
  State<HomePage2Widget> createState() => _HomePage2WidgetState();
}

class _HomePage2WidgetState extends State<HomePage2Widget> {
  late HomePage2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePage2Model());
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed(SpecizatiomWidget.routeName);
          },
          backgroundColor: FlutterFlowTheme.of(context).teal,
          elevation: 8.0,
          child: Icon(
            Icons.add_rounded,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFF009688),
          automaticallyImplyLeading: false,
          title: Text(
            'Medi-Access',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Rosemary',
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  fontSize: 30.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          toolbarHeight: 80.0,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
            child: RefreshIndicator(
              onRefresh: () async {},
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Welcome Back, ',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Rosemary',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                        StreamBuilder<List<UserDetailsRecord>>(
                          stream: queryUserDetailsRecord(
                            queryBuilder: (userDetailsRecord) =>
                                userDetailsRecord.where(
                              'Email',
                              isEqualTo: currentUserEmail,
                            ),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<UserDetailsRecord> textUserDetailsRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final textUserDetailsRecord =
                                textUserDetailsRecordList.isNotEmpty
                                    ? textUserDetailsRecordList.first
                                    : null;

                            return Text(
                              valueOrDefault<String>(
                                textUserDetailsRecord?.fullName,
                                'Name',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Rosemary',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            );
                          },
                        ),
                      ],
                    ),
                    Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Quick Actions',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Rosemary',
                                      color: Color(0xFF15161E),
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          RecordPageWidget.routeName);
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 60.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFE8F5E9),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          child: Icon(
                                            Icons.medical_information,
                                            color: Color(0xFF2E7D32),
                                            size: 30.0,
                                          ),
                                        ),
                                        Text(
                                          'Records',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Rosemary',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        MedicationPageListWidget.routeName,
                                        queryParameters: {
                                          'emailaddress': serializeParam(
                                            currentUserEmail,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 60.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFE3F2FD),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          child: Icon(
                                            Icons.medication,
                                            color: Color(0xFF1565C0),
                                            size: 30.0,
                                          ),
                                        ),
                                        Text(
                                          'Medications',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Rosemary',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(IdPageWidget.routeName);
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 60.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFFF3E0),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.idCardAlt,
                                              color: Color(0xFFEF6C00),
                                              size: 30.0,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Patient ID',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Rosemary',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          TransactionHistoryWidget.routeName);
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 60.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFCE4EC),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          child: Icon(
                                            Icons.payments,
                                            color: Color(0xFFC2185B),
                                            size: 30.0,
                                          ),
                                        ),
                                        Text(
                                          'Payments',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Rosemary',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Upcoming Appointments',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Rosemary',
                                            color: Color(0xFF15161E),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                            UpcomingAppointmentWidget
                                                .routeName);
                                      },
                                      child: Text(
                                        'See All',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Rosemary',
                                              color: Color(0xFF009688),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                StreamBuilder<List<AppointmentRecord>>(
                                  stream: queryAppointmentRecord(
                                    queryBuilder: (appointmentRecord) =>
                                        appointmentRecord
                                            .where(
                                              'Email',
                                              isEqualTo: currentUserEmail,
                                            )
                                            .where(
                                              'Date',
                                              isGreaterThanOrEqualTo:
                                                  functions.getCurrentDate(),
                                            )
                                            .orderBy('Date'),
                                    limit: 5,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<AppointmentRecord>
                                        columnAppointmentRecordList =
                                        snapshot.data!;
                                    if (columnAppointmentRecordList.isEmpty) {
                                      return NoAppointmentsTodayWidget();
                                    }

                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: List.generate(
                                            columnAppointmentRecordList.length,
                                            (columnIndex) {
                                          final columnAppointmentRecord =
                                              columnAppointmentRecordList[
                                                  columnIndex];
                                          return Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF8F9FA),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 16.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            columnAppointmentRecord
                                                                .doctorName,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Rosemary',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                          StreamBuilder<
                                                              List<
                                                                  DoctorDetailsRecord>>(
                                                            stream:
                                                                queryDoctorDetailsRecord(
                                                              queryBuilder:
                                                                  (doctorDetailsRecord) =>
                                                                      doctorDetailsRecord
                                                                          .where(
                                                                'DoctorName',
                                                                isEqualTo:
                                                                    columnAppointmentRecord
                                                                        .doctorName,
                                                              ),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<DoctorDetailsRecord>
                                                                  textDoctorDetailsRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final textDoctorDetailsRecord =
                                                                  textDoctorDetailsRecordList
                                                                          .isNotEmpty
                                                                      ? textDoctorDetailsRecordList
                                                                          .first
                                                                      : null;

                                                              return Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  textDoctorDetailsRecord
                                                                      ?.specialization,
                                                                  'Specialization',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Rosemary',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.calendar_today,
                                                        color:
                                                            Color(0xFF57636C),
                                                        size: 20.0,
                                                      ),
                                                      Text(
                                                        dateTimeFormat(
                                                          "yMMMd",
                                                          columnAppointmentRecord
                                                              .date!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Rosemary',
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .access_time_filled,
                                                        color:
                                                            Color(0xFF57636C),
                                                        size: 20.0,
                                                      ),
                                                      Text(
                                                        dateTimeFormat(
                                                          "jm",
                                                          columnAppointmentRecord
                                                              .time!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Rosemary',
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 16.0)),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 12.0)),
                                              ),
                                            ),
                                          );
                                        }).divide(SizedBox(height: 10.0)),
                                      ),
                                    );
                                  },
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 24.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
