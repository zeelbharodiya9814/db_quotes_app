class QUOTES {
  int? id;
  final String quote;
  final String name;

  QUOTES ({
    this.id,
    required this.quote,
    required this.name,
  });

  factory QUOTES.fromMap(Map<String, dynamic> data) {
    return QUOTES(
      id: data['id'],
      quote: data['quote'],
      name: data['name'],
    );
  }
}
