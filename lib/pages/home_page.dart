import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formula1_app/model/notes.dart';
import 'package:formula1_app/pages/news_page.dart';
import 'package:formula1_app/pages/notes_page.dart';
import 'package:formula1_app/pages/profile_page.dart';
import 'package:formula1_app/pages/races_page.dart';
import 'package:formula1_app/pages/settings_page.dart';
import 'package:formula1_app/widgets/bottom_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ESelectedPage {
  mainPage,
  profilePage,
  notesPage,
  newsPage,
  settingsPage,
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

ESelectedPage page = ESelectedPage.mainPage;

class _HomePageState extends State<HomePage> {
  List<Notes> list = [];
  TextEditingController textControllerTitle = TextEditingController();
  TextEditingController textControllerNoteText = TextEditingController();
  @override
  void initState() {
    super.initState();
    getSP();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  getContent(),
                ],
              ),
            ),
          ),
          Column(
            children: [
              if (page == ESelectedPage.notesPage)
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                              content: Card(
                                color: Colors.transparent,
                                elevation: 0.0,
                                child: Column(children: [
                                  const Text('Enter new note',
                                      style: TextStyle(
                                          fontFamily: 'HK Grotesk',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15)),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      style: const TextStyle(
                                          fontFamily: 'Srbija Sans',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                      controller: textControllerTitle,
                                      decoration: const InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              borderSide: BorderSide(width: 1)),
                                          label: Text('Title ',
                                              style: TextStyle(
                                                  fontFamily: 'HK Grotesk',
                                                  color: Colors.black,
                                                  fontWeight:
                                                      FontWeight.w500))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      style: const TextStyle(
                                          fontFamily: 'Srbija Sans',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                      controller: textControllerNoteText,
                                      decoration: const InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              borderSide: BorderSide(width: 1)),
                                          label: Text('Text',
                                              style: TextStyle(
                                                  fontFamily: 'HK Grotesk',
                                                  color: Colors.black,
                                                  fontWeight:
                                                      FontWeight.w500))),
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
                                                    fontFamily: 'HK Grotesk',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15))),
                                        InkWell(
                                            onTap: () {
                                              Notes notes = Notes();
                                              notes.title =
                                                  textControllerTitle.text;
                                              notes.text =
                                                  textControllerNoteText.text;
                                              list.add(notes);
                                              setState(() {});
                                              addToSP(list);
                                              Navigator.pop(context);
                                              textControllerTitle.text = '';
                                              textControllerNoteText.text = '';
                                            },
                                            child: const Text('Save',
                                                style: TextStyle(
                                                    fontFamily: 'HK Grotesk',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15)))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                        ),
                        const Icon(Icons.add)
                      ],
                    ),
                  ),
                ),
              BottomNavBar(callBack: () {
                setState(() {});
              }),
            ],
          )
        ],
      ),
    );
  }

  Widget getContent() {
    if (page == ESelectedPage.mainPage) {
      return const RacesPage();
    } else if (page == ESelectedPage.settingsPage) {
      return const SettingsPage();
    } else if (page == ESelectedPage.profilePage) {
      return const ProfilePage();
    } else if (page == ESelectedPage.newsPage) {
      return const NewsPage();
    } else if (page == ESelectedPage.notesPage) {
      return NotesPage(
        callBackEdit: (note) {
          list.remove(note);
          Notes notes = Notes();
          notes.text = note.text;
          notes.title = note.title;
          list.add(notes);
          addToSP(list);
        },
        callBack: (note) {
          list.remove(note);
          addToSP(list);
          setState(() {});
        },
        list: list,
      );
    } else {
      return const SizedBox();
    }
  }

  Future<void> addToSP(
    List<Notes>? notes,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.clear();

    if (notes != null) {
      prefs.setString('notes', jsonEncode(notes));
    }
  }

  void getSP() async {
    final prefs = await SharedPreferences.getInstance();

    final List<dynamic> jsonData = jsonDecode(prefs.getString('notes') ?? '[]');

    list = jsonData.map<Notes>((jsonList) {
      {
        return Notes.fromJson(jsonList);
      }
    }).toList();
    setState(() {});
  }
}
