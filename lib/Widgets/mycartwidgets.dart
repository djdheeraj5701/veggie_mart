import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

String bagString='<svg xmlns="http://www.w3.org/2000/svg" width="32.483" height="32.483" viewBox="0 0 32.483 32.483"><g id="Bag" transform="translate(1.5 1.5)"><path id="Path_152" d="M18.427,12.9a1.741,1.741,0,0,0,1.843,1.843A1.741,1.741,0,0,0,22.112,12.9a1.741,1.741,0,0,0-1.843-1.843A1.741,1.741,0,0,0,18.427,12.9Zm-11.056,0a1.741,1.741,0,0,0,1.843,1.843A1.741,1.741,0,0,0,11.056,12.9a1.741,1.741,0,0,0-1.843-1.843A1.741,1.741,0,0,0,7.371,12.9ZM27.64,9.029l1.843,18.427a2.092,2.092,0,0,1-.553,1.474,1.435,1.435,0,0,1-1.29.553H1.843a1.435,1.435,0,0,1-1.29-.553A2.092,2.092,0,0,1,0,27.456L1.843,9.029A1.959,1.959,0,0,1,3.685,7.371H7.371a7.371,7.371,0,0,1,14.741,0H25.8A1.959,1.959,0,0,1,27.64,9.029ZM18.427,7.371H11.056a3.685,3.685,0,0,1,7.371,0Z" fill="none" stroke="#000" stroke-width="3" fill-rule="evenodd"/></g></svg>';
String crossString='<svg xmlns="http://www.w3.org/2000/svg" width="33.941" height="33.941" viewBox="0 0 33.941 33.941"><g id="Add" transform="translate(16.971) rotate(45)"><path id="Union_1" d="M10.5,24V13.5H0v-3H10.5V0h3V10.5H24v3H13.5V24Z"/></g></svg>';
Widget bagIcon=SvgPicture.string(bagString,color: Color(0xff00241c),);
Widget crossIcon=SvgPicture.string(crossString,color: Color(0xff00241c),);
class CartHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 132,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(132)),
        color: Color(0xff07FEC9),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 30,top: 30,
            child: GestureDetector(
              onTap: null,
              child: Container(
                width: 30, height: 30,
                child: IconButton(
                  onPressed: (){Navigator.of(context).pop();},
                  icon: Icon(
                    FontAwesomeIcons.arrowLeft,
                    color: Color(0xff00241c),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width/5,bottom: 10,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      width: 30, height: 30,
                      child: bagIcon
                  ),
                ),
                Text(
                  "M Y  C A R T",
                  style: TextStyle(
                    fontFamily: "Circular Std",
                    fontSize: 24,
                    color: Color(0xff00241c),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 96,
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.only(bottomRight: Radius.circular(42),bottomLeft: Radius.circular(42)),
        color: Color(0xfff7f7f7),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,top: 0,bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "T O T A L \nRs. 5580.00",
                style: TextStyle(
                  fontFamily: "Circular Std",
                  fontSize: 24,
                  color: Color(0xff000000),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Positioned(
            right: 0,top: 0,bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 180,height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Color(0xff00241c),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                        fontFamily: "Avenir",
                        fontSize: 21,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,height: 144,
      color: Color(0x00ffffff),
      child: Stack(
        children: [
          Positioned(
            left: 0,top: 0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: 120,height: 120,
                child: Image(
                  image: AssetImage('assets/images/1.png'),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,left:132,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bananas",
                    style: TextStyle(
                      fontFamily: "Circular Std",
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "per dozen price",
                    style: TextStyle(
                      fontFamily: "Avenir",
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      ProductCounter(),
                      Container(
                        child: Text(
                          "Rs.\n50.00",
                          style: TextStyle(
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,top: 0,
            child: Padding(
              padding: const EdgeInsets.only(right:12.0,top:12),
              child: crossIcon
            ),
          )
        ],
      ),
    );
  }
}

class ProductCounter extends StatefulWidget {
  @override
  _ProductCounterState createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,height: 60,
      child: Row(
        children: [
          Container(
            width: 30,height: 30,
            decoration: BoxDecoration(
              color: Color(0xffffeeee)
            ),
            child: Icon(
              FontAwesomeIcons.minus,
              size: 12,
            ),
          ),
          Container(
            width: 30,height: 30,
            decoration: BoxDecoration(
            ),
            child: Center(
              child: Text(
                "1",
                style: TextStyle(
                  fontFamily: "Avenir",
                  fontSize: 16,
                ),
              ),
            )
          ),
          Container(
            width: 30,height: 30,
            decoration: BoxDecoration(
              color: Color(0xffeeffee)
            ),
            child: Icon(
              FontAwesomeIcons.plus,
              size: 12,
            ),
          )
        ],
      ),
    );
  }
}



