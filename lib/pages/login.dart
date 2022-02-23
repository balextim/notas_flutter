import 'package:flutter/material.dart';
import 'package:notas_flutter/controller/google_auth.dart';
import 'package:notas_flutter/pages/homepage.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/cover.png")
                  )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
              child: Text("Crea una nota", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50.0
              ),
              child: ElevatedButton(onPressed:(){signInWithGoogle(context);}, child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Continuar", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  SizedBox(width: 10.0,)
                ],
              ),
              style:  ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey[700]), padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12.0))
              ),
              ),
            ),
            SizedBox(
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }
}