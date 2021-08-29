import 'package:flutter/material.dart';
import 'package:lesson_15/network/models/TrainerResponse.dart';
import 'package:lesson_15/pages/my_list_item.dart';
import 'package:lesson_15/stream/trainer_stream.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController trainerNameController = new TextEditingController();
  TextEditingController trainerSurnameController = new TextEditingController();
  TextEditingController trainerSalaryController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    getAllTrainers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest api"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showAddDialog(context);
        },
        label: Text("Add"),
        icon: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        child: StreamBuilder<List<TrainerResponse>>(
          stream: trainerStream.trainerStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length == 0) {
                return error(snapshot.error);
              }
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return MyListItem(snapshot.data[index]);
                },
              );
            } else if (snapshot.hasError) {
              return error(snapshot.error);
            } else {
              return loading();
            }
          },
        ),
      ),
    );
  }

  void getAllTrainers() {
    trainerStream.trainerRepository.getTrainersList().then(
            (trainerResponseList) =>
            trainerStream.trainerSink.add(trainerResponseList));
  }

  Widget error(String error) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            error ?? "",
            style: TextStyle(color: Colors.red, fontSize: 24),
          ),
          RaisedButton(
            onPressed: () {
              trainerStream.trainerRepository.getTrainersList().then(
                  (trainerResponseList) =>
                      trainerStream.trainerSink.add(trainerResponseList));
            },
            child: Text("Try again"),
          ),
        ],
      ),
    );
  }

  Widget loading() {
    return Center(
      child: Container(
        color: Colors.transparent,
        child: Center(
          child: Loading(
              indicator: BallSpinFadeLoaderIndicator(),
              size: 200.0,
              color: Colors.blue),
        ),
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
                  controller: trainerNameController..text = '',
                  decoration: InputDecoration(
                    hintText: 'Enter your name ',
//                    errorText: trainerNameController.text.isEmpty
//                        ? 'Please enter name'
//                        : null,
                  ),
                ),
                TextField(
                  controller: trainerSurnameController..text = '',
                  decoration: InputDecoration(
                    hintText: 'Enter your surname ',
//                    errorText: trainerSurnameController.text.isEmpty
//                        ? 'Please enter surname'
//                        : null,
                  ),
                ),
                TextField(
                  controller: trainerSalaryController..text = '',
                  decoration: InputDecoration(
                    hintText: 'Enter your salary ',
//                    errorText: trainerSalaryController.text.isEmpty
//                        ? 'Please enter salary'
//                        : null,
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
                trainerStream.trainerRepository
                    .addTrainer(TrainerResponse(
                    trainerName: trainerNameController.text.toString(),
                    trainerSurname:
                    trainerSurnameController.text.toString(),
                    trainerSalary: double.parse(
                        trainerSalaryController.text.toString())))
                    .then((value) {
                  trainerStream.trainerRepository.getTrainersList().then(
                          (trainerList) =>
                          trainerStream.trainerSink.add(trainerList));
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
