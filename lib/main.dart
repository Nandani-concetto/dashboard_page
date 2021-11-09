import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: Color(0xff1D5FCD), // status bar color
  ));

  runApp(MaterialApp(
    home: Myapp(),
  ));

}
class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);
  @override
  _MyappState createState() => _MyappState();
}
class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    var backwardsCompatibility;
    return Scaffold(
        backgroundColor: Colors.white,
        body: buildBody(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(color: Color(0x0D000000), blurRadius: 10),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10,left: 27,right: 27),
            child: ClipRRect(
              borderRadius: new BorderRadius.all(
                Radius.circular(15),
              ),
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white70,
                items: [
                  buildBottomNavigationBarItem("assets/images/home.png"),
                  buildBottomNavigationBarItem("assets/images/My Jobs.png"),
                  buildBottomNavigationBarItem("assets/images/calendar.png"),
                  buildBottomNavigationBarItem("assets/images/Profile.png"),
                ],
              ),
            ),
          ),
        )
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(String imagePath) {
    return BottomNavigationBarItem(
                  icon: Center(
                    child: Image(
                      image: AssetImage(imagePath),
                    ),
                  ),
                  label: '',
                );
  }
  Widget buildBody(){
    return ClipRRect(
      //borderRadius: new BorderRadius.all(Radius.circular(10)),
      child: Stack(
        children: [
          getListView(),
          getImageOfRectangle(),
          getImageOfLayer(),
          buildHeader(),
          getAddIcon(),
        ],
      ),
    );
  }
  Widget getImageOfRectangle(){
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Image(
        image: AssetImage("assets/images/Rectangle 1.png"),
        height: 150,
      ),
    );
  }
  Widget getImageOfLayer(){
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Image(image: AssetImage("assets/images/Layer 6.png")),
    );
  }
  Widget buildHeader() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32, top: 80),
            child: Text(
              "My Dashboard",
              style: TextStyle(
                fontFamily: "Nunito",
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 21,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80, right: 20),
            child: Image(image: AssetImage("assets/images/bell.png")),
          ),
        ],
      ),
    );
  }
  Widget getCard(){
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(9),
            bottom: Radius.circular(9)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: getText(),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getDateIcon(),
              getDate(),
            ],
          )
        ],
      ),
    );
  }
  Widget getText() {
    return Padding(
      padding: const EdgeInsets.only(top: 17, left: 23, right: 22, bottom: 10),
      child: Text(
        "John Carter applied for the RazorParx Security via First Guard",
        style: TextStyle(
          fontFamily: "Nunito",
          fontWeight: FontWeight.w600,
          fontSize: 16,
          //height:10,
        ),
      ),
    );
  }
  Widget getDateIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10, bottom: 15),
      child: Icon(
        Icons.date_range_outlined,
      ),
    );
  }
  Widget getDate() {
    return Padding(
      padding: const EdgeInsets.only(left: 1, bottom: 15),
      child: Text(
        "02-02-2021",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: Colors.grey),
      ),
    );
  }
  Widget getListView(){
    return Padding(
      padding: const EdgeInsets.only(top: 18.55),
      child: ListView.builder(
          padding: EdgeInsets.only(top: 130, right: 20, left: 20),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                getCard(),
              ],
            );
          }),
    );
  }
  Widget getAddIcon(){
    return Padding(
      padding: const EdgeInsets.only(top: 650, left: 328),
      child: Icon(
        Icons.add_circle,
        size: 60,
      ),
    );
  }
}
