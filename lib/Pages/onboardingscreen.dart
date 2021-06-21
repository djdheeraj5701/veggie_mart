import 'package:flutter/material.dart';
import 'package:veggie_mart/Pages/List_Page.dart';
import 'package:veggie_mart/Widgets/onboardingwidgets.dart';


class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  int curr=0;
  List headtext=[
    "Hey! We are meeting for the first time",
    "Welcome to my new app",
    "A new easy way to get it done",
    "Alright! we will start now"
  ];
  List bodytext=[
    "Let me introduce to u quickly",
    "Hope we give u a comfortable ride in some time enjoy as much as u can no interruptions made",
    "Hehe this feature will blow ur mind like never before",
    "Pretty much about myself Lets know u now"
  ];


  forNextSlide(){
    if(curr<headtext.length-1){
      setState(() {
        curr+=1;
      });
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => List_Page()));
    }
  }

  forPrevSlide(){
    if(curr>0){
      setState(() {
        curr-=1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff07FEC9),
          body: Stack(
            children: [
              Positioned(
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height-375,
                  child: Image(
                    image: AssetImage('assets/images/$curr.png'),
                  ),
                ),
              ),
              Positioned(
                top: 15,
                left: 15,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    onTap: forPrevSlide,
                    child: Container(
                      width: 30,
                      height: 30,
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: (MediaQuery.of(context).size.width-375)/2,
                child: ArtBoard(
                  size: [
                    375,369
                  ],
                  color: Color(0xffffffff),
                  round: 42,
                  child: BoardText(
                    headtext: headtext[curr],
                    bodytext: bodytext[curr],
                    function: forNextSlide,
                    total: headtext.length,
                    curr: curr,
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
