import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'crd.dart';

class customer extends StatefulWidget {
  int select;

  void initState()
  {

    select=0;
  }
  @override
  _customerState createState() => _customerState();
}

class _customerState extends State<customer> {
  ScrollController sc= new ScrollController();
  bool search=false;

List data;
  Future <List<Item>> getdata() async
  {
    http.Response response = await http.get("https://e4b9k9vk27.execute-api.ap-south-1.amazonaws.com/Test/connect");
       data=json.decode(response.body);
       List<Item> it = data.map((dynamic item) => Item.fromJson(item)).toList();
       return it;

  }







  @override
  void dispose()
  {
    sc.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !search?Center(child:Text("Customer",style: TextStyle(fontSize: 30.0),))
            :
        TextField(decoration: InputDecoration(hintText: 'Search Customer',
        hintStyle: TextStyle(color: Colors.white)),),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search),
                  onPressed: ()
                  {
                   setState(() {
                     this.search=!this.search;
                   });
                  }


              )
        ],
      ),
      body: FutureBuilder(future: getdata(),
        builder:(BuildContext context,AsyncSnapshot<List<Item>> snapshot)
        {
          debugPrint(snapshot.toString());
          if(snapshot.hasData) {
            List<Item> ite = snapshot.data;
            return ListView(


              controller: sc,
              children: ite.map((Item item )=>
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title:Text(item.headerValue,style: TextStyle(fontSize: 30),) ,
                    subtitle: Column(crossAxisAlignment:CrossAxisAlignment.start,children: <Widget>[Text(item.society,style: TextStyle(fontSize: 20),),Text(" ")],),
                    isThreeLine:true,
                    onTap:() => Navigator.push(context,new MaterialPageRoute(builder: (context) => crd(numbers: item.number,flag: 0,))),
                    trailing:Icon(Icons.apps) ,

                  ),



              ).toList(),

            );
          }

          return Center(child:CircularProgressIndicator());

        },

      )

    );

  }
}



class Item {
  final String headerValue;
  final String society;
  final String number;
Item({

  @required   this.headerValue,
  @required   this.society,
  @required   this.number

});





factory Item.fromJson(Map<String,dynamic> json)
{
  return Item(headerValue:json['Name'],society:json['Society'],number:json['Phoneno']);
}
}

