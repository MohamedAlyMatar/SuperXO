import 'package:flutter/material.dart';

class HomeViewModel {
  String title = 'SuperXO';
  String newGame = 'New Game';
  String createRoom = 'Create Room';
  String resume = 'Resume';
  String about = 'About';
  String settings = 'Settings';
  String help = 'Help';

  Widget mybutton(String text, VoidCallback onpressed) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
            onPressed: onpressed,
            style: ButtonStyle(
                // fixedSize: WidgetStateProperty.all(Size(200, 50)),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                backgroundColor: WidgetStateProperty.all(Colors.black)),
            child: Text(
              text,
              style: const TextStyle(fontSize: 20),
            )));
  }
}
