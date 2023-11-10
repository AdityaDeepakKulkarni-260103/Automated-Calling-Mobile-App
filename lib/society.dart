import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'crd.dart';



class society extends StatefulWidget {
  int select;

  void initState()
  {

    select=0;
  }
  @override
  _societyState createState() => _societyState();
}

class _societyState extends State<society> {
  ScrollController sc= new ScrollController();
  bool search=false;

  List data;
  Future <List<Item>> getdata() async
  {
    http.Response response = await http.get( "https://e4b9k9vk27.execute-api.ap-south-1.amazonaws.com/Test/society");
    data=json.decode(response.body);
    print(data);
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
          title: !search?Center(child:Text("Society",style: TextStyle(fontSize: 30.0),))
              :
          TextField(decoration: InputDecoration(hintText: 'Search society',
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
                      subtitle: Column(crossAxisAlignment:CrossAxisAlignment.start,children: <Widget>[Text(" "),Text(" ")],),
                      isThreeLine:true,
                      onTap:() => Navigator.push(context,new MaterialPageRoute(builder: (context) => crd(phoneno: item.phoneno,flag: 1,))),
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
   final List<dynamic> phoneno;
  Item({

    @required   this.headerValue,
    @required   this.phoneno
  });





  factory Item.fromJson(Map<String,dynamic> json)
  {
    return Item(headerValue:json['Society'],phoneno:json['Phoneno']);
  }
}

