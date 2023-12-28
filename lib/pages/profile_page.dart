import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formula1_app/api.dart';
import 'package:formula1_app/model/constructor.dart';
import 'package:formula1_app/model/user.dart';
import 'package:formula1_app/widgets/race_list_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserItem user = UserItem();
  TextEditingController textControllerUserName = TextEditingController();
  List<Constructor> constructorsList = [];
  List<Constructor> favoriteConstructorList = [];
  final int _year = DateTime.now().year;
  final childKeyTab1 = GlobalKey();
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
  @override
  void initState() {
    super.initState();
    getConstructorStandings();
    getSP();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/back.png',
                ),
              )),
            ),
            Positioned(
              right: 20,
              top: 70,
              child: InkWell(
                onTap: () {
                  if (user.name != null) {
                    textControllerUserName.text = user.name!;
                  }
                  showDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                            content: Card(
                              // color: Provider.of<ThemeProvider>(context)
                              //             .currentTheme ==
                              //         ThemeClass.lightTheme
                              //     ? Colors.white
                              //     : const Color(0xFF0A1A35),
                              color: Colors.transparent,
                              elevation: 0.0,
                              child: Column(children: [
                                const Text('Enter your nickname',
                                    style: TextStyle(
                                        fontFamily: 'SrbijaSans-Regular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15)),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    style: const TextStyle(
                                        fontFamily: 'SrbijaSans-Regular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                    controller: textControllerUserName,
                                    decoration: const InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            borderSide: BorderSide(width: 1)),
                                        label: Text('Nickname ',
                                            style: TextStyle(
                                                fontFamily:
                                                    'SrbijaSans-Regular',
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500))),
                                  ),
                                ),
                              ]),
                            ),
                            actions: [
                              Card(
                                color: Colors.transparent,
                                elevation: 0.0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 14),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Cancel',
                                              style: TextStyle(
                                                  fontFamily:
                                                      'SrbijaSans-Regular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15))),
                                      InkWell(
                                          onTap: () {
                                            user.name =
                                                textControllerUserName.text;
                                            addToSP(
                                                favoriteConstructorList, user);
                                            setState(() {});
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Save',
                                              style: TextStyle(
                                                  fontFamily:
                                                      'SrbijaSans-Regular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15)))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ));
                },
                child: const Text(
                  'Edit',
                  style: TextStyle(
                      fontFamily: 'SrbijaSans-Regular',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 88,
                  width: 88,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/car_12.png'))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    user.name != null && user.name!.isNotEmpty
                        ? user.name!
                        : 'Username',
                    style: const TextStyle(
                        fontFamily: 'SrbijaSans-Regular',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                )
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Favorite Teams',
                style: TextStyle(
                    fontFamily: 'SrbijaSans-Regular',
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        shape:
                            const ContinuousRectangleBorder(side: BorderSide()),
                        backgroundColor: Colors.black,
                        context: context,
                        constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height),
                        builder: (context) {
                          return FractionallySizedBox(
                            heightFactor: 0.9,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: SingleChildScrollView(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        'Teams',
                                        style: TextStyle(
                                            fontFamily: 'SrbijaSans-Regular',
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                    ),
                                    getConstructors(),
                                  ],
                                ),
                              )),
                            ),
                          );
                        });
                  },
                  child: Image.asset('assets/Edit3.png'))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: getFavoriteConstructors(),
        ),
      ],
    );
  }

  Widget getConstructors() {
    List<Widget> list = [];
    for (var constructions in constructorsList) {
      list.add(Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.5)),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(imageList[
                                    Random().nextInt(imageList.length)]))),
                      ),
                      if (favoriteConstructorList
                          .where((element) =>
                              element.constructorId ==
                              constructions.constructorId)
                          .isNotEmpty)
                        const Positioned(
                          bottom: -8,
                          right: -5,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        )
                    ],
                  ),
                ),
                Text(
                  constructions.name,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            InkWell(
                onTap: () {
                  if (favoriteConstructorList
                      .where((element) =>
                          element.constructorId == constructions.constructorId)
                      .isNotEmpty) {
                    constructions.isFavorite = false;
                    favoriteConstructorList.removeWhere((element) =>
                        element.constructorId == constructions.constructorId);
                  } else {
                    constructions.isFavorite = true;
                    favoriteConstructorList.add(constructions);
                  }
                  Navigator.pop(context);
                  addToSP(favoriteConstructorList, user);
                  setState(() {});
                },
                child: Text(
                  favoriteConstructorList
                          .where((element) =>
                              element.constructorId ==
                              constructions.constructorId)
                          .isNotEmpty
                      ? 'Remove from favorite'
                      : 'Add to favorite',
                  style: const TextStyle(
                      fontFamily: 'SrbijaSans-Regular',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ))
          ],
        ),
      ));
    }
    return Column(
      children: list,
    );
  }

  Widget getFavoriteConstructors() {
    List<Widget> list = [];
    for (var constructions in favoriteConstructorList) {
      list.add(Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.5)),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(imageList[
                                Random().nextInt(imageList.length)]))),
                  ),
                ),
                Text(
                  constructions.name,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                if (favoriteConstructorList
                    .where((element) => element == constructions)
                    .isNotEmpty) {
                  constructions.isFavorite = false;
                  favoriteConstructorList.remove(constructions);
                } else {
                  constructions.isFavorite = true;
                  favoriteConstructorList.add(constructions);
                }
                setState(() {});
                addToSP(favoriteConstructorList, user);
              },
              child: Icon(
                favoriteConstructorList
                        .where((element) => element == constructions)
                        .isNotEmpty
                    ? Icons.favorite
                    : Icons.favorite_outline,
                color: Colors.red,
              ),
            )
          ],
        ),
      ));
    }
    return Column(
      children: list,
    );
  }

  getConstructorStandings() async {
    var res = await Api.getConstructorsStandings(_year);
    var response = json.decode(res);
    List<Constructor> constructionList = [];

    var standings = response["MRData"]["ConstructorTable"];

    var constructor = standings["Constructors"];

    for (var ctor in constructor) {
      constructionList.add(
        Constructor.fromJson(ctor),
      );
    }

    setState(() {
      constructorsList = constructionList;
    });
  }

  Future<void> addToSP(List<Constructor>? favorites, UserItem? user) async {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.clear();

    if (favorites != null) {
      prefs.setString('favorites', jsonEncode(favorites));
    }
    if (user != null) {
      prefs.setString('user', jsonEncode(user));
    }
  }

  void getSP() async {
    final prefs = await SharedPreferences.getInstance();

    final List<dynamic> jsonData1 =
        jsonDecode(prefs.getString('favorites') ?? '[]');

    favoriteConstructorList = jsonData1.map<Constructor>((jsonList) {
      {
        return Constructor.fromJson(jsonList);
      }
    }).toList();
    if (prefs.getString('user') != null) {
      Map<String, dynamic> userMap = jsonDecode(prefs.getString('user')!);
      user = UserItem.fromJson(userMap);
    }
    setState(() {});
  }
}
