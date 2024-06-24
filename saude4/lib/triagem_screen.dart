import 'package:flutter/material.dart';

class PreTriagemScreen extends StatefulWidget {
  const PreTriagemScreen({super.key});

  @override
  PreTriagemScreenState createState() => PreTriagemScreenState();
}

class PreTriagemScreenState extends State<PreTriagemScreen> {
  List<String> selectedSintomas = [];
  List<String> selectedLocais = [];
  double nivelDor = 0;

  List<String> sintomas = ['Febre', 'Dor de cabeça', 'Tosse', 'Dor no corpo'];
  List<String> locais = ['Cabeça', 'Barriga', 'Peito', 'Perna'];

  List<String> filteredSintomas = [];

  @override
  void initState() {
    filteredSintomas = sintomas;
    super.initState();
  }

  void filterSintomas(String query) {
    if (query.isNotEmpty) {
      List<String> tempList = [];
      for (var sintoma in sintomas) {
        if (sintoma.toLowerCase().contains(query.toLowerCase())) {
          tempList.add(sintoma);
        }
      }
      setState(() {
        filteredSintomas = tempList;
      });
    } else {
      setState(() {
        filteredSintomas = sintomas;
      });
    }
  }

  Color getSliderColor(double value) {
    if (value >= 0 && value <= 3) {
      return Colors.green;
    } else if (value >= 4 && value <= 7) {
      return const Color.fromARGB(255, 239, 218, 34);
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pré-Triagem'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Digite o sintoma',
                hintText: 'Digite para filtrar os sintomas',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                filterSintomas(value);
              },
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8.0,
              children: filteredSintomas.map((sintoma) {
                return ChoiceChip(
                  label: Text(sintoma),
                  selected: selectedSintomas.contains(sintoma),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedSintomas.add(sintoma);
                      } else {
                        selectedSintomas.remove(sintoma);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8.0,
              children: locais.map((local) {
                return ChoiceChip(
                  label: Text(local),
                  selected: selectedLocais.contains(local),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedLocais.add(local);
                      } else {
                        selectedLocais.remove(local);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Text(
              'Nível de dor: ${nivelDor.toInt()}',
              style: TextStyle(
                color: getSliderColor(nivelDor),
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Slider(
              value: nivelDor,
              min: 0,
              max: 10,
              divisions: 10,
              onChanged: (double value) {
                setState(() {
                  nivelDor = value;
                });
              },
              activeColor: getSliderColor(nivelDor),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Em desenvolvimento'),
                      content: const Text('Estamos trabalhando nisso!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}

