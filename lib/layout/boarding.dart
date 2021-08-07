import 'package:flutter/material.dart';
import 'package:shopapp/loginRegist/login.dart';
import 'package:shopapp/shared/shareddata.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
  });
}

class Mains extends StatefulWidget {
  @override
  _MainsState createState() => _MainsState();
}

class _MainsState extends State<Mains> {
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assest/image/pee1.jpg',
      title: 'On Board 1 Title',
      body: 'On Board 1 Body',
    ),
    BoardingModel(
      image: 'assest/image/pee2.jpg',
      title: 'On Board 2 Title',
      body: 'On Board 2 Body',
    ),
    BoardingModel(
      image: 'assest/image/pee1.jpg',
      title: 'On Board 3 Title',
      body: 'On Board 3 Body',
    ),
  ];

  final PageController pagecontroller = PageController();
  bool islast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              submit();
            },
            child: Text('skip'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  itemBuilder: (context, index) =>
                      buildBoard(context, boarding[index]),
                  controller: pagecontroller,
                  itemCount: boarding.length,
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    if (index == boarding.length - 1)
                      islast = true;
                    else
                      islast = false;
                  }),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: pagecontroller,
                  count: boarding.length,
                  effect: WormEffect(
                    spacing: 8.0,
                    radius: 10.0,

                    //activeDotColor: Colors.indigo,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (!islast) {
                      pagecontroller.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.easeInOut);
                    } else {
                      submit();
                    }
                  },
                  child: Icon(Icons.arrow_right_alt_outlined),
                )
              ],
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  void submit() async {
    Cachehelp.savebool(key: 'onboarding', value: true).then((value) {
      if (value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
            (route) => false);
      }
    });
  }

  Widget buildBoard(context, boardcont) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(boardcont.image)),
            SizedBox(
              height: 20,
            ),
            Text(boardcont.title, style: Theme.of(context).textTheme.headline4),
            SizedBox(
              height: 20,
            ),
            Text(
              boardcont.body,
              style: Theme.of(context).textTheme.headline6,
            ),
          ]);
}
