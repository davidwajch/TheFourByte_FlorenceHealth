import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool isLoginMode = true;
  bool isAuthenticated = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void toggleMode() {
    isLoginMode = !isLoginMode;
    notifyListeners();
  }

  void login() {
    // Aqui você deve implementar a lógica de login
    isAuthenticated = true; // Simulação de autenticação
    notifyListeners();
  }

  void signup() {
    // Aqui você deve implementar a lógica de cadastro
    isAuthenticated = true; // Simulação de autenticação
    notifyListeners();
  }
}
