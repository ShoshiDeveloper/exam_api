enum Countries {
  russia, japan;
}

class News {
  const News({required this.uid, required this.country, required this.title, required this.text, required this.datetime});

  final int uid;
  final Countries country;
  final String title;
  final String text;
  final DateTime datetime;


  Map<String, dynamic> toJson() => {
    'uid': uid,
    'country': country.name,
    'title': title,
    'text': text,
    'time': datetime.toIso8601String()
  };
}