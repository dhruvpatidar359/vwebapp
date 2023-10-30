import 'dart:ui';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parallax Image Scroll',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> texts = [
    'This',
    'Parallax Scroll',
    'Looks Amazing!',
    'Right...!',
    'Let Us Know in the Comments :D'
  ];

  List<Widget> temp = [];

  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    super.initState();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    temp = [
      firstPage(),
      secondPage(),
      fourthPage(),
      thirdPage(),
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        controller: controller,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            height: MediaQuery.of(context).size.height,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(),
            child: Stack(
              children: [
                Container(
                  transform: Matrix4.identity()
                    ..translate(
                        0.0,
                        controller.hasClients
                            ? (-(index * MediaQuery.of(context).size.height) +
                                    controller.position.pixels) /
                                2
                            : 0.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: temp.elementAt(index),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget firstPage() {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage("images/1.jpg"), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vizola",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Home",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "About us",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Careers",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Book a Demo",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: Container(
                            alignment: Alignment.center,
                            height: MediaQuery.sizeOf(context).height / 16,
                            width: MediaQuery.sizeOf(context).width / 12,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Colors.purple,
                                  Colors.black26,
                                  Colors.purple
                                ]),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.purple, spreadRadius: 4)
                                ],
                                border:
                                    Border.all(color: Colors.purple, width: 2)),
                            child: Text('Sign in',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GradientText(
                  "Lets Change the\nWORLD\none lesson at a\ntime",
                  style: GoogleFonts.poppins(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                  ),
                  stops: [0.0000001, 0.05, 0.5, 6.0],
                  colors: [
                    Colors.black,
                    Colors.white60,
                    Colors.white,
                    Colors.orange,
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.sizeOf(context).height / 16,
                      width: MediaQuery.sizeOf(context).width / 12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [
                            Colors.purple,
                            Colors.black26,
                            Colors.purple
                          ]),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.purple,
                                spreadRadius: 100,
                                blurRadius: 100),
                          ],
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          )),
                      child: Text('Contribute',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget secondPage() {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage("images/2.jpg"), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GradientText(
                  "We Reform the\nfuture of\nCLASSROOMS",
                  style: GoogleFonts.poppins(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                  ),
                  colors: [
                    Colors.white60,
                    Colors.orange,
                    Colors.orange,
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.sizeOf(context).height / 16,
                      width: MediaQuery.sizeOf(context).width / 12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [
                            Colors.purple,
                            Colors.black26,
                            Colors.purple
                          ]),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.purple,
                                spreadRadius: 100,
                                blurRadius: 100),
                          ],
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          )),
                      child: Text('Contribute',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget thirdPage() {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage("images/3.jpg"), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GradientText(
                  "JOIN US\nin the\nrevolution",
                  style: GoogleFonts.poppins(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                  ),
                  colors: [
                    Colors.white60,
                    Colors.orange,
                    Colors.orange,
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.sizeOf(context).height / 16,
                      width: MediaQuery.sizeOf(context).width / 12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [
                            Colors.purple,
                            Colors.black26,
                            Colors.purple
                          ]),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.purple,
                                spreadRadius: 100,
                                blurRadius: 100),
                          ],
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          )),
                      child: Text('Contribute',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget fourthPage() {
    return SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    height: MediaQuery.sizeOf(context).height / 2,
                    width: MediaQuery.sizeOf(context).width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white),
                        boxShadow: [
                          BoxShadow(color: Colors.orange, blurRadius: 100)
                        ]),
                    child: VideoApp()),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GradientText(
                  "Just A\nGlance Of What\nWe\nAre Building\nUnder\nThe Roof",
                  style: GoogleFonts.poppins(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                  ),
                  colors: [
                    Colors.white60,
                    Colors.orange,
                    Colors.orange,
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('example.mp4')
      ..initialize().then((_) {
        _controller.setLooping(true);
        _controller.play();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Container(
            width: MediaQuery.of(context)
                .size
                .width, // Set the width to the screen width
            height: MediaQuery.of(context)
                .size
                .height, // Set the height to the screen height
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          )
        : CircularProgressIndicator();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
