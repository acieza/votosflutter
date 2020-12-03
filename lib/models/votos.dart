class Votos {
  final String id;
  final String imagen;
  final String titulo;
  final String detalle;
  final int likes;

  Votos({this.id, this.imagen, this.detalle, this.titulo, this.likes});

  factory Votos.fromJson(Map<String, dynamic> json) {
    return Votos(
      id: json['_id'] as String,
      imagen: json['imagen'] as String,
      titulo: json['titulo'] as String,
      likes: json['likes'] as int,
      detalle: json['detalle'] as String,
    );
  }

  @override
  String toString() {
    return 'Trans{id: $id, titulo: $titulo, likes: $likes';
  }
}
