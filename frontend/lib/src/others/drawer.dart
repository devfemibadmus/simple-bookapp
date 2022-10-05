import 'package:flutter/material.dart';



class MyDrawer extends StatelessWidget {
    const MyDrawer({super.key});

    @override
    Widget build(BuildContext context){
        return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Book Bn Li Mubarak'),
            ),
            ListTile(
              title: const Text('Coming Soon'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Coming Soon'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
    );
    }
}

