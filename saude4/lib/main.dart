import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saude4/profile_model.dart';
import 'auth_provider.dart';
import 'auth_screen.dart';

void main() {
  runApp( MyApp());
}
Profile pessoa =Profile();
class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => AuthProvider(),
      child: MaterialApp(
        title: 'SAUDE 4',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const AuthScreen(),
      ),
    );
  }
}
