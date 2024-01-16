import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quran/quran.dart' as surah;

import 'AudioSurahs.dart';

class AudioSurahnames extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black
        ,
        onPressed: (){},
        child: Text("Muhammad Basit Abbai \n Contact: +923355739701",style: TextStyle(fontSize: 5),),
      ),
      body: SafeArea(
        child: ListView.builder(itemCount: surah.totalSurahCount,itemBuilder: (context,ind){
          return InkWell(
            onTap:(){
              print(ind.toString());
              Get.to(Audiosurah(surahnumber: ind+1));
            },
            child: Card(
              color: Colors.black,
              child: ListTile(
                leading: Icon(Icons.multitrack_audio_sharp,color: Colors.lightGreenAccent,),
                title: Text(
                  surah.getSurahName(ind+1)+" | "+ surah.getSurahNameArabic(ind+1),
                  style: TextStyle(
                    fontSize: 7,
                    color: Colors.white
                ),
                ),
                subtitle: Text(
                    surah.getPlaceOfRevelation(ind+1)+" | "+surah.getVerseCount(ind+1).toString()+" Ayats"
                   , style: TextStyle(
                    fontSize: 5
                ),),
                trailing:Icon(Icons.audiotrack,color: Colors.white30,) ,



              ),
            ),
          );
        }),
      ),
    );
  }

}