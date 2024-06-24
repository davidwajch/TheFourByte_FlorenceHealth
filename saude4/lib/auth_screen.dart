import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'auth_provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    
    return Scaffold(
      appBar: AppBar(title: const Text('Login/Cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: authProvider.emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: authProvider.passwordController,
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (authProvider.isLoginMode) {
                  authProvider.login();
                } else {
                  authProvider.signup();
                }
                if (authProvider.isAuthenticated) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomeScreen())
                  );
                }
              },
              child: Text(authProvider.isLoginMode ? 'Login' : 'Cadastrar'),
            ),
            TextButton(
              onPressed: authProvider.toggleMode,
              child: Text(authProvider.isLoginMode ? 'Criar conta' : 'Já possui conta? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
