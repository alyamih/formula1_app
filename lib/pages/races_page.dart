import 'package:flutter/material.dart';
import 'package:formula1_app/api.dart';
import 'package:formula1_app/cache.dart';
import 'package:formula1_app/model/race.dart';
import 'package:formula1_app/widgets/bottom_nav_bar.dart';
import 'package:formula1_app/widgets/race_list_tile.dart';
import 'dart:convert';

import 'package:formula1_app/widgets/search_widget.dart';

class RacesPage extends StatefulWidget {
  const RacesPage({super.key});

  @override
  State<RacesPage> createState() => _RacesPageState();
}

class _RacesPageState extends State<RacesPage> {
  List<Race> raceList = [];
  late Race closestRace;
  bool isLoading = true;
  final int _year = DateTime.now().year;

  @override
  initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var cache = CacheHelper();
      cache.readRaceCache().then((value) {
        if (value != null) {
          instantiateRaces(value["data"]);
        } else {
          getRaces();
        }
      }).catchError((onError) {
        getRaces();
      });
    });
  }

  instantiateRaces(res) {
    res = json.decode(res);
    var races = res["MRData"]["RaceTable"]["Races"];
    for (var race in races) {
      Race race1 = Race.fromJson(race);
      if (!race1.isCompleted && isLoading) {
        setState(() {
          closestRace = race1;
          isLoading = false;
        });
      }
      raceList.add(race1);
      setState(() {});
    }
  }

  getRaces() async {
    Api.getRacesByYear(_year).then((value) => instantiateRaces(value));
  }

  void _handleRaceTap(Race race) {
    setState(() {
      closestRace = race;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getOtherRaces(),
      ],
    );
  }

  Widget getOtherRaces() {
    String searchText = '';
    return StatefulBuilder(builder: (context, setState) {
      List<Widget> list = [];
      List<Race> races = raceList
          .where((element) =>
              element.city.contains(searchText) ||
              element.city.toLowerCase().contains(searchText))
          .toList();
      list.add(
        Container(
          height: 250,
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Welcome back!',
                style: TextStyle(
                  fontFamily: 'Srbija Sans',
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SearchWidget(
              callback: (value) {
                searchText = value;
                setState(() {});
              },
            )
          ]),
        ),
      );
      list.add(const Padding(
        padding: EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Other Matches',
              style: TextStyle(
                  fontFamily: 'Srbija Sans',
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ],
        ),
      ));
      for (var race in races) {
        if (race.raceTime.day == DateTime.now().day &&
            race.raceTime.month == DateTime.now().month &&
            race.raceTime.year == DateTime.now().year) {
          list.add(const Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'New Matches',
                  style: TextStyle(
                      fontFamily: 'Srbija Sans',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ],
            ),
          ));
          list.add(RaceListTile(
            todayMatch: true,
            race: raceList.first,
          ));
        }
      }
      for (var race in races) {
        list.add(RaceListTile(
          todayMatch: false,
          race: race,
        ));
      }
      return Column(
        children: list,
      );
    });
  }
}
