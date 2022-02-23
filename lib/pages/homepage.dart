import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notas_flutter/pages/addnote.dart';
import 'package:notas_flutter/pages/viewnote.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState()=> _HomePageState();
}

class _HomePageState extends State <HomePage>{

  CollectionReference ref = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).collection('notas');

  List<Color> myColors = [Colors.yellow, Colors.green, Colors.blue, Colors.cyan, Colors.grey, Colors.purple];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNote())).then((value){
            setState(() {
              
            });
          });
        },
        child: Icon(Icons.add, color: Colors.white70,),
      backgroundColor: Colors.grey[700],
      ),
      appBar: AppBar(
        title: Text("Notas", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 32),),
        elevation: 0.0,
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: ref.get(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index){
                  Random random = new Random();
                  Color bg = myColors[random.nextInt(6)];
                  Map data = snapshot.data!.docs[index].data();
                  DateTime mydataTime = data['created'].toDate();
                  String time = DateFormat.yMMMd().add_jm().format(mydataTime);
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ViewNote(data, time, snapshot.data!.docs[index].reference))
                      ).then((value) {
                        setState(() {
                          
                        });
                      });
                    },
                    child: Card(
                      color: bg,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${data['title']}", style:  TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),)
                            ,Container(
                              alignment: Alignment.centerRight,
                              child: Text(time, style: TextStyle(color: Colors.black, fontSize: 20),),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }else{
              return Center(child: Text("Cargando..."),);
            }
          }),
    );
  }
}