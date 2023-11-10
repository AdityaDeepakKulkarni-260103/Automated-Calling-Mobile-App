import 'package:farmchainfinal/customer.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'customer.dart';
import 'society.dart';
void main() => runApp(MaterialApp(
    home:start()
    )
);
class start extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body: Stack(
          children: <Widget>[
            Center(child:Transform.scale(scale:3,child:Image.asset(
                'assets/bg.jpg'),),),
            Positioned(top:100,left:70,child:Transform.scale(scale:1.3,child:Image.asset(
                'assets/logo.png'),),),
            Positioned(top:300,left:100,child:Transform.scale(scale:1.3,child:RaisedButton(
              onPressed: () {

                Navigator.push(context,new MaterialPageRoute(builder: (context) => customer()));

              },

              child:
              Stack(
                children: <Widget>[


                  Transform.scale(scale:1.3,child:Image.asset(
                      'assets/Rectangle_1091.png'),),







                  Positioned(left:20.0,top:7,child:Text("Customer",style: TextStyle(color: Colors.blue,fontSize: 26.0),),),
                ],
              ),



            ),
            ),
    ),


            Positioned(top:500,left:100,child:Transform.scale(scale:1.3,child:RaisedButton(
              onPressed: () {

                Navigator.push(context,new MaterialPageRoute(builder: (context) => society()));

              },

              child:
              Stack(
                children: <Widget>[


                  Transform.scale(scale:1.3,child:Image.asset(
                      'assets/Rectangle_1091.png'),),







                  Positioned(left:30.0,top:7,child:Text("Society",style: TextStyle(color: Colors.blue,fontSize: 26.0),),),
                ],
              ),



            ),
            ),
            ),




          ],
        ),

    );

  }
}


