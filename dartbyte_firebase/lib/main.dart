import 'dart:ui';

import 'package:dartbyte/firebase_options.dart';
import 'package:dartbyte/screens/dashboard/dashboard_screen.dart';
import 'package:dartbyte/screens/home/byte_screen.dart';
import 'package:dartbyte/screens/login/login_screen.dart';
import 'package:dartbyte/utils/db_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const DartByteApp());
}

class DartByteApp extends StatefulWidget {
  const DartByteApp({super.key});

  @override
  State<DartByteApp> createState() => _DartByteAppState();
}

class _DartByteAppState extends State<DartByteApp> {
  bool _isDarkTheme = false;
  var appbarTitle = 'DartByte Firebase';

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: appbarTitle,
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: _isDarkTheme ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => ByteBoard(
                toggleTheme: _toggleTheme,
                title: 'DartByte Firebase',
              ),
          "/dashboard": (context) => StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Something went wrong!'),
                    );
                  } else if (snapshot.hasData) {
                    return DashboardScreen(
                      toggleTheme: _toggleTheme,
                      title: 'DartByte Firebase - Dashboard',
                    );
                  } else {
                    return LoginScreen(
                      toggleTheme: _toggleTheme,
                      title: 'Login to DartByte Firebase',
                    );
                  }
                },
              )
        },
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
            PointerDeviceKind.unknown,
          },
        ));
  }
}
