import 'package:flutter/material.dart';
import 'package:my_pharma_guide/models/my_user.dart';
import 'package:my_pharma_guide/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_pharma_guide/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('el', 'GR'),
          Locale('en', 'US'),
        ],
        home: Wrapper(),
      ),
    );
  }
}
