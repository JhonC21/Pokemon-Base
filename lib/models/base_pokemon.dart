class BasePokemon {
  String nombre;
  String descripcion;
  String especialidad;
  int danio;
  int edad;
  DateTime fechaRegistro;
  String fotoUrl;

  BasePokemon({
    this.nombre = "",
    this.descripcion = "",
    this.especialidad = "",
    this.danio = 0,
    this.edad = 0,
    required this.fechaRegistro,
    this.fotoUrl = "",
  }) : assert(danio >= 0 && edad >= 0);
}
