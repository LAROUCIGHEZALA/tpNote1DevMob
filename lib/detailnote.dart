import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter_tts/flutter_tts.dart';






class detailnote extends StatelessWidget {
  final String notes;
  FlutterTts flutterTts = FlutterTts();

  @override
  void dispose() {

    flutterTts.stop();

  }
  @override
  void onPause() {

    flutterTts.stop();
  }


  Future _speak() async {

    await flutterTts.speak("Bonjour, comment ça va ?");
  }


  detailnote({Key? key,required this.notes}):super(key: key);





  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("detail"),
      ),
      body: Center(
      child:Column(
        children:  [
          const SizedBox(height: 60,),

            Icon(
              Icons.add_home_work,color: Colors.pinkAccent,size:80 ,),
          const SizedBox(height: 20,),

          Text(notes,style: TextStyle(fontSize:40),),
          const SizedBox(height: 20,),
          Text(
            DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()),
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20,),



          ElevatedButton(
            child: Text('Speak'),
            onPressed: () {
              _speak();
            },
          ),


        ],

      ),),
    );
  }


}

