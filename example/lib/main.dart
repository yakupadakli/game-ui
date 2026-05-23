import 'package:flutter/material.dart';

import 'game_gallery_page.dart';

void main() {
  runApp(const GameUiExampleApp());
}

class GameUiExampleApp extends StatelessWidget {
  const GameUiExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'game_ui Example',
      theme: ThemeData(useMaterial3: true),
      home: const GameGalleryPage(),
    );
  }
}
