import 'package:flutter/material.dart';

class GameGalleryPage extends StatelessWidget {
  const GameGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('game_ui Gallery')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'Widgets will appear here as the package grows.\n\n'
            'Add showcase pages under example/lib/ and link them from this gallery.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
