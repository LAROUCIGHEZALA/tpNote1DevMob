


//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp/detailnote.dart';
import 'package:flutter/services.dart';

class note extends StatefulWidget{

  @override
  listnote createState() => listnote();


}
class listnote extends State<note> {


  List<String> notes = [];
  late String temp;


  @override
  void initState(){


    notes.add("value0");
    notes.add("value1");

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Note"),
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add,color: Colors.white,size: 35,),
        onPressed: () { 
          showDialog(context: context,
              builder: (BuildContext context){
            return AlertDialog(

              title: Text("add note"),
              content: TextField(
                decoration:   InputDecoration(
                  hintText: "todo"

                ),
                onChanged: (String value){
                  temp=value;
                },
              ),
              actions: [
                ElevatedButton(onPressed: () {
                  setState(() {
                    notes.add(temp);

                  });
                  Navigator.of(context).pop();

                }, child: Text("ADD",style: TextStyle(color: Colors.white),),
                  
                )
              ],

            );

              });
        },

      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: ListView.builder(
          itemCount: notes.length,
            shrinkWrap: true,
            itemBuilder: ( context, index){
            return InkWell(key: Key(notes[index]),
              onLongPress: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('are you sure to deleted?'),
                      actions: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                notes.removeAt(index);
                              });
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.check))
                      ],
                    ));
              },

                child: Card(
                  elevation: 4,
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child:ListTile(
                    onTap: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  detailnote(notes:notes[index],)
                      ));

                    },
                    title: Text(notes[index],
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Colors.black,
                    ),),
                    leading: Icon(
                      Icons.add_home_work,color: Colors.pinkAccent,),

                    ),
                  ),

                );
            }),

      ),


    );
  }







}

