import 'package:flutter/material.dart';

class FootPage extends StatelessWidget {
  final String id;
  const FootPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final pages = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final thispage = id;
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              thispage != "home"
              ? Navigator.pop(context)
              : null;
            },
            icon: thispage == "home"
                ? const Icon(
                    Icons.home_filled,
                    color: Colors.red,
                    size: 35,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: Colors.blue,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              thispage != "book"
              ? Navigator.pushNamed(context, '/books', arguments: {'pagename': 'books'},)
              : null;
            },
            icon: thispage == "market"
                ? const Icon(
                    Icons.widgets_rounded,
                    color: Colors.red,
                    size: 35,
                  )
                : const Icon(
                    Icons.widgets_outlined,
                    color: Colors.blue,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              thispage != "favorite"
              ? Navigator.pushNamed(context, '/favorite', arguments: {'pagename': 'favorite'},)
              : null;
            },
            icon: thispage == "favorite"
                ? const Icon(
                    Icons.favorite_outlined,
                    color: Colors.red,
                    size: 35,
                  )
                : const Icon(
                    Icons.favorite_outline,
                    color: Colors.blue,
                    size: 35,
                  ),
          ),
        ],
      ),
    );
  }
}


