import 'package:flutter/material.dart';
import 'package:flutter_pokemon_application/models/base_pokemon.dart';
import 'package:flutter_pokemon_application/screens/detalle_pokemon.dart';
import 'package:flutter_pokemon_application/screens/lista_pokemones.dart';
import 'package:flutter_pokemon_application/screens/registro_pokemon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<BasePokemon> listaPokemones = [];

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokémon App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/registro', // Página de inicio
      routes: {
        '/registro': (context) => RegistroPokemon(
              onPokemonRegistered: (pokemon) {
                // Agregar el nuevo pokémon a la lista
                listaPokemones.add(pokemon);
              },
            ),
        '/lista': (context) => ListaPokemones(pokemones: listaPokemones),
        '/detalle': (context) =>
            DetallePokemon(pokemon: BasePokemon(fechaRegistro: DateTime.now())),
      },
    );
  }
}
