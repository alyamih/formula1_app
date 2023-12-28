import 'package:flutter/material.dart';
import 'package:formula1_app/pages/show_screen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return getContent();
  }

  Widget getContent() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(18, 60, 18, 0),
        child: Column(children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Settings',
                  style: TextStyle(
                      fontFamily: 'Srbija Sans',
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 20)),
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const ReadTermsOrPrivacyScreenView(
                              link: 'google.com',
                            )),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.white.withOpacity(0.5)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/privacy.png',
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text('Privacy Policy',
                                style: TextStyle(
                                    fontFamily: 'Srbija Sans',
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                      Image.asset('assets/ArrowRight.png')
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const ReadTermsOrPrivacyScreenView(
                              link: 'google.com',
                            )),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.white.withOpacity(0.5)))),
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/terms.png',
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text('Terms of Use',
                                style: TextStyle(
                                    fontFamily: 'Srbija Sans',
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          )
                        ],
                      ),
                      Image.asset('assets/ArrowRight.png')
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // page = ESelectedPage.ratePage;
                  // setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.white.withOpacity(0.5)))),
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/Notification.png',
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text('Notification',
                                style: TextStyle(
                                    fontFamily: 'Srbija Sans',
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          )
                        ],
                      ),
                      Image.asset('assets/ArrowRight.png')
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // page = ESelectedPage.policyPage;
                  // setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/share.png',
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text('Share with friends',
                                style: TextStyle(
                                    fontFamily: 'Srbija Sans',
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          )
                        ],
                      ),
                      Image.asset('assets/ArrowRight.png')
                    ],
                  ),
                ),
              ),
            ],
          )
        ]));
  }
}
