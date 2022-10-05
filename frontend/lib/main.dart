import 'src/favorite.dart';
import 'src/others/header.dart';
import 'package:flutter/material.dart';
import 'src/home.dart';
import 'src/market.dart';
import 'src/read.dart';
import 'src/others/drawer.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Books Bn Li Mubarak',
      initialRoute: '/',
      routes: {
        '/': (context) => const PageBudder(),
        '/read': (context) => const ReadPage(),
      },
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color.fromARGB(255, 255, 255, 255),
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          headline3: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          headline4: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          headline5: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          headline6: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class PageBudder extends StatefulWidget {
  const PageBudder({super.key});
  @override
  _PageBudderState createState() {
    return _PageBudderState();
  }
}

class _PageBudderState extends State<PageBudder> {
  //List<String> _titles = ["Home", "Profile", "Shop"];
  List<Widget> pages = [
    const HomePage(),
    const FavoritePage(),
    const MarketPage(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: headpage(),
      body: IndexedStack(index: _selectedIndex, children: pages),
      // bottomNavigationBar: const FootPage(id: 'market'),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Shop',
          ),
        ],
        onTap: _onTap,
        currentIndex: _selectedIndex,
        selectedItemColor: _selectedIndex == 0
            ? Colors.blue
            : _selectedIndex == 1
                ? Colors.red
                : Colors.green,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 10,
        selectedFontSize: 12,
      ),
    );
  }

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }
}
