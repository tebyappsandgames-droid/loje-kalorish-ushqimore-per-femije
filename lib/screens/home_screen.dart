import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dish_selector_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgrounds/home_screen_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logos_and_buttons/logo.png', height: 200),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                player.play(AssetSource('sounds/click.mp3')); // Opcionale nëse keni tinguj
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DishSelectorScreen()),
                );
              },
              child: Image.asset('assets/logos_and_buttons/play_button.png', width: 150),
            ),
          ],
        ),
      ),
    );
  }
}
