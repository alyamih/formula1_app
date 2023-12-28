import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formula1_app/model/notes.dart';

class NotesPage extends StatefulWidget {
  const NotesPage(
      {super.key,
      required this.list,
      required this.callBack,
      required this.callBackEdit});
  final List<Notes> list;
  final Function(Notes) callBack;
  final Function(Notes) callBackEdit;

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  TextEditingController textControllerTitle = TextEditingController();
  TextEditingController textControllerNoteText = TextEditingController();
  List<Notes> notes = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 60, 18, 0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Notes',
                    style: TextStyle(
                        fontFamily: 'Srbija Sans',
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 20)),
              ],
            ),
          ),
          getNotes()
        ],
      ),
    );
  }

  Widget getNotes() {
    List<Widget> list = [];
    for (var note in widget.list) {
      list.add(InkWell(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width / 2 - 60,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: const Color(0xFF7f0000),
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            widget.callBack(note);
                          },
                          child: Image.asset('assets/Trash.png')),
                      InkWell(
                          onTap: () {
                            textControllerNoteText.text = note.text!;
                            textControllerTitle.text = note.title!;
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
                                          const Text('Enter new note',
                                              style: TextStyle(
                                                  fontFamily: 'Srbija Sans',
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
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black,
                                                        width: 1.0),
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                      borderSide:
                                                          BorderSide(width: 1)),
                                                  label: Text('Title ',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Srbija Sans',
                                                          color: Colors.black,
                                                          fontWeight: FontWeight
                                                              .w500))),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextField(
                                              style: const TextStyle(
                                                  fontFamily: 'Srbija Sans',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                              controller:
                                                  textControllerNoteText,
                                              decoration: const InputDecoration(
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black,
                                                        width: 1.0),
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                      borderSide:
                                                          BorderSide(width: 1)),
                                                  label: Text('Text',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Srbija Sans',
                                                          color: Colors.black,
                                                          fontWeight: FontWeight
                                                              .w500))),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('Cancel',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Srbija Sans',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 15))),
                                                InkWell(
                                                    onTap: () {
                                                      note.title =
                                                          textControllerTitle
                                                              .text;
                                                      note.text =
                                                          textControllerNoteText
                                                              .text;
                                                      widget.callBackEdit(note);
                                                      setState(() {});
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('Save',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Srbija Sans',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 15)))
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ));
                          },
                          child: Image.asset('assets/Edit3.png'))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    note.title!,
                    style: const TextStyle(
                        fontFamily: 'Srbija Sans',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
                Text(
                  note.text!,
                  style: const TextStyle(
                      fontFamily: 'Srbija Sans',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ],
            ),
          )));
    }
    return Wrap(
      spacing: 40,
      runSpacing: 20,
      children: list,
    );
  }
}
