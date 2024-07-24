import 'package:flutter/material.dart';
import 'package:super_xo/bloc/room_event.dart';
import 'package:super_xo/core/customs/my_appbar.dart';
import 'package:super_xo/views/create_room_view.dart';
import 'package:super_xo/views_model/home_view_model.dart';
import 'package:super_xo/views/new_game_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var data = HomeViewModel();
    return Scaffold(
      appBar: MyAppBar(title: data.title),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(title: Text(data.about)),
            ListTile(title: Text(data.settings)),
            ListTile(title: Text(data.help)),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data.title,
              style: const TextStyle(fontSize: 45),
            ),
            Container(
              height: 100,
            ),
            data.mybutton(data.resume, () {}),
            data.mybutton(data.newGame, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewGameView()));
            }),
            data.mybutton(data.createRoom, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateRoomScreen()));
            }),
          ],
        ),
      ),
    );
  }
}
