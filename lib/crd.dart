import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class crd extends StatefulWidget {
  final String numbers;
  final List<dynamic> phoneno;
  final int flag;
  const crd ({ Key key, this.numbers,this.phoneno,this.flag }): super(key: key);

  @override
  _crdState createState() => _crdState();
}

class _crdState extends State<crd> {
  int select;



  void initState()
  {
    super.initState();

    select=0;
  }
  setradio(int val)
  {
    setState(() {
      select=val;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:Text("Console",style: TextStyle(fontSize: 30.0),))

      ),

       body: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[

              RadioListTile(
                value: 1,
                groupValue: select,
                title:Text(
                  "Delivery arrived", style: TextStyle(fontSize: 30.0),),
                onChanged: (val) {
                  setradio(val);


                },
              ),
              RadioListTile(
                value: 2,
                groupValue: select,
                title:Text(
                  "Delivery arriving in 15 mins", style: TextStyle(fontSize: 30.0),),
                onChanged: (val) {
                  setradio(val);


                },
              ),
              RadioListTile(
                value: 3,
                groupValue: select,
                title:Text(
                  "Delivery delayed", style: TextStyle(fontSize: 30.0),),
                onChanged: (val) {
                  setradio(val);


                },
              ),





                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Transform.scale(scale:0.7,child:RaisedButton(
                      onPressed: () {

                        mesg(select);
                        call();

                      },

                      child:
                      Stack(
                        children: <Widget>[


                          Transform.scale(scale:1.2,child:Image.asset(
                              'assets/Rectangle_1091.png'),),







                          Positioned(left:40.0,top:7,child:Text("CALL",style: TextStyle(color: Colors.blue,fontSize: 30.0),),),
                        ],
                      ),



                    ),
                    ),


                    Transform.scale(scale:0.7,child:RaisedButton(
                      onPressed: () {




                      },

                      child:
                      Stack(
                        children: <Widget>[


                          Transform.scale(scale:1.2,child:Image.asset(
                              'assets/Rectangle_1091.png'),),







                          Positioned(left:40.0,top:7,child:Text("SMS",style: TextStyle(color: Colors.blue,fontSize: 30.0),),),
                        ],
                      ),



                    ),
                    ),






                  ],
                )

              ],











          )






    );


  }
  showAlertDialog(BuildContext context) {


    AlertDialog alert = AlertDialog(

      content: Stack(
        children: <Widget>[
          Image.asset("assets/bg.png"),

          Positioned(left:100,bottom: 100,child:Transform.scale(scale:1.5,child:Image.asset("assets/SUCCESS!.png"),),),
        ],

      ),


    );  // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  void call()
  { String n;
    const url="https://kxc6wouug8.execute-api.ap-south-1.amazonaws.com/Testing/myop";

    if (widget.flag==0)
      {

        http.post(url,body: json.encode({
          "numbers":widget.numbers
        }),).then((response) => showAlertDialog(context));
      }
    else
      {
        for(n  in widget.phoneno)
          {
            http.post(url,body: json.encode({
              "numbers":n
            }),);
          }
        showAlertDialog(context);

      }

  }
  void mesg(int x)
  {
    String url="https://1l46z2ftn3.execute-api.ap-south-1.amazonaws.com/Testing/msgfromapp";
    if (x==1){http.post(url,body: json.encode({
      "msg":"Delivery Arrived"
    }),).then((response) => print('DOne'));}

    if (x==2){http.post(url,body: json.encode({
      "msg":"Delivery Arriving in 15 minutes"
    }),);}

    if (x==3){http.post(url,body: json.encode({
      "msg":"Delivery Delayed"
    }),);}
  }
}
