import 'package:flutter/material.dart';

AppBar headpage(){
        return 
        AppBar(
        title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                    Text(
                        "Books ",
                        style: TextStyle(
                            letterSpacing: 10,
                            fontWeight: FontWeight.w900,
                        )
                        ),
                    Text(
                        "Bn Li Mubarak",
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.blue,
                            shadows: [
                                Shadow(color: Colors.white, offset: Offset(2,1), blurRadius:10)  
                            ],
                        )
                        ),
                ],
            )
      );
}