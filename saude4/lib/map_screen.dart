import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageSize = screenWidth / 3;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Wrap(
              direction: Axis.vertical,
              alignment: WrapAlignment.center,
              spacing: 20.0, 
              children: [
                const Text(
                    'SPOLEIR!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                Image.asset(
                  'assets/image1.png', // Substitua com o caminho da sua primeira imagem
                  height: imageSize,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/image2.png', 
                  height: imageSize,
                  fit: BoxFit.cover,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
