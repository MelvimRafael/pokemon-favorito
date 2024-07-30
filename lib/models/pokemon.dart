class Pokemon {
  final String name;
  final String url;
  final String imageUrl;
  final String type;
  final int height;
  final int weight;

  Pokemon({
    required this.name,
    required this.url,
    required this.imageUrl,
    required this.type,
    required this.height,
    required this.weight,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'] ?? 'Unknown', // Valor padrão se nome for nulo
      url: json['url'] ?? '', // Valor padrão se URL for nulo
      imageUrl: json['sprites']?['front_default'] ??
          '', // Valor padrão se imagem for nula
      type: json['types']?[0]['type']['name'] ??
          'Unknown', // Valor padrão se tipo for nulo
      height: json['height'] ?? 0, // Valor padrão se altura for nula
      weight: json['weight'] ?? 0, // Valor padrão se peso for nulo
    );
  }
}
