class Driver {
  String driverId = "";
  String permanentNumber = "";
  String code = "";
  String givenName = "";
  String familyName = "";
  String nationality = "";

  Driver.empty();

  Driver.fromJson(obj) {
    driverId = obj["driverId"];
    permanentNumber = obj["permanentNumber"];
    code = obj["code"];
    givenName = obj["givenName"];
    familyName = obj["familyName"];
    nationality = obj["nationality"];
  }

  String getName() {
    return "$givenName $familyName";
  }

  Driver(this.driverId, this.permanentNumber, this.code, this.familyName,
      this.givenName, this.nationality);
}

class DriverStandingModel {
  Driver driver;
  String position;
  String points;
  String wins;

  DriverStandingModel(this.driver, this.position, this.points, this.wins);
}
