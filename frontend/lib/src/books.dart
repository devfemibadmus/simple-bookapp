import 'dart:convert';

List<Books> theBooks(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  //final parsed = utf8.decode(responseBody.runes.toList());

  return parsed.map<Books>((json) => Books.fromJson(json)).toList();
}

class Books {
  int id;
  String title;
  String content;
  //bool favorite;

  Books({
    required this.id,
    required this.title,
    required this.content,
    //required this.favorite,
  });

  factory Books.fromJson(Map<String, dynamic> json) {
    return Books(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      //favorite: json['favorite'] as bool,
    );
  }
}
