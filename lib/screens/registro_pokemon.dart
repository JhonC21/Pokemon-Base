import 'package:flutter/material.dart';
import 'package:flutter_pokemon_application/models/habilidad_pokemon.dart';
import 'package:image_picker/image_picker.dart';

class RegistroPokemon extends StatefulWidget {
  final Function(HabilidadPokemon) onPokemonRegistered;
  const RegistroPokemon({Key? key, required this.onPokemonRegistered})
      : super(key: key);
  @override
  _RegistroPokemonState createState() => _RegistroPokemonState();
}

class _RegistroPokemonState extends State<RegistroPokemon> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController especialidadController = TextEditingController();
  final TextEditingController danioController = TextEditingController();
  final TextEditingController fotoUrlController = TextEditingController();

  void _registrarPokemon() {
    // Validaciones
    if (nombreController.text.length < 5 || nombreController.text.length > 20) {
      // Nombre no cumple con la longitud requerida
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('El nombre debe tener entre 5 y 20 caracteres.'),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    if (descripcionController.text.length < 25 ||
        descripcionController.text.length > 150) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'La descripción debe ser menor a 150 caracteres y mayor o igual a 25 caracteres'),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    if (especialidadController.text.isEmpty) {
      // Debe tener una especialidad
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debes ingresar una especialidad.'),
          duration: Duration(
              seconds: 3), // Puedes ajustar la duración según tus necesidades.
        ),
      );
      return;
    }

    int danio;
    try {
      danio = int.parse(danioController.text);
      if (danio <= 0) {
        // Daño debe ser mayor que cero
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('El daño debe ser un número mayor que cero.'),
            duration: Duration(
                seconds:
                    3), // Puedes ajustar la duración según tus necesidades.
          ),
        );
        return;
      }
    } catch (e) {
      // Error al parsear el daño
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ingresa un valor numérico válido para el daño.'),
          duration: Duration(
              seconds: 3), // Puedes ajustar la duración según tus necesidades.
        ),
      );
      return;
    }

    HabilidadPokemon nuevoPokemon = HabilidadPokemon(
      nombre: nombreController.text,
      descripcion: descripcionController.text,
      especialidad: especialidadController.text,
      danio: danio,
      edad:
          0, // La edad no se utiliza en este ejemplo, puedes ajustar según tus necesidades.
      fechaRegistro: DateTime.now(),
      fotoUrl: fotoUrlController.text,
    );

    widget.onPokemonRegistered(nuevoPokemon);
    nombreController.clear();
    descripcionController.clear();
    especialidadController.clear();
    danioController.clear();
    fotoUrlController.clear();
  }

  Future<void> _seleccionarImagen() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        fotoUrlController.text = pickedFile.path;
      });
    }
  }

  Future<void> _usarCamara() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        fotoUrlController.text = pickedFile.path;
      });
    }
  }

  void _verListaPokemones() {
    Navigator.pushNamed(context, '/lista');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Pokémon'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nombreController,
                decoration:
                    const InputDecoration(labelText: 'Nombre del Pokémon'),
              ),
              TextFormField(
                controller: descripcionController,
                decoration: const InputDecoration(labelText: 'Descripción'),
                maxLines: 3,
              ),
              TextFormField(
                controller: especialidadController,
                decoration: const InputDecoration(labelText: 'Especialidad'),
              ),
              TextFormField(
                controller: danioController,
                decoration: const InputDecoration(labelText: 'Daño'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _seleccionarImagen,
                child: const Text('Seleccionar Imagen'),
              ),
              ElevatedButton(
                onPressed: _usarCamara,
                child: const Text('Usar la cámara'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _registrarPokemon,
                child: const Text('Registrar Pokémon'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: _verListaPokemones,
                  child: const Text('Ver Lista de Pokémones')),
            ],
          ),
        ),
      ),
    );
  }
}
