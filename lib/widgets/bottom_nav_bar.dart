import 'package:flutter/material.dart';
import 'package:formula1_app/pages/home_page.dart';
import 'package:formula1_app/pages/races_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar(
      {super.key, required this.callBack, this.fromCocktailPage = false});
  final VoidCallback callBack;
  final bool fromCocktailPage;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black,
          border:
              Border(top: BorderSide(color: Colors.white.withOpacity(0.5)))),
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              page = ESelectedPage.mainPage;

              widget.callBack();
              setState(() {});
            },
            child: SizedBox(
                height: 50,
                width: 50,
                child: page == ESelectedPage.mainPage
                    ? Image.asset(
                        'assets/races2.png',
                      )
                    : Image.asset(
                        'assets/races.png',
                      )),
          ),
          InkWell(
            onTap: () {
              page = ESelectedPage.notesPage;

              widget.callBack();
              setState(() {});
            },
            child: SizedBox(
                height: 50,
                width: 50,
                child: page == ESelectedPage.notesPage
                    ? Image.asset(
                        'assets/notes2.png',
                      )
                    : Image.asset(
                        'assets/notes.png',
                      )),
          ),
          InkWell(
            onTap: () {
              page = ESelectedPage.newsPage;
              widget.callBack();

              setState(() {});
            },
            child: SizedBox(
                height: 50,
                width: 50,
                child: page == ESelectedPage.newsPage
                    ? Image.asset(
                        'assets/news2.png',
                      )
                    : Image.asset(
                        'assets/news.png',
                      )),
          ),
          InkWell(
            onTap: () {
              page = ESelectedPage.profilePage;
              widget.callBack();
              setState(() {});
            },
            child: SizedBox(
                height: 50,
                width: 50,
                child: page == ESelectedPage.profilePage
                    ? Image.asset(
                        'assets/profile2.png',
                      )
                    : Image.asset(
                        'assets/profile.png',
                      )),
          ),
          InkWell(
            onTap: () {
              page = ESelectedPage.settingsPage;
              widget.callBack();

              setState(() {});
            },
            child: SizedBox(
                height: 50,
                width: 50,
                child: page == ESelectedPage.settingsPage
                    ? Image.asset(
                        'assets/settings2.png',
                      )
                    : Image.asset(
                        'assets/settings.png',
                      )),
          ),
        ],
      ),
    );
  }
}
