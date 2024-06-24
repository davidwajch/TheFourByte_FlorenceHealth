import 'package:flutter/material.dart';

class IMCScreen extends StatelessWidget {
  final String weight;
  final String height;

  const IMCScreen({super.key, required this.weight, required this.height});

  @override
  Widget build(BuildContext context) {
    double heightValue = double.parse(weight);
    double weightValue = double.parse(height);

    double heightInMeters = heightValue / 100;

    double bmi = weightValue / (heightInMeters * heightInMeters);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Índice de Massa Corporal (IMC)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Seu IMC é:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              bmi.toStringAsFixed(2),
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: _getColorForBMI(bmi)),
            ),
            const SizedBox(height: 20),
            _getBMICategory(bmi),
          ],
        ),
      ),
    );
  }

  Color _getColorForBMI(double bmi) {
    if (bmi < 18.5) {
      return Colors.yellow; 
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return Colors.green; 
    } else if (bmi >= 24.9 && bmi < 29.9) {
      return Colors.orange; 
    } else {
      return Colors.red; 
    }
  }

  Widget _getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return const Text(
        'Abaixo do peso',
        style: TextStyle(fontSize: 20, color: Colors.yellow),
      );
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return const Text(
        'Peso normal',
        style: TextStyle(fontSize: 20, color: Colors.green),
      );
    } else if (bmi >= 24.9 && bmi < 29.9) {
      return const Text(
        'Sobrepeso',
        style: TextStyle(fontSize: 20, color: Colors.orange),
      );
    } else {
      return const Text(
        'Obesidade',
        style: TextStyle(fontSize: 20, color: Colors.red),
      );
    }
  }
}
