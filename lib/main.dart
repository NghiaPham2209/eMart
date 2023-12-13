import 'dart:io';

import 'package:emart/view/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'consts/consts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyB77v7db4W4Ltl6n_YevJD_bePOQwKObB0",
              appId: "1:538373107019:android:90401ddc43ea1908a88cce",
              messagingSenderId: "538373107019",
              projectId: "emart-7dc73",
              storageBucket: "emart-7dc73.appspot.com",
              ))
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //we are using getX so we have to change this material app into get material app
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My App",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: darkFontGrey),
          backgroundColor: Colors.transparent,
        ),
        fontFamily: regular,
      ),
      home: const SplashScreen(),
    );
  }
}
