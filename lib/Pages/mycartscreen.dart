import 'package:flutter/material.dart';
import 'package:veggie_mart/Widgets/mycartwidgets.dart';


class MyCartScreen extends StatefulWidget {
  @override
  _MyCartScreenState createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffffffff),
          body: Stack(
            children: [
              CartHeader(),
              Positioned(
                top: 132,left: 0,
                child: Container(
                  width: 120,height: 120,
                  color: Color(0xff07FEC9),
                ),
              ),
              Positioned(
                top: 132,left: 0,
                child: Container(
                  width: 120,height: 120,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(120)),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 132,
                  ),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                          itemCount: 9,
                          itemBuilder: (context,index){
                            return ProductCard();
                          }
                      ),
                    ),
                  ),
                  CartFooter(),
                ],
              ),
            ],
          ),
        )
    );
  }
}






