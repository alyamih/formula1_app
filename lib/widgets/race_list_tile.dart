import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dash_flags/dash_flags.dart';
import 'package:flutter/material.dart';
import 'package:formula1_app/api.dart';
import 'package:formula1_app/model/driver.dart';

import 'package:formula1_app/model/race.dart';
import 'package:formula1_app/model/race_result.dart';
import 'package:formula1_app/widgets/country_code.dart';

class RaceListTile extends StatefulWidget {
  const RaceListTile({
    super.key,
    required this.race,
    required this.todayMatch,
  });

  final Race race;
  final bool todayMatch;

  @override
  _RaceListTileState createState() => _RaceListTileState();
}

class _RaceListTileState extends State<RaceListTile> {
  Duration countDown = const Duration();
  String _days = "";
  String time = '';
  Driver driver = Driver.empty();
  List<String> imageList = [
    'assets/car_1.jpg',
    'assets/car_2.jpg',
    'assets/car_3.jpg',
    'assets/car_4.jpg',
    'assets/car_5.jpg',
    'assets/car_6.jpg',
    'assets/car_7.jpg',
    'assets/car_8.jpg',
    'assets/car_9.jpg',
    'assets/car_10.jpg',
    'assets/car_11.jpg',
    'assets/car_12.png',
    'assets/car_13.jpg',
    'assets/car_14.jpg',
    'assets/car_15.jpg',
    'assets/car_16.jpg',
    'assets/car_17.jpg',
    'assets/car_18.jpg',
    'assets/car_19.jpg',
  ];

  void _calculateRemainingDays() {
    if (!mounted) return;
    setState(() {
      countDown =
          widget.race.raceTime.toUtc().difference(DateTime.now().toUtc()).abs();
      _days = countDown.inDays.toString();
    });
  }

  @override
  initState() {
    super.initState();
    _calculateRemainingDays();
    Api.getRaceResultsByRound(
            widget.race.raceTime.year.toString(), widget.race.round)
        .then((res) {
      RaceResultList result = RaceResultList.fromJson(res);
      driver = result.resultList.first.driver;
      time = result.resultList.first.time;
      setState(() {});
    }).catchError((onError) {
      // _snackBar(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: widget.todayMatch
              ? const EdgeInsets.fromLTRB(15, 15, 15, 30)
              : const EdgeInsets.all(15),
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      MaterialLocalizations.of(context)
                          .formatCompactDate(widget.race.raceTime.toLocal()),
                      style: TextStyle(
                          fontFamily: 'Srbija Sans',
                          color: Colors.white.withOpacity(0.4),
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    Row(
                      children: [
                        Text(
                          widget.race.city,
                          style: TextStyle(
                              fontFamily: 'Srbija Sans',
                              color: Colors.white.withOpacity(0.4),
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        if (widget.todayMatch)
                          Image.asset(
                            'assets/ArrowDown.png',
                            color: Colors.white.withOpacity(0.7),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  // if (widget.todayMatch)
                  getImage(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Image.asset('assets/first_place.png'),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Flexible(
                                      child: Text(
                                        '${driver.givenName} ${driver.familyName}',
                                        style: const TextStyle(
                                            fontFamily: 'Srbija Sans',
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (driver.nationality.isNotEmpty)
                                Container(
                                  margin: const EdgeInsets.only(right: 8.0),
                                  width: 24,
                                  height: 24,
                                  child: CountryFlag(
                                      country: Country.fromCode(
                                          CountryCodeByString.getCode(
                                              driver.nationality))),
                                ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset('assets/Time.png'),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              time,
                              style: const TextStyle(
                                  fontFamily: 'Srbija Sans',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (widget.todayMatch)
          Positioned(
            bottom: -10,
            child: Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2)),
              child: Image.asset('assets/ArrowDown.png'),
            ),
          ),
      ],
    );
  }

  Driver getDriver(RaceResultList result) {
    return result.resultList.first.driver;
  }

  Widget getImage() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            image: DecorationImage(
                fit: BoxFit.cover,
                image:
                    AssetImage(imageList[Random().nextInt(imageList.length)]))),
      ),
    );
  }
}
