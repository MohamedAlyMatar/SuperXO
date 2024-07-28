import 'package:flutter/material.dart';
import 'package:super_xo/core/customs/my_appbar.dart';
import 'package:super_xo/views/meta_game_view.dart';
import 'package:super_xo/views_model/home_view_model.dart';
import 'package:super_xo/views_model/new_game_view_model.dart';

class NewGameView extends StatelessWidget {
  const NewGameView({super.key});

  @override
  Widget build(BuildContext context) {
    var data = HomeViewModel();
    var data2 = NewGameViewModel();
    return Scaffold(
      appBar: MyAppBar(title: data.title, showBackButton: true),
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
            data.mybutton(data2.offlinePlayers, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MetaGameView()));
            }),
            data.mybutton(data2.VS_AI, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MetaGameView()));
            }),
            data.mybutton(data2.joinRoom, () {}),
          ],
        ),
      ),
    );
  }
}
