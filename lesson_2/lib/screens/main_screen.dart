import 'package:flutter/material.dart';
import 'package:lesson_2/utils/my_methods.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: getColorFromHex("#31334A"),
        elevation: 0,
        title: Text("My Wallet"),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("Searching");
              })
        ],
      ),
      body: Container(
        color: getColorFromHex("#31334A"),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              color: Colors.transparent,
              elevation: 8,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/avatar.jpg"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                "Janice butler",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Janice butler",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontSize: 14),
            ),
            Expanded(
              child: GridView.count(
                primary: true,
                padding: EdgeInsets.all(20),
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: getColorFromHex("#01CD98"),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Container(
                     margin: EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("EUR",
                          style: TextStyle(
                            color: Colors.white
                          ),
                          ),
                          Text("EUR",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: getColorFromHex("##5351FC"),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("EUR",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          Text("EUR",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: getColorFromHex("#F64000"),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("EUR",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          Text("EUR",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: getColorFromHex("#F6B900"),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("EUR",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          Text("EUR",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
