import 'package:flutter/material.dart';

class MainServiceCards extends StatelessWidget {
  var icon;
  var title;

  MainServiceCards({
    Key key,
    this.icon,
    this.title,
  }) : super(key: key);

  List<Widget> loadMainServicecards() {
    List<Widget> listMainServices = [];

    //for(int i = 0; i < 4 ; i++){
    listMainServices.addAll(
      [
        Padding(
          padding: EdgeInsets.all(1),
          child: Container(
            height: 450,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(60.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.shade200,
                  offset: Offset(3, 3),
                  spreadRadius: 4,
                  blurRadius: 3,
                ),
                BoxShadow(
                  color: Color.fromRGBO(254, 255, 255, 1),
                  offset: Offset(-3, -3),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Container(
              height: 430,
              width: 330,
              margin: EdgeInsets.all(5),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('hello'),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(60.0)),
                  /* image: DecorationImage(
                    image: AssetImage("assets/images/silver_rhr.png"),
                    fit: BoxFit.contain,
                    alignment: AlignmentDirectional.topEnd,
                  ), */
                ),
              ),
              // margin: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(60.0)),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.4, 0.6, 0.8],
                  colors: [
                    Color.fromRGBO(235, 242, 250, 1),
                    Color.fromRGBO(235, 242, 250, 1),
                    Color.fromRGBO(235, 242, 250, 1),
                    Color.fromRGBO(235, 242, 250, 1),
                    // Color.fromRGBO(191, 203, 210, 1),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            height: 420,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(60.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.shade200,
                  offset: Offset(3, 3),
                  spreadRadius: 4,
                  blurRadius: 3,
                ),
                BoxShadow(
                  color: Color.fromRGBO(254, 255, 255, 1),
                  offset: Offset(-3, -3),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Container(
              margin: EdgeInsets.all(3),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('hello'),
                  ],
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/silver_rhr.png"),
                    fit: BoxFit.contain,
                    alignment: AlignmentDirectional.topEnd,
                  ),
                ),
              ),
              // margin: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(60.0)),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.4, 0.6, 0.8, 1.0],
                  colors: [
                    Color.fromRGBO(235, 242, 250, 1),
                    Color.fromRGBO(235, 242, 250, 1),
                    Color.fromRGBO(235, 242, 250, 1),
                    Color.fromRGBO(235, 242, 250, 1),
                    Color.fromRGBO(191, 203, 210, 1),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            height: 420,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(60.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.shade200,
                  offset: Offset(3, 3),
                  spreadRadius: 4,
                  blurRadius: 3,
                ),
                BoxShadow(
                  color: Color.fromRGBO(254, 255, 255, 1),
                  offset: Offset(-3, -3),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Container(
              margin: EdgeInsets.all(3),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('hello'),
                  ],
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/silver_rhr.png"),
                    fit: BoxFit.contain,
                    alignment: AlignmentDirectional.topEnd,
                  ),
                ),
              ),
              // margin: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(60.0)),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.4, 0.6, 0.8, 1.0],
                  colors: [
                    Color.fromRGBO(235, 242, 250, 1),
                    Color.fromRGBO(235, 242, 250, 1),
                    Color.fromRGBO(235, 242, 250, 1),
                    Color.fromRGBO(235, 242, 250, 1),
                    Color.fromRGBO(191, 203, 210, 1),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            height: 420,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(60.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.shade200,
                  offset: Offset(3, 3),
                  spreadRadius: 4,
                  blurRadius: 3,
                ),
                BoxShadow(
                  color: Color.fromRGBO(254, 255, 255, 1),
                  offset: Offset(-3, -3),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Container(
              margin: EdgeInsets.all(3),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('hello'),
                  ],
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/silver_rhr.png"),
                    fit: BoxFit.contain,
                    alignment: AlignmentDirectional.topEnd,
                  ),
                ),
              ),
              // margin: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(60.0)),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.4, 0.6, 0.8, 1.0],
                  colors: [
                    Color.fromRGBO(235, 242, 250, 1),
                    Color.fromRGBO(235, 242, 250, 1),
                    Color.fromRGBO(235, 242, 250, 1),
                    Color.fromRGBO(235, 242, 250, 1),
                    Color.fromRGBO(191, 203, 210, 1),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
    //}
    print(listMainServices.length);
    return listMainServices;
  }

  void initState() {}
  @override
  Widget build(BuildContext context) {
    print('Hello');
    return ListView(
      scrollDirection: Axis.horizontal,
      children: loadMainServicecards(),
    );
  }
}
