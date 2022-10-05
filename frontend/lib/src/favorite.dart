import 'dart:io';
import 'dart:async';
import 'books.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<List<Books>> fetchBooks() async {
  var data = await rootBundle.loadString('assets/favorite.json');
  return compute(theBooks, data);
}

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  _FavoritePageState createState() {
    return _FavoritePageState();
  }
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Books>>(
      future: fetchBooks(),
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

  @override
  Widget build(BuildContext context) {
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
                  trailing: Icon(
                    Icons.delete,
                    size: 20.0,
                    color: Colors.red,
                  ),
                  onTap: () {
                    delBook(index);
                  },
                ),
              );
            }));
  }

  void delBook(index) {
    //
    print("hh");
  }
}
