import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formula1_app/model/news_item.dart';
import 'package:formula1_app/pages/detailed_news_page.dart';
import 'package:intl/intl.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NewsItem> newsList = [
    NewsItem(
      date: '12/28/2023',
      title:
          'Verstappen: Red Bull still needs to improve on street circuits and kerbs',
      image:
          'https://cdn-9.motorsport.com/images/amp/0mbr38a2/s1000/max-verstappen-red-bull-racing.webp',
      text:
          'The RB19’s only defeat in the 2023 season came at a venue where those two elements combined with Red Bull making mistakes on its efforts to adjust its ride height settings among its typical event set-up work, which contributed to Carlos Sainz’s win for Ferrari in Singapore. Speaking to Motorsport.com in an exclusive interview, Verstappen said for his team “it helps if we know what direction we are working in” when discussing the “not ideal” impact of Red Bull’s reduced development time for most of 2023 as a result of its penalty for breaching the 2021 cost cap. When asked where Red Bull is therefore concentrating its efforts in refining and improving the RB19 – statistically F1’s most dominant car ever – Verstappen replied: “Mainly I think just street circuits and low-speed, kerbing.',
    ),
    NewsItem(
      date: '12/28/2023',
      title:
          'Wolff: Mercedes must not "give up" on recovery before F1 2026 rules reset',
      image:
          'https://cdn-5.motorsport.com/images/amp/YBenBW82/s1000/lewis-hamilton-mercedes-f1-w14.webp',
      text:
          'Mercedes has long since decided to ditch its ‘size-zero’ sidepod car architecture for the 2024 season, for which it will converge around the downwash solution used by the rest of the grid. This will leave the eight-time constructors’ champion to play catch-up to Red Bull, which has already had two seasons to develop its own optimum take on the ground-effects regulations. Despite its main rival enjoying a head start, Mercedes motorsport boss Wolff says his team cannot “give up” on its recovery plan – having finished second for two years running – by instead effectively writing off the 2024 and 2025 seasons until the F1 rules undergo a major change.',
    ),
    NewsItem(
      date: '12/27/2023',
      title:
          'Why was refuelling banned in F1? History of refuelling and previous accidents',
      image:
          'https://cdn-7.motorsport.com/images/amp/eYPOe382/s1000/f1-jerez-july-testing-2008-jen.webp',
      text:
          'Refuelling during a Formula 1 race has been banned since 2010. This means that cars must have an adequate amount of fuel inside their tanks before the start of each grand prix to ensure they can finish the race. F1 cars are now allowed up to 110kgs of fuel at the start of the race but are required to provide 1 litre of fuel to the FIA at the end of the race, otherwise they will be disqualified. Last year, Sebastian Vettel lost his second place podium at the Hungarian Grand Prix after being unable to complete a cool down lap due to lack of fuel and was unable to provide an adequate sample to the FIA for checks.',
    ),
    NewsItem(
      date: '12/28/2023',
      title: 'Key: “Immensely tight grid” a reason for optimism at Sauber',
      image:
          'https://cdn-1.motorsport.com/images/amp/6l9zzvK0/s1000/valtteri-bottas-alfa-romeo-c43.webp',
      text:
          'In its final season under the Alfa Romeo name, the Swiss outfit slipped from sixth to ninth in the constructors\' standings after a difficult season with the C43. However, in the background the team has been building towards the arrival of Audi in 2026, with the hiring of former McLaren man Key one of the most visible signs of progress. Key says that a performance differential of just 1.5% between pacesetters Max Verstappen and Red Bull and the midfield this year bodes well for next season, as it suggests that small gains will be very valuable.',
    ),
    NewsItem(
      date: '12/28/2023',
      title: 'Norris: F1 2023 has "been my best year"',
      image:
          'https://cdn-8.motorsport.com/images/amp/0oObAno0/s1000/mclaren-team-photo-lando-norri.webp',
      text:
          'That was the year Norris made his F1 debut with McLaren, with which he has remained after signing two contract extensions in 2021 and 2022. Although the papaya team had a tough start to the season just gone, its development work helped it go from battling to escape Q1 to regularly being Red Bull’s closest challenger – all of which contributed to Norris scoring a personal best seven podium results and leading the early stages of the Silverstone and Austin races. When asked to rate his own 2023 season in an exclusive interview with Motorsport.com, Norris replied: "I think it’s been my best year.',
    ),
    NewsItem(
      date: '12/28/2023',
      title: 'Bottas “in denial for five years” versus Hamilton at Mercedes F1',
      image:
          'https://cdn-9.motorsport.com/images/amp/6O1nbew2/s1000/lewis-hamilton-mercedes-toto-w.webp',
      text:
          'Following the shock retirement of newly crowned F1 world champion Nico Rosberg, Bottas left Williams to join Mercedes for 2017. He remained alongside Hamilton until a 2022 move to Sauber (then branded Alfa Romeo). During their time together, Hamilton won 50 grands prix and four drivers’ titles while Bottas scored 10 victories. To keep competing against his team-mate, Bottas now believes that he had to be in a state of denial. Speaking exclusively to Motorsport.com, the Finn said: “You have to be in denial.  “I was in denial for almost five years because every year, I wanted to get back to the season and then fight for the title and I had to believe in myself.” Bottas added that it was only during his final 2021 season at Mercedes - after which the team made room to promote junior driver George Russell from Williams - that he came to terms with losing out in the head-to-head. He continued: “It was only when I knew that I was leaving the team then that I noticed that I was a bit more fine with certain things.  ',
    ),
    NewsItem(
      date: '12/28/2023',
      title: 'Adrian Newey\'s F1 championship-winning cars from FW14B to RB19',
      image:
          'https://cdn-9.motorsport.com/images/amp/YEQ1QJpY/s1000/formula-1-japanese-gp-1993-ala-2.webp',
      text:
          'Adrian Newey today (26 December) celebrates his 65th birthday in a year where he has contributed to yet another F1 championship-winning car. He and his Red Bull colleagues created the RB19, which won 21 of 22 grands prix to dominate both the 2023 F1 constructors’ and drivers’ world championships. However, it was not the first championship the legendary designer has contributed towards, with 14 of his cars claiming a title. Red Bull’s chief technical officer has often been at the forefront of F1 car design, so here are the championship-winning machines he has worked on at Williams, McLaren and Red Bull.',
    ),
    NewsItem(
      date: '12/28/2023',
      title: 'Newey not planning on walking away from Red Bull F1',
      image:
          'https://cdn-7.motorsport.com/images/amp/6zQdWZwY/s1000/adrian-newey-red-bull-racing-1.webp',
      text:
          'Newey, who celebrates his 65th birthday on Boxing Day, has been credited as being an essential part of turning Red Bull into a championship-winning machine upon his arrival in 2006. He initially made a name in F1 with his first technical director role at Leyton House before moving to Williams and then McLaren, designing cars that won a combined six constructors\' and six drivers\' titles. Red Bull team boss Christian Horner then prized him away from McLaren, with Red Bull\'s Newey-led car designs stealing a march on the field in the blown diffuser era between 2010 and 2013, and again since the introduction of the 2022 ground-effect cars. ',
    ),
    NewsItem(
      date: '12/27/2023',
      title: 'Brown - F1 "not far away" from IndyCar level of convergence',
      image:
          'https://cdn-4.motorsport.com/images/amp/6xEVRM70/s1000/zak-brown-ceo-mclaren-racing-i.webp',
      text:
          'IndyCar is known for its close, action-packed races with Dallara-built cars that are largely spec outside damper development and having two different engine manufacturers. It leads to very close racing, with top six qualifying shootouts on several road courses covered by three tenths or less. In its 2023 opener at St Petersburg, there was a three-tenth difference between leading the first phase of qualifying and being eliminated in the group stages altogether.',
    )
  ];
  final DateTime _selectedDate = DateTime.now();
  DateTime filterDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return getNews();
  }

  Widget getNews() {
    List<Widget> list = [];
    list.add(const Padding(
      padding: EdgeInsets.fromLTRB(18, 60, 18, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'News',
            style: TextStyle(
                fontFamily: 'Srbija Sans',
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20),
          ),
        ],
      ),
    ));
    list.add(Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 10),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Dialog(
                        child: SizedBox(
                          width: 300,
                          height: 200,
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: _selectedDate,
                            onDateTimeChanged: (DateTime newDate) {
                              setState(() {
                                filterDate = newDate;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Day',
              style: TextStyle(
                  fontFamily: 'Srbija Sans',
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
            Image.asset(
              'assets/ArrowDown.png',
              color: Colors.white,
            )
          ],
        ),
      ),
    ));
    var date = DateFormat("MM/dd/yyyy").format(filterDate);
    print(date);
    for (var news in newsList.where((element) => element.date == date)) {
      list.add(
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => DetailedNewsPage(news: news),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  width: double.infinity,
                  height: 270,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(news.image!))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Container(
                            padding: const EdgeInsets.only(top: 13, bottom: 13),
                            width: 73,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white),
                            child: const Text(
                              'View',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Srbija Sans',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            news.title!,
                            style: const TextStyle(
                                fontFamily: 'Srbija Sans',
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                        ),
                        Text(
                          news.date!,
                          style: TextStyle(
                              fontFamily: 'Srbija Sans',
                              color: Colors.white.withOpacity(0.7),
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                      ]),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  width: double.infinity,
                  height: 270,
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Column(
      children: list,
    );
  }
}
