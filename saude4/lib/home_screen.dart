import 'package:flutter/material.dart';
import 'package:saude4/imc_screen.dart';
import 'package:saude4/main.dart';
import 'package:saude4/triagem_screen.dart';
import 'perfil_screen.dart';
import 'map_screen.dart';
import 'medicao_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
             
            ListTile(
              title: const Text('Perfil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PerfilScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Mapa'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Medição'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MedicaoScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Pré tiragem'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PreTriagemScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('IMC'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IMCScreen(height: pessoa.altura.toString() ,weight: pessoa.peso.toString())),
                );
              },
            ),
          ],
        ),
      ),
      body:  Center(child: Image.asset(
                  'assets/image3.png', 
                  fit: BoxFit.cover,
                )),
    );
  }
}
