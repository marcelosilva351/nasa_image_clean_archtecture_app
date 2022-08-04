import 'package:flutter/material.dart';
import 'package:idade_cachorro/presenter/pages/image_day_page.dart';
import 'package:idade_cachorro/shared/screen_size.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double topAstronaut = 150;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1)).then((value) {
      changeAstronaut();
    });
    // TODO: implement initState
    super.initState();
  }

  changeAstronaut() {
    topAstronaut = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 199, 110),
      appBar: AppBar(
        title: Text("Image day nasa app"),
      ),
      body: ListView(
        children: [
          AnimatedPadding(
              curve: Curves.bounceOut,
              duration: Duration(milliseconds: 1000),
              padding: EdgeInsets.only(top: topAstronaut)),
          Image.asset("assets/astronaut.png"),
          AnimatedPadding(
              curve: Curves.bounceOut,
              duration: Duration(milliseconds: 1000),
              padding: EdgeInsets.only(top: topAstronaut == 150 ? 100 : 180)),
          Padding(
            padding: EdgeInsets.only(
                left: ScreenSize.getWidth(context) * 0.1,
                right: ScreenSize.getWidth(context) * 0.1),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ImageDayPage();
                }));
              },
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          color: Colors.black54,
                          offset: Offset(1, 2)),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                width: double.infinity,
                height: 65,
                child: const Center(
                  child: Text(
                    "Image",
                    style: TextStyle(
                        color: Color.fromARGB(255, 249, 163, 24),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
