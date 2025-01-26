import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  // Clave para SharedPreferences
  static const String backgroundImageKey = 'backgroundImageKey';

  // Lista de opciones de imágenes
  final List<String> _images = [
    'assets/imagen1.jpg',
    'assets/imagen2.jpg',
    'assets/imagen3.jpg',
  ];

  String _selectedImage = 'assets/imagen1.jpg';

  @override
  void initState() {
    super.initState();
    _loadCurrentSelection();
  }

  Future<void> _loadCurrentSelection() async {
    final prefs = await SharedPreferences.getInstance();
    final current = prefs.getString(backgroundImageKey);
    setState(() {
      _selectedImage = current ?? _images.first;
    });
  }

  Future<void> _saveSelection(String imagePath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(backgroundImageKey, imagePath);
  }

  void _onImageSelected(String newImage) {
    setState(() {
      _selectedImage = newImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Elige tu fondo favorito', style: TextStyle(
          color: Colors.black,
        fontSize: 20,
        )
        ),
      ),
      body: ListView.builder(
        itemCount: _images.length,
        itemBuilder: (context, index) {
          final imagePath = _images[index];
          return RadioListTile<String>(
            title: Text('Fondo ${index + 1}'),
            subtitle: Image.asset(imagePath, height: 100, fit: BoxFit.cover),
            value: imagePath,
            groupValue: _selectedImage,
            onChanged: (value) {
              if (value != null) {
                _onImageSelected(value);
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveSelection(_selectedImage).then((_) {
            Navigator.pop(context);
          });
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
