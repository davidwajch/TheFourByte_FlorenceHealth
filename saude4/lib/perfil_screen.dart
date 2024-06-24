import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  PerfilScreenState createState() => PerfilScreenState();
}

class PerfilScreenState extends State<PerfilScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _weightController;
  late TextEditingController _heightController;
  String _qrText = '';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'João Silva');
    _emailController = TextEditingController(text: 'joao.silva@example.com');
    _phoneController = TextEditingController(text: '+55 11 98765-4321');
    _weightController = TextEditingController(text: '70.0');
    _heightController = TextEditingController(text: '175.0');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  void _showWorkInProgressPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registro Médico'),
          content: const Text('Estamos trabalhando para implementar essa funcionalidade.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Entendi'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Telefone'),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: _weightController,
                decoration: const InputDecoration(labelText: 'Peso (kg)'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: _heightController,
                decoration: const InputDecoration(labelText: 'Altura (cm)'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 24.0),
              Row(
                children: [
                  const Text('Registro Médico:'),
                  const SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: _showWorkInProgressPopup,
                    child: const Text('Adicionar'),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              Row(
                children: [
                  const Text('Gerar QR code:'),
                  const SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _qrText = 'Nome: ${_nameController.text}\n'
                                  'E-mail: ${_emailController.text}\n'
                                  'Telefone: ${_phoneController.text}\n'
                                  'Peso: ${_weightController.text} kg\n'
                                  'Altura: ${_heightController.text} cm';
                      });
                    },
                    child: const Text('Gerar QR code'),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              if (_qrText.isNotEmpty)
                Center(
                  child: QrImageView(
                    data: _qrText,
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
