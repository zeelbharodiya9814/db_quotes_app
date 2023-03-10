class QuotesData {
  final String data;
  final String name;

  QuotesData({
    required this.data,
    required this.name,
  });

  factory QuotesData.fromRandom({required Map data1}) {
    return QuotesData(
      data: data1['text1'],
      name: data1['author1'],
    );
  }
  factory QuotesData.fromPatience({required Map data1}) {
    return QuotesData(
      data: data1['text'],
      name: data1['author'],
    );
  }
}