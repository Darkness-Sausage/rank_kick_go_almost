import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC3R-0Ckm0MNfoH31JFm596-xoZL3Gasxc",
            authDomain: "rank-kick-go-ghixa0.firebaseapp.com",
            projectId: "rank-kick-go-ghixa0",
            storageBucket: "rank-kick-go-ghixa0.appspot.com",
            messagingSenderId: "340555730363",
            appId: "1:340555730363:web:dafcc98f62d722b149c89e"));
  } else {
    await Firebase.initializeApp();
  }
}
