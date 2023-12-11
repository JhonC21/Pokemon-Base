import 'package:flutter/material.dart';
import 'package:flutter_pokemon_application/models/base_pokemon.dart';
import 'package:flutter_pokemon_application/screens/detalle_pokemon.dart';

class ListaPokemones extends StatelessWidget {
  final List<BasePokemon> pokemones;

  const ListaPokemones({super.key, required this.pokemones});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Pokémon'),
      ),
      body: ListView.builder(
        itemCount: pokemones.length,
        itemBuilder: (context, index) {
          final pokemon = pokemones[index];

          return ListTile(
            title: Text(pokemon.nombre),
            subtitle: Text('Especialidad: ${pokemon.especialidad}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetallePokemon(pokemon: pokemon),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
