import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Clave para SharedPreferences
  static const String backgroundImageKey = 'backgroundImageKey';

  // Imagen inicial por defecto (puedes cambiarla)
  String _backgroundImage = 'assets/imagenes/imagen1.jpg';

  @override
  void initState() {
    super.initState();
    _loadBackgroundImage();
  }

  Future<void> _loadBackgroundImage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedImage = prefs.getString(backgroundImageKey);
    if (savedImage != null) {
      setState(() {
        _backgroundImage = savedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla Principal'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),

            child: ElevatedButton.icon(
              icon: const Icon(Icons.info),
              label: const Text('Mi Información'),
              onPressed: () {
                Navigator.pushNamed(context, '/info');
              },
          ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              _backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          // Contenido principal
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 500),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/config').then((_) {
                    // Cuando regresamos de la ConfigPage,
                    // se vuelve a cargar la imagen por si cambió.
                    _loadBackgroundImage();
                  });
                },
                child: const Text('Ir a Configuración',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))
              ),
            ),
            ),
          ),
        ],
      ),
    );
  }
}
