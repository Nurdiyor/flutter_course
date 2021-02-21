import 'package:flutter/material.dart';
import 'package:lesson_10/models/UserData.dart';

class ListViewScreen extends StatefulWidget {
  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<UserData> usersList = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    addUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview CRUD"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddDialog(context);
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: usersList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: EdgeInsets.all(8),
              child: Container(
                margin: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          usersList[index].name,
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          usersList[index].number,
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showEditDialog(context, usersList[index],index);
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        GestureDetector(
                          onTap: (){
                            showDeleteDialog(context, index);
                          },
                          child: Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  void showAddDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Add new user"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("Are you sure !"),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(hintText: 'Enter name'),
                  ),
                  TextField(
                    controller: numberController,
                    decoration: InputDecoration(hintText: 'Enter number'),
                  ),
                ],
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("No"),
              ),
              FlatButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty) {
                    if (numberController.text.isNotEmpty) {
                      setState(() {
                        usersList.add(UserData(
                            nameController.text, numberController.text));
                      });
                      Navigator.of(context).pop();
                    } else {
                      print("Enter number");
                    }
                  } else {
                    print("Enter name");
                  }
                },
                child: Text("Yes"),
              ),
            ],
          );
        });
  }
  void showEditDialog(BuildContext context, UserData data, int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Edit new user"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("Are you sure !"),
                  TextField(
                    controller: nameController..text = data.name,
                    decoration: InputDecoration(hintText: 'Enter name'),
                  ),
                  TextField(
                    controller: numberController..text = data.number,
                    decoration: InputDecoration(hintText: 'Enter number'),
                  ),
                ],
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("No"),
              ),
              FlatButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty) {
                    if (numberController.text.isNotEmpty) {
                      setState(() {
                        usersList.insert(
                            index,
                            UserData(
                                nameController.text, numberController.text));
                      });
                      Navigator.of(context).pop();
                    } else {
                      print("Enter number");
                    }
                  } else {
                    print("Enter name");
                  }
                },
                child: Text("Yes"),
              ),
            ],
          );
        });
  }
  void showDeleteDialog(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Delete current user"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("Are you sure !"),
                ],
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("No"),
              ),
              FlatButton(
                onPressed: () {
                 setState(() {
                   usersList.removeAt(index);
                 });
                 Navigator.of(context).pop();
                },
                child: Text("Yes"),
              ),
            ],
          );
        });
  }

  void addUsers() {
    usersList.add(UserData("Karim", "+999511515551"));
    usersList.add(UserData("Yulduz", "+999511515551"));
    usersList.add(UserData("Ikrom", "+999511515551"));
    usersList.add(UserData("Xanifa", "+999511515551"));
    usersList.add(UserData("Munis", "+999511515551"));
  }
}
