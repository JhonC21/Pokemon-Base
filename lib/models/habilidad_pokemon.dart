import 'base_pokemon.dart';

class HabilidadPokemon extends BasePokemon {
  HabilidadPokemon({
    required String nombre,
    required String descripcion,
    required String especialidad,
    required int danio,
    required int edad,
    required DateTime fechaRegistro,
    required String fotoUrl,
  }) : super(
          nombre: nombre,
          descripcion: descripcion,
          especialidad: especialidad,
          danio: danio,
          edad: edad,
          fechaRegistro: fechaRegistro,
          fotoUrl: fotoUrl,
        );
}
