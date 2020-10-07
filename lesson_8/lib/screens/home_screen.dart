import 'package:flutter/material.dart';
import 'package:lesson_8/utils/helper_metods.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldWidgetKey = GlobalKey<ScaffoldState>();
  SnackBar snackbar = SnackBar(
    content: Text('This is snackbar'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        showToast("Undo ! ! !");
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldWidgetKey,
      appBar: AppBar(
        title: Text("Splash"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              scaffoldWidgetKey.currentState.showSnackBar(snackbar);
            },
            tooltip: "Show snackbar",
          ),
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              showToast("Exit");
            },
            tooltip: "Show snackbar",
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'Logout':
                  break;
                case 'Settings':
                  break;
              }
            },
            itemBuilder: (context) {
              return {'Logout', 'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      body: Container(
        color: getColorFromHex("#222222"),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.center,
              overflow: Overflow.visible,
              children: [
                Container(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height/3.5,
                  child: Image.asset(
                    'images/material.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: -50,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage('https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 75,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    "FirstName",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Secular',
                    ),
                  ),
                  Text(
                    "LastName",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Secular',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
