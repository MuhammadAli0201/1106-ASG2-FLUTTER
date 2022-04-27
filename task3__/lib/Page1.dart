import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:task3__/Page2.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  Color activeColor = Color(0xFF2ead98);
  Color inactiveColor = Colors.black26;
  Color Bcolor = Color.fromARGB(255, 238, 238, 238);
  int onpress = 0;
  int onpress2=0;
  final imgs = [
    "Assets/bali-island-1.jpg",
    "Assets/bali-island-2.jpg",
    "Assets/bali-island-3.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 236, 243, 247),
      body: Column(
        children: [
          //NavBar Container
          Expanded(flex: 1, child: NavBar()),
          //Countries Row
          Expanded(
            flex: 1,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CountriesButtons("Indonesia", 1),
                  CountriesButtons("Thailand", 2),
                  CountriesButtons("China", 3),
                  CountriesButtons("Vietnam", 4),
                ],
              ),
            ),
          ),

          //Images in Row
          Expanded(
            flex: 4,
            child: Container(
              child: ImageSlider(context),
            ),
          ),
          //Top Destinations etc
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.fromLTRB(25, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Top Destinations",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  TextButton(
                      onPressed: () {},
                      child: Text("View All",
                          style: TextStyle(color: activeColor))),
                ],
              ),
            ),
          ),
          //R5decoration
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: R5ButtonsStyling(
                      "Assets/btnImg-1.jpg", "Bandung", "West Java"),
                ),
                Expanded(
                  flex: 1,
                  child:
                      R5ButtonsStyling("Assets/btnImg-2.jpg", "Lombok", "NTB"),
                ),
              ],
            ),
          ),
          //BOTTOM BUTTONS
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(25),
              decoration: BoxDecoration(
                  color: activeColor, borderRadius: BorderRadius.circular(100)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomButtons(Icons.home, 1),
                  BottomButtons(Icons.explore_outlined, 2),
                  BottomButtons(Icons.star_border_rounded, 3),
                  BottomButtons(Icons.person_outline, 4),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
//---------------------------------------METHODS------------------------------------------

//NAVBAR
  Container NavBar() {
    return Container(
      //margin: EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //menu icon
          Container(
            height: 55,
            width: 55,
            margin: EdgeInsets.only(left: 30),
            decoration: BoxDecoration(
              color: Color.fromARGB(31, 168, 168, 168),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  size: 30,
                )),
          ),

          //navbar text
          Container(
            child: Text(
              "Discover",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 17),
            ),
          ),

          //search icon
          Container(
            margin: EdgeInsets.only(right: 30),
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: Color.fromARGB(31, 168, 168, 168),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 30,
                )),
          ),
        ],
      ),
    );
  }

//COUNTRIES BUTTONS
  GestureDetector CountriesButtons(String text, int check) {
    return GestureDetector(
      onTap: () {
        setState(() {
          onpress = check;
        });
      },
      child: Container(
        child: Column(
          children: [
            CircleAvatar(
              radius: 5,
              backgroundColor:
                  onpress == check ? activeColor : Colors.transparent,
            ),
            Text(
              text.toString(),
              style: TextStyle(
                  color: onpress == check ? activeColor : inactiveColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

//methods for ImagesSlider
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
          return buildImage(urlimages, index);
        },
      ),
    );
  }

//BUILD IMAGES METHODS
  FlatButton buildImage(String urlimages, int index) {
    return FlatButton(
      onPressed: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Page2()));
      },
      child: Container(
        //width: 400,fi
    
        padding: EdgeInsets.only(bottom: 40),
    
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[BoxShadow(color: Colors.black12)],
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              //   height: 900,
              child: Container(
                
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          urlimages,
                        ),
                        scale: 0.4,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter),
                    borderRadius: BorderRadius.circular(50)),
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [BlurButtons(TextButton(onPressed: (){}, child: Text("4,7",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold)))),],),
              )
                
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              margin:EdgeInsets.fromLTRB(30, 0, 20, 0),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    "Bali Island",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.more_vert)
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  
              margin:EdgeInsets.fromLTRB(30, 0, 20, 0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.hotel,
                        color: activeColor,
                      ),
                      Text(
                        "Hotels",
                        style: TextStyle(color: Colors.black38, fontSize: 20),
                      )
                    ],
                  ),
                ),
                Container(),
              ],
            )
          ],
        ),
      ),
    );
  }

  //BLUR BUTTON
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
//R5BUTTONSTYLING
  Container R5ButtonsStyling(String image, String txt1, String txt2) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(children: [
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                txt1.toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              Text(
                txt1.toString(),
                style: TextStyle(
                    color: inactiveColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ])),
      ]),
    );
  }

//BOTTOM BUTTONS

  TextButton BottomButtons(icon, int check2) {
    return TextButton(
      onPressed: () {
        setState(() {
          onpress2 = check2;
        });
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: onpress2 == check2 ? Colors.white : Colors.white54,
              size: 40,
            ),
            CircleAvatar(
              radius: 5,
              backgroundColor:
                  onpress2 == check2 ? Colors.white : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }


}
