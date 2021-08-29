import 'package:flutter/material.dart';
import 'package:lesson_15/network/models/TrainerResponse.dart';
import 'package:lesson_15/stream/trainer_stream.dart';

class MyListItem extends StatelessWidget {
    TrainerResponse trainer;

    MyListItem(this.trainer);
    TextEditingController trainerNameController = new TextEditingController();
    TextEditingController trainerSurnameController = new TextEditingController();
    TextEditingController trainerSalaryController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Container(
        margin: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8),
                  child: Text(trainer.trainerName ?? ""),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(trainer.trainerSurname ?? ""),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8),
                  child: GestureDetector(
                    child: Icon(
                      Icons.edit,
                      color: Colors.green,
                    ),
                    onTap: () {
                      showEditDialog(context, trainer);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onTap: () {
                      trainerStream.trainerRepository.deleteTrainer(trainer.id).then(
                              (value) => trainerStream.trainerRepository
                              .getTrainersList()
                              .then((trainerList) =>
                              trainerStream.trainerSink.add(trainerList)));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

    void showEditDialog(BuildContext context, TrainerResponse response) {
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
                    controller: trainerNameController..text = response.trainerName,
                    decoration: InputDecoration(
                      hintText: 'Enter your name ',
//                    errorText: trainerNameController.text.isEmpty
//                        ? 'Please enter name'
//                        : null,
                    ),
                  ),
                  TextField(
                    controller: trainerSurnameController
                      ..text = response.trainerSurname,
                    decoration: InputDecoration(
                      hintText: 'Enter your number ',
//                    errorText: trainerSurnameController.text.isEmpty
//                        ? 'Please enter surname'
//                        : null,
                    ),
                  ),
                  TextField(
                    controller: trainerSalaryController
                      ..text = "${response.trainerSalary}",
                    decoration: InputDecoration(
                      hintText: 'Enter your money ',
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
                      .updateTrainer(TrainerResponse(
                      id: response.id,
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
