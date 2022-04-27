import 'dart:html';

import 'package:flutter/material.dart';
import 'Page1.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  Page1 page1=Page1();
  var Nchild;
var onpress=1;
Color inaactivecolor=Color.fromARGB(31, 197, 192, 192);
  Color activecolor = Color(0xFF2ead98);
  String imgs1 = "images/divingPerson-Img1.jpg";
  var colorstyleA = TextStyle(
      color: Colors.black38, fontSize: 14, fontWeight: FontWeight.bold);
  var colorstyleB = TextStyle(
      color: Colors.black38, fontSize: 17, fontWeight: FontWeight.bold);
  final imgs = ["images/divingPerson-Img1.jpg", "images/divingPerson-Img2.jpg"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 217, 229, 236),
        body: Column(
          children: [
            //--------------------image+their Buttons--------------------
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(60)),
                  image: DecorationImage(
                      image: AssetImage("images/bali-island-1.jpg"),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 40, 0, 0),
                          child: BlurButtons(IconButton(
                              onPressed: () {
                                Navigator.pop(context,MaterialPageRoute(builder: (context)=>Page1()));
                              },
                              icon: Icon(Icons.arrow_back_ios_rounded,
                                  color: Colors.white70))),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(35),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              BlurButtons(IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.image_outlined,
                                    color: Colors.white70,
                                    size: 33,
                                  )))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Bali Island",
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "Indonesia",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white38),
                                  )
                                ],
                              ),
                              BlurButtons(TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "4,7",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ))),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            //--------------------TEXT UNDER IMAGES--------------------
            Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text(
                    "Also known as the land of Gods, Bali appeals through its sheer natural beauty of looming volcanoes and lush terraced rice fields that excude peace",
                    style: TextStyle(color: Colors.black54, fontSize: 18),
                  ),
                )),
            //--------------------TOP ACTIVITY SECTION--------------------
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(25, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Top Activity",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    TextButton(
                        onPressed: () {},
                        child: Text("View All",
                            style: TextStyle(
                                color: activecolor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
            ),
//--------------------SLIDER BUTTON SECTION--------------------
            Expanded(
                flex: 2,
                child: Container(
                  child: ImageSlider(context),
                )),

            Expanded(flex: 1, child: BottomSlides(context)),
          ],
        ),
      ),
    );
  }

//--------------------METHODS--------------------
//1)BLURBUTTONS
  Container BlurButtons(Nchild) {
    return Container(
        //padding: EdgeInsets.only(left: 8),
        height: 53,
        width: 53,
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.4),
          border: Border.all(color: Colors.white70),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Nchild);
  }

//2)IMAGES SLIDER
  Container ImageSlider(context) {
    return Container(
      child: CarouselSlider.builder(
        itemCount: imgs.length,
        options: CarouselOptions(
          height: 330,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        itemBuilder: (context, index, realindex) {
          final urlimages = imgs[index];
          //RETURNING IMAGES TO METHOD 3
          return buildImage(urlimages, index);
        },
      ),
    );
  }

//3)BUILD IMAGES
  Container buildImage(String urlimages, int index) {
    return Container(
      padding: EdgeInsets.only(bottom: 30),

      //     decoration: BoxDecoration(color: Colors.red),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                urlimages,
              ),
              scale: 0.4,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter),
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 20, 0),
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BlurButtons(
                          Icon(Icons.star, color: Colors.amber.shade300)),
                    ],
                  )),
            ),
          ),
        ],
      ),
      // AlignPositioned(
      //         child:
      //         Container(
      //           margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
      //           height: 60,
      //           width: double.infinity,
      //           foregroundDecoration: BoxDecoration(
      //               color: activecolor,
      //               borderRadius: BorderRadius.circular(20)),
      //         ),
      //         alignment: Alignment.bottomCenter,
      //         touch: Touch.inside,
      //         dy: 35,
      //        // dx: 15.0, // Move 4 pixels to the right.
      //        // moveByChildWidth: -0.5, // Move half child width to the left.
      //         moveByContainerHeight: -0.00001
      //        ),
    );
  }

//4)BOTTOMSLIDER
  GestureDetector BottomSlides(BuildContext context) {
    return GestureDetector(
        onVerticalDragUpdate: (details) => showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => showsheet(),
            ),
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.vertical(top: Radius.circular(70)),
              border: Border.all(color: Colors.white10)),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 10,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(50)),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(70, 0, 70, 0),
                child: Column(children: [
                  Row(
                    children: [
                      Text(
                        "17 Feb",
                        style: TextStyle(color: Colors.black45),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Odessa Bali",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                      Text(
                        "\$987",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("2.55-19.55",
                          style: TextStyle(color: Colors.black45)),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ));
  }

//BOTTOM SLIDER SHEET THAT POP UP AFTER CLICK
  Widget showsheet() => DraggableScrollableSheet(
      initialChildSize: 0.95,
      builder: (_, controller) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(70)),
            ),
            child: Container(
              //color: Colors.white,
        margin: EdgeInsets.fromLTRB(32, 10, 33, 10),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0,10,0,0),
                    height: 6,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text(
                    "Details",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text(
                    "17 Febraury 2021",
                    style: colorstyleA,
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("From", style: colorstyleA),
                            Text("ODS", style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 27),),
                            Text("Odessa", style: colorstyleA)
                          ],
                        ),
                        Image(image: AssetImage("images/sliderImg.JPG")),
                        Column(
                          children: [
                            Text(
                              "To",
                              style: colorstyleA,
                            ),
                            Text(
                              "GNR",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 27),
                            ),
                            Text(
                              "G. Ngurah Rai",
                              style: colorstyleA,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text("Sort by:", style: colorstyleB),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 33,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Price"),
                                    Icon(Icons.keyboard_arrow_down_rounded,
                                        color: Colors.black),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromARGB(31, 197, 192, 192)),
                          child: Icon(Icons.list_sharp))
                    ],
                  ),
                  
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Expanded(
                    flex: 1,
                    child: bottomSliderInnerButtons("images/emirates.png","Bussiness",987,1)),
                  Expanded(
                    flex: 1,
                    child: bottomSliderInnerButtons("images/Capture.JPG","Bussiness",647,2)),
                  Expanded
                  (
                    flex: 1,
                    child: bottomSliderInnerButtons("images/Capture2.JPG","Economy",567,3)),
                  Expanded(
                    flex: 1,
                    child: FlatButton(
                      onPressed: (){},
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                        height: 110,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: activecolor,
                          borderRadius: BorderRadius.circular(90)
                    
                        ),
                        child: Center(child: Text("BOOK",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ));

  Container bottomSliderInnerButtons(String img,String className,int price,int check) {
    return Container(
      height: 115,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
                  children: [
                    Image(
                      image: AssetImage(img),
                      height: 70,
                      width: 70,
                    ),
                    Expanded(
                      flex: 3,
                      child: GestureDetector(
                        onTap: 
                         ()=>onpress=check,
                        child: Container(
                          
      margin: EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                            color: onpress==check?activecolor:inaactivecolor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "ODS-GNR",
                                    style: TextStyle(
                                        color: onpress==check?Colors.white:Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                  Padding(padding: EdgeInsets.only(bottom: 8)),
                                  Text("11.00-16.00",style: TextStyle(color: onpress==check?Colors.white54:Colors.black45))
                                ],
                              ),
                              Container(
                                height: 80,
                                width: 2,
                                color: onpress==check?Colors.white12:Colors.black12,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(className.toString(),style: TextStyle(color: onpress==check?Colors.white70:Colors.black87,fontSize: 18),),
                                  Text("Class",style: TextStyle(color: onpress==check?Colors.white70:Colors.black87,fontSize: 18),),
                                ],
                              ),
                              Text("\$"+price.toString(),style: TextStyle(color: onpress==check?Colors.white:Colors.black,fontWeight: FontWeight.bold,fontSize: 22),),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],)
                );
  }
  
}
