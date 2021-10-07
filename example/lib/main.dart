import 'package:flutter/material.dart';
import 'package:maze/maze.dart';

void main() => runApp(MazeApp());

class MazeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Maze Demo',
        theme: ThemeData(
            primarySwatch: Colors.pink,
            scaffoldBackgroundColor: Colors.white),
        home: MazeScreen());
  }
}

class MazeScreen extends StatefulWidget {
  @override
  _MazeScreenState createState() => _MazeScreenState();
}
int column = 2,row = 2;

class _MazeScreenState extends State<MazeScreen> {
  @override
  Widget build(BuildContext context) {
    print(column);
    return Scaffold(
        body: SafeArea(
            child: Maze(
                player: MazeItem(
                    'https://image.flaticon.com/icons/png/512/808/808433.png',
                    ImageType.network),
                columns: column,
                rows: row,
                wallThickness: 4.0,
                wallColor: Theme.of(context).primaryColor,
                finish: MazeItem(
                    'https://image.flaticon.com/icons/png/512/3328/3328644.png',
                    ImageType.network),
                onFinish: ()=>showAlertDialog(context))));
  }
  showAlertDialog(BuildContext context) {
    // set up the button
    if(column < 11) {
      Widget okButton = TextButton(
        child: Text("Next Mission"),
        onPressed: () async {
          setState(() {
            column += 1;
            row += 1;
          });
          Navigator.of(context, rootNavigator: true).pop('dialog');
          await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MazeApp()),
          );
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Notification"),
        content: Text("You have succeed this mission."),
        actions: [
          okButton,
        ],
      );
      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    } else {
      Widget okButton = TextButton(
        child: Text("Restart"),
        onPressed: () async {
          setState(() {
            column = 2;
            row = 2;
          });
          Navigator.of(context, rootNavigator: true).pop('dialog');
          await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MazeApp()),
          );
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Notification"),
        content: Text("Conguratulation!"
            "You have succeed all missions."),
        actions: [
          okButton,
        ],
      );
      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }
}
