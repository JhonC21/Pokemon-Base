import 'package:flutter/material.dart';
import 'package:flutter_pokemon_application/models/base_pokemon.dart';

class DetallePokemon extends StatelessWidget {
  final BasePokemon pokemon;

  const DetallePokemon({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Pokémon'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Agregar un contenedor para la imagen del Pokémon
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                pokemon.fotoUrl,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Nombre: ${pokemon.nombre}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Descripción: ${pokemon.descripcion}'),
            const SizedBox(height: 8),
            Text('Especialidad: ${pokemon.especialidad}'),
            const SizedBox(height: 8),
            Text('Daño: ${pokemon.danio.toString()}'),
            const SizedBox(height: 8),
            Text('Edad: ${pokemon.edad.toString()}'),
            const SizedBox(height: 8),
            Text('Fecha de Registro: ${pokemon.fechaRegistro.toString()}'),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
