import 'dart:convert';

import 'package:formula1_app/model/driver.dart';

class RaceResult {
  String number = "";
  String position = "";
  String points = "";
  Driver driver = Driver.empty();
  String grid = "";
  String laps = "";
  String status = "";
  String time = "";
  String fastestLapRank = "";
  String fastestLapTime = "";
  String avgSpeed = "";

  RaceResult(
      {this.number = '',
      position,
      points,
      driver,
      constructor,
      grid,
      laps,
      status,
      time,
      fastestLapRank,
      fastestLapTime,
      avgSpeed}) {
    this.position = position;
    this.points = points;
    this.driver = driver;
    this.grid = grid;
    this.laps = laps;
    this.status = status;
    this.time = time;
    this.fastestLapRank = fastestLapRank;
    this.fastestLapTime = fastestLapTime;
    this.avgSpeed = avgSpeed;
  }

  RaceResult.empty();
}

class RaceResultList {
  List<RaceResult> resultList = [];
  var results;

  RaceResultList.fromJson(res) {
    res = json.decode(res);
    try {
      results = res["MRData"]["RaceTable"]["Races"][0]["Results"];
    } catch (e) {
      throw StateError("Race results are not ready yet");
    }
    for (var result in results) {
      resultList.add(RaceResult(
        number: result["number"],
        position: result["position"],
        points: result["points"],
        driver: Driver.fromJson(result["Driver"]),
        grid: result["grid"],
        laps: result["laps"],
        status: result["status"],
        time: result["Time"] != null ? result["Time"]["time"] : "Not Finished",
        fastestLapRank: result["FastestLap"] != null
            ? result["FastestLap"]["rank"]
            : "No time",
        fastestLapTime: result["FastestLap"] != null
            ? result["FastestLap"]["Time"]["time"]
            : "No time",
        avgSpeed: result["FastestLap"] != null
            ? result["FastestLap"]["AverageSpeed"]["speed"] + " Km/H"
            : "No time",
      ));
    }
  }
}
