import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/MenuLateral.dart';

class ContadorApp extends StatelessWidget {
  const ContadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador de Clicks'),
      ),
      drawer: const MenuLateral(),
      body: const ContadorPage(), // Página del contador
    );
  }
}


class ContadorPage extends StatefulWidget {
  const ContadorPage({super.key});

  @override
  _ContadorPageState createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  int _contador = 0;

  void _incrementar() {
    setState(() {
      _contador++;
    });
  }

  void _restar() {
    setState(() {
      if (_contador > 0) {
        _contador--;
      }
    });
  }

  void _reiniciar() {
    setState(() {
      _contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      drawer: const MenuLateral(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Número de Clicks:',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            Text(
              '$_contador',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _incrementar, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
                  ),
                  child: const Text('Sumar', style: TextStyle(fontSize: 20)),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _restar, // Texto más grande
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
                  ),
                  child: const Text('Restar', style: TextStyle(fontSize: 20)),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _reiniciar, // Texto más grande
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
                  ),
                  child: const Text('Reiniciar', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    );
  }
}
