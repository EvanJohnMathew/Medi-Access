import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "",
            authDomain: "medi-access-feb01.firebaseapp.com",
            projectId: "medi-access-feb01",
            storageBucket: "medi-access-feb01.firebasestorage.app",
            messagingSenderId: "860294042926",
            appId: "1:860294042926:web:761d86a0330a85f04c56bf"));
  } else {
    await Firebase.initializeApp();
  }
}
