import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  Color topColor = Colors.red;
  Color bottomColor = Colors.green;

  var colorsList = [
    Colors.pink,
    Colors.amber,
    Colors.blue,
    Colors.deepPurple,
    Colors.deepOrangeAccent,
  ];

  var index = 0;
  late Uri link;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        bottomColor = Colors.pink;
      });
    });
    return Scaffold(

      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 2),
            onEnd: () {
              setState(() {
                index++;
                bottomColor = colorsList[index % colorsList.length];
                topColor = colorsList[(index + 1) % colorsList.length];
              });
            },
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  topColor,
                  bottomColor,
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assests/pitu.jpg",
                  width: 200,
                ),
                Text(
                  "Sami Barakzai",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Developer | IT Expert ",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () async {
                        link = Uri.parse("https://github.com/samibarakzai");
                        if(await canLaunchUrl(link))  {
                          launchUrl(link);
                        }
                      },
                      icon: Image.asset("assests/fb.png"),
                    ),
                    IconButton(
                      onPressed: () async {
                        link = Uri.parse("https://github.com/samibarakzai");
                        if(await canLaunchUrl(link))  {
                        launchUrl(link);
                        }
                      },
                      icon: Image.asset("assests/insta.png"),
                    ),
                    IconButton(
                      onPressed: ()  async {
                        link = Uri.parse("https://www.linkedin.com/in/samiullah-barakzai-62b3951b1/");
                        if(await canLaunchUrl(link))  {
                        launchUrl(link);
                        }
                      },
                      icon: Image.asset("assests/lin.png"),
                    ),
                    IconButton(
                      onPressed: ()  async {
                        link = Uri.parse("https://github.com/samibarakzai");
                        if(await canLaunchUrl(link))  {
                        launchUrl(link);
                        }
                      },
                      icon: Image.asset("assests/git.png"),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

