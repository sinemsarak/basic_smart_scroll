import 'package:flutter/material.dart';
import 'circle.dart';
import 'square.dart';

class HomePage extends StatelessWidget {
  final List _posts = [
    'post 1',
    'post 2',
    'post 3',
    'post 4',
  ];

  final List _stories = [
    'storie 1',
    'storie 2',
    'storie 3',
    'storie 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150,
            child: ListView.builder(
                itemCount: _stories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return MyCircle(
                    child: _stories[index],
                  );
                }),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  return MySquare(
                    child: _posts[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
