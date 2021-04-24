import 'package:flutter/material.dart';
import 'package:lesson_12/db/db_user.dart';
import 'package:lesson_12/models/user_data.dart';

class CrudDbScreen extends StatefulWidget {
  @override
  _CrudDbScreenState createState() => _CrudDbScreenState();
}

class _CrudDbScreenState extends State<CrudDbScreen> {
  List<User> users = [];

  TextEditingController usernameController = new TextEditingController();
  TextEditingController numberController = new TextEditingController();

  bool usernameValidate = false;
  bool numberValidate = false;

  @override
  void initState() {
    super.initState();
    DatabaseHelperUser.instance.getAllUsers().then((value) {
      setState(() {
        users.clear();
        users.add(User(id: 0,name: "Sardor",number: "+998936547896"));
        users.addAll(value);
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DB-CRUD"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddDialog(context);
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: users.length,
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
                      Padding(padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: Text("${users[index].id} ${users[index].name}"),
                      ),
                      Padding(padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: Text("${users[index].number}"),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: GestureDetector(onTap: () {
                          showEditDialog(context,users[index],index);
                        },
                          child: Icon(Icons.edit, color: Colors.green,),),
                      ),
                      Padding(padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: GestureDetector(onTap: () {
                            showDeleteDialog(context,users[index].id,index);
                        },
                          child: Icon(Icons.delete, color: Colors.red,),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure ?'),
                TextField(
                  controller: usernameController..text = '',
                  decoration: InputDecoration(
                    hintText: 'Enter your name ',
                    errorText: usernameValidate ? 'Please enter name' : null,
                  ),
                ),
                TextField(
                  controller: numberController..text = '',
                  decoration: InputDecoration(
                    hintText: 'Enter your number ',
                    errorText: numberValidate ? 'Please enter number' : null,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                if (usernameController.text.isEmpty) {
                  setState(() {
                    usernameValidate = false;
                  });
                } else if (numberController.text.isEmpty) {
                  setState(() {
                    numberValidate = false;
                  });
                } else {
                  var insertUser = DatabaseHelperUser.instance.insertUser(User(
                      name: usernameController.text,
                      number: numberController.text));
                  insertUser.then((value) {
                    print("added: ${value}");
                    setState(() {
                      users.add(User(
                          id: value,
                          name: usernameController.text,
                          number: numberController.text));
                    });
                    Navigator.of(context).pop();
                  });
                }
              },
            ),
          ],
        );
      },
    );
  }

  void showDeleteDialog(BuildContext context, int id, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure ?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                DatabaseHelperUser.instance.deleteUser(id).then((value) {
                  print("deletelaDd: ${value}");
                  setState(() {
                    users.removeAt(index);
                  });
                });

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showEditDialog(BuildContext context, User userX, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure ?'),
                TextField(
                  controller: usernameController..text = userX.name,
                  decoration: InputDecoration(hintText: 'Enter your name '),
                ),
                TextField(
                  controller: numberController..text = userX.number,
                  decoration: InputDecoration(hintText: 'Enter your number '),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                if (usernameController.text.isEmpty) {
                  setState(() {
                    usernameValidate = false;
                  });
                } else if (numberController.text.isEmpty) {
                  setState(() {
                    numberValidate = false;
                  });
                } else {
                  DatabaseHelperUser.instance
                      .updateUser(User(
                      id: userX.id,
                      name: usernameController.text,
                      number: numberController.text))
                      .then((value) => {
                    setState(() {
                      users[index] = User(
                          id: userX.id,
                          name: usernameController.text,
                          number: numberController.text);
                    })
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

}
