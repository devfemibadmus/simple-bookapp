import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'books.dart';

Future<List<Books>> fetchBooks(http.Client client) async {
  String apiUrl = "https://bnlimubarakbook.herokuapp.com/api";
  String token = "f22accad9fdf9754c4adf3de1e19f9b4bf2c3f74";
  final response = await http.get(
    Uri.parse('$apiUrl'),
    headers: {
      HttpHeaders.authorizationHeader: "Token $token",
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );
  if (response.statusCode == 200) {
    return compute(theBooks, response.body);
  } else {
    print(response.statusCode);
    throw Exception('Failed to load album');
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Books>>(
      future: fetchBooks(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          return BooksList(books: snapshot.data!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class BooksList extends StatefulWidget {
  final List<Books> books;

  BooksList({required this.books});

  @override
  _BooksListState createState() {
    return _BooksListState(books: books);
  }
}

class _BooksListState extends State<BooksList> {
  _BooksListState({required this.books});

  final List<Books> books;

  // variables
  MaterialColor heart = Colors.grey;
  String message = '';
  var selectedbook = [];
  void sb() {
    for (int i = 1; i <= books.length; i++) {
      selectedbook.add(-1);
    }
  }

  @override
  Widget build(BuildContext context) {
    sb();
    return Container(
        child: ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, int index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 1.0),
                padding: const EdgeInsets.all(3.0),
                color: Colors.white,
                child: ListTile(
                    leading: Image.asset(
                      'assets/images/book.jpg',
                      scale: 1,
                    ),
                    title: Text(
                      books[index].title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      books[index].content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        size: 20.0,
                        color:
                            selectedbook[index] == index ? Colors.red : heart,
                      ),
                      onPressed: () {
                        favorite(index);
                      },
                    )),
              );
            }));
  }

  void favorite(int index) {
    setState(() {
      int selected = index;
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      if (selected == selectedbook[index]) {
        message = "Removed Book $index from Favorite";
        selectedbook[index] = -1;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(message),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                favorite(index);
              },
            ),
            duration: const Duration(seconds: 2)));
      } else {
        message = "Added Book $index to Favorite";
        selectedbook[index] = index;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(message),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                favorite(index);
              },
            ),
            duration: const Duration(seconds: 2)));
      }
    });
  }
}
