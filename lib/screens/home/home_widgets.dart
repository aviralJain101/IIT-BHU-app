import 'package:flutter/material.dart';
import 'package:iit_app/data/workshop.dart';
import 'package:iit_app/pages/detail.dart';
import 'package:iit_app/pages/login.dart';


class HomeWidgets {
  static final Color textPaleColor = Color(0xFFAFAFAF);
  static final Color textColor = Color(0xFF004681);

  static Future<bool> getLogOutDialog(context, details) => showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
                height: 350.0,
                width: 200.0,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(height: 150.0),
                        Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              color: Colors.teal),
                        ),
                        Positioned(
                            top: 50.0,
                            left: 94.0,
                            child: Container(
                              height: 90.0,
                              width: 90.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(45.0),
                                  border: Border.all(
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                      width: 2.0),
                                  image: DecorationImage(
                                      image: details[0], fit: BoxFit.cover)),
                            ))
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          details[1],
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                          ),
                        )),
                    SizedBox(height: 15.0),
                    FlatButton(
                        child: Center(
                          child: Text(
                            'Log Out',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14.0,
                                color: Colors.teal),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          signOutGoogle();
                          Navigator.of(context).pushReplacementNamed('/login');
                        },
                        color: Colors.transparent)
                  ],
                )));
      });

  static Widget getWorkshopCard(BuildContext context, {Workshop w}) => Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DetailPage(w)));
        },
        child: Stack(
          children: <Widget>[
            Container(
              height: 175.0,
              width: 500.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                      image: AssetImage(Workshop.imgPath[w.club]),
                      fit: BoxFit.cover)),
            ),
            // make the shade a bit deeper.
            Container(
              height: 175.0,
              width: 500.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.black.withOpacity(0.5)),
            ),
            Positioned(
                top: 20.0,
                left: 10.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 25,
                          // width: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            // color: Colors.black.withOpacity(0.5)
                          ),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.date_range,
                                  color: Colors.white, size: 12.0),
                              SizedBox(width: 4.0),
                              Text(
                                w.date,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 25,
                          // width: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            // color: Colors.black.withOpacity(0.5)
                          ),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.timer,
                                  color: Colors.white, size: 12.0),
                              SizedBox(width: 4.0),
                              Text(
                                w.time,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )),
                        ),
                      ],
                    ),
                  ],
                )),
            Positioned(
              top: 120.0,
              left: 1.0,
              right: 1.0,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                ),
                width: 500.0,
                height: 35.0,
                child: Text(w.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Opensans',
                        fontSize: 25.0,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ));
}
