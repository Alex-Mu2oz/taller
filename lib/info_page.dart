import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Puedes personalizar tu información aquí
    final String nombre = "Wilson Alexander Muñoz Cardenas";
    final String correo = "wmunozc@unal.edu.co";
    final int edad = 27;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi información'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Nombre: $nombre'),
                const SizedBox(height: 8),
                Text('Correo: $correo'),
                const SizedBox(height: 8),
                Text('Edad: $edad'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
