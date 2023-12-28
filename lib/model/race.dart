import 'dart:ui';

class Race {
  String id = "";
  String circuitName = "";
  String round = "";
  String title = "";
  String date = "";
  String time = "";
  String city = "";
  String country = "";
  DateTime raceTime = DateTime(DateTime.now().year);
  bool isCompleted = false;
  late Color primaryColor;

  Race(this.id, this.round, this.title, this.date, this.time, this.city,
      this.country) {
    _calculateDate();
  }

  Race.fromJson(race) {
    id = race["Circuit"]["circuitId"];
    circuitName = race["Circuit"]["circuitName"];
    round = race["round"];
    title = race["raceName"];
    date = race["date"];
    time = race["time"];
    city = race["Circuit"]["Location"]["locality"];
    country = race["Circuit"]["Location"]["country"];

    _calculateDate();
  }

  _calculateDate() {
    try {
      raceTime = DateTime.parse("$date $time").toLocal();
      if (raceTime.difference(DateTime.now()) < const Duration(seconds: 1)) {
        isCompleted = true;
      }
    } catch (e) {
      raceTime = DateTime(2018);
      print(e);
    }
  }
}
