import 'dart:async';

import 'package:lesson_15/network/models/TrainerResponse.dart';
import 'package:lesson_15/repository/trainer_repository.dart';

class TrainerStream {
  var trainerRepository = TrainerRepository();

  final _stateStreamController = StreamController<List<TrainerResponse>>();

  StreamSink<List<TrainerResponse>> get trainerSink =>
      _stateStreamController.sink;

  Stream<List<TrainerResponse>> get trainerStream =>
      _stateStreamController.stream;
}

var trainerStream = TrainerStream();
