import 'dart:convert';

import 'package:http_logger/http_logger.dart';
import 'package:http_middleware/http_middleware.dart';
import 'package:lesson_15/network/models/TrainerResponse.dart';

class TrainerRepository {
  String BASE_URL = "https://microstar.herokuapp.com/api";
  static const headers = {"Content-Type": "application/json"};

  Future<List<TrainerResponse>> getTrainersList() async {
    HttpWithMiddleware httpClient = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.HEADERS),
      HttpLogger(logLevel: LogLevel.BODY),
    ]);
    try {
      final response = await httpClient.get(BASE_URL + "/trainer");
      if (response.statusCode == 200) {
        var listFromJson =
            TrainerResponse.listFromJson(json.decode(response.body));
        return listFromJson;
      } else {
        return List();
      }
    } catch (exception) {
      print("No internet connection $exception");
      return List();
    }
  }

  Future<TrainerResponse> addTrainer(TrainerResponse trainer) async {
    HttpWithMiddleware httpClient = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.HEADERS),
      HttpLogger(logLevel: LogLevel.BODY),
    ]);
    try {
      final response = await httpClient.post(BASE_URL + "/trainer",
          body: json.encode(trainer.toJson()), headers: headers);
      if (response.statusCode == 200) {
        var listFromJson = TrainerResponse.fromJson(json.decode(response.body));
        return listFromJson;
      } else {
        return TrainerResponse();
      }
    } catch (exception) {
      print("No internet connection $exception");
      return TrainerResponse();
    }
  }

  Future<TrainerResponse> updateTrainer(TrainerResponse trainer) async {
    HttpWithMiddleware httpClient = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.HEADERS),
      HttpLogger(logLevel: LogLevel.BODY),
    ]);
    try {
      final response = await httpClient.put(BASE_URL + "/trainer/${trainer.id}",
          body: json.encode(trainer.toJson()), headers: headers);
      if (response.statusCode == 200) {
        var listFromJson = TrainerResponse.fromJson(json.decode(response.body));
        return listFromJson;
      } else {
        return TrainerResponse();
      }
    } catch (exception) {
      print("No internet connection $exception");
      return TrainerResponse();
    }
  }

  Future<TrainerResponse> deleteTrainer(int id) async {
    HttpWithMiddleware httpClient = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.HEADERS),
      HttpLogger(logLevel: LogLevel.BODY),
    ]);
    try {
      final response = await httpClient.delete(BASE_URL + "/trainer/${id}",
          headers: headers);
      if (response.statusCode == 200) {
        var listFromJson = TrainerResponse.fromJson(
          json.decode(response.body),
        );
        return listFromJson;
      } else {
        return TrainerResponse();
      }
    } catch (exception) {
      print("No internet connection $exception");
      return TrainerResponse();
    }
  }
}
