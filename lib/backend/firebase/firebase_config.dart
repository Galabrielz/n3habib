import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD8QalqZHrUXM8qND9xrM4LxG8xbwjzrcA",
            authDomain: "habibn33.firebaseapp.com",
            projectId: "habibn33",
            storageBucket: "habibn33.appspot.com",
            messagingSenderId: "770838946051",
            appId: "1:770838946051:web:0d73aa5c90494868b40936"));
  } else {
    await Firebase.initializeApp();
  }
}
