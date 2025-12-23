import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'profilecreate_widget.dart' show ProfilecreateWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ProfilecreateModel extends FlutterFlowModel<ProfilecreateWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  String? _fullNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter the patients full name.';
    }

    return null;
  }

  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageTextController;
  String? Function(BuildContext, String?)? ageTextControllerValidator;
  String? _ageTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter an age for the patient.';
    }

    return null;
  }

  // State field(s) for role widget.
  FocusNode? roleFocusNode;
  TextEditingController? roleTextController;
  String? Function(BuildContext, String?)? roleTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for Gender widget.
  String? genderValue;
  FormFieldController<String>? genderValueController;
  // State field(s) for BloodGroup widget.
  String? bloodGroupValue;
  FormFieldController<String>? bloodGroupValueController;
  // State field(s) for Address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  late MaskTextInputFormatter phoneNumberMask;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for EmergencyContactName widget.
  FocusNode? emergencyContactNameFocusNode;
  TextEditingController? emergencyContactNameTextController;
  String? Function(BuildContext, String?)?
      emergencyContactNameTextControllerValidator;
  // State field(s) for EmergencyContactNumber widget.
  FocusNode? emergencyContactNumberFocusNode;
  TextEditingController? emergencyContactNumberTextController;
  late MaskTextInputFormatter emergencyContactNumberMask;
  String? Function(BuildContext, String?)?
      emergencyContactNumberTextControllerValidator;
  // State field(s) for RelationWithPatient widget.
  FocusNode? relationWithPatientFocusNode;
  TextEditingController? relationWithPatientTextController;
  String? Function(BuildContext, String?)?
      relationWithPatientTextControllerValidator;

  @override
  void initState(BuildContext context) {
    fullNameTextControllerValidator = _fullNameTextControllerValidator;
    ageTextControllerValidator = _ageTextControllerValidator;
  }

  @override
  void dispose() {
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    ageFocusNode?.dispose();
    ageTextController?.dispose();

    roleFocusNode?.dispose();
    roleTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    emergencyContactNameFocusNode?.dispose();
    emergencyContactNameTextController?.dispose();

    emergencyContactNumberFocusNode?.dispose();
    emergencyContactNumberTextController?.dispose();

    relationWithPatientFocusNode?.dispose();
    relationWithPatientTextController?.dispose();
  }
}
