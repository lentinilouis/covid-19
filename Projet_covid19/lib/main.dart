// ignore: avoid_web_libraries_in_flutter
import "dart:html";

import "package:flutter/material.dart";
import "package:flutter/rendering.dart";

void main() =>
    runApp(new MaterialApp(title: "Formulaire covid-19", home: FirstPage()));
String txtbienv = "Bienvenue!";
String txtmessage = "Message";
String txtok = "OK";

class FirstPage extends StatelessWidget {
  final ctrnom = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(child: Image.asset('assets/boreal.png')),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 100.0, bottom: 10.0, right: 30.0, left: 20.0),
              child: Container(
                child: Text(
                  txtbienv,
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, bottom: 10.0, right: 30.0, left: 20.0),
              child: Container(
                child: Text(
                  "Pour débuter, veuillez entrer votre nom:",
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
            ),
            TextField(
              controller: ctrnom,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Ex: Lentini Louis"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondPage(ctrnom.text)),
                );
              },
              child: Text("Continuer"),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SecondPage extends StatelessWidget {
  // ignore: non_constant_identifier_names
  String NameValue;
  SecondPage(String ctrnom) {
    this.NameValue = ctrnom;
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Container(
                child: Image.asset('assets/boreal.png'),
              ),
            ),
            Row(
              children: [
                Container(
                  child: Text(
                    txtbienv + NameValue,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Text(
                    "Pour acceder au campus aujourd'hui, tu dois\ncompleter le questionnaire",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                ),
              ],
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdPage(NameValue)),
                );
              },
              child: Text("Compléter le questionnaire"),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ThirdPage extends StatefulWidget {
  String myName;
  ThirdPage(String myName) {
    this.myName = myName;
  }
  @override
  ThirdPageState createState() => ThirdPageState(this.myName);
}

class ThirdPageState extends State<ThirdPage> {
  String myName;
  int happyness = 0; // 0 = null, 1 = unhappy, 2 = medium, etc...
  int days = 0;
  int contacte = 0;
  int sommaire = 0;

  ThirdPageState(String myName) {
    this.myName = myName;
  }
  @override
  Widget build(BuildContext context) {
    if (happyness == 3 || contacte == 2 || days == 2)
      sommaire = 2; // can go in school
    if (happyness == 2 || contacte == 2 || days == 2)
      sommaire = 1; // connot go in school
    if (happyness == 0 || contacte == 0 || days == 0)
      sommaire = 0; // forgot something

    return new Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(child: Image.asset('assets/boreal.png')),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Formulaire COVID-19 pour " + myName + ":",
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("Aujourd'hui, je me sens: "),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                    icon: Icon(Icons.sentiment_very_dissatisfied),
                    iconSize: 50.0,
                    color: happyness == 1 ? Colors.red : Colors.black,
                    onPressed: () {
                      setState(() {
                        happyness = 1;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                    icon: Icon(Icons.sentiment_neutral_outlined),
                    iconSize: 50.0,
                    color: happyness == 2 ? Colors.yellow : Colors.black,
                    onPressed: () {
                      setState(() {
                        happyness = 2;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                    icon: Icon(Icons.sentiment_satisfied_alt_outlined),
                    iconSize: 50.0,
                    color: happyness == 3 ? Colors.green : Colors.black,
                    onPressed: () {
                      setState(() {
                        happyness = 3;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                        "J'ai voyagé hors du Canada\ndans les derniers 14 Jours : ",
                        style: TextStyle(color: Colors.black))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 130.0, right: 15.0),
                  child: IconButton(
                    icon: Icon(Icons.close_rounded),
                    iconSize: 50.0,
                    highlightColor: Colors.red,
                    color: days == 1 ? Colors.red : Colors.black,
                    onPressed: () {
                      setState(() {
                        days = 1;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                    icon: Icon(Icons.done_rounded),
                    iconSize: 50.0,
                    highlightColor: Colors.green,
                    color: days == 2 ? Colors.green : Colors.black,
                    onPressed: () {
                      setState(() {
                        days = 2;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                        "J'ai été en contacte avec un individu\nqui as eu COVID-19 dans les derniers 14 jours:",
                        style: TextStyle(color: Colors.black)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                    icon: Icon(Icons.close_rounded),
                    iconSize: 50.0,
                    color: contacte == 1 ? Colors.red : Colors.black,
                    onPressed: () {
                      setState(() {
                        contacte = 1;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                    icon: Icon(Icons.done_rounded),
                    iconSize: 50.0,
                    color: contacte == 2 ? Colors.green : Colors.black,
                    onPressed: () {
                      setState(() {
                        contacte = 2;
                      });
                    },
                  ),
                ),
              ],
            ),
            RaisedButton(
              onPressed: () {
                if (sommaire == 0) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            "Merci de bien vouloir compléter le formulaire correctement\nCliquer à l'extérieur de la case pour continuer",
                            style: TextStyle(color: Colors.red[300]),
                          ),
                        );
                      });
                }
                if (sommaire == 2) {
                  showAlertDialog2(context);
                }

                if (sommaire == 1) {
                  showAlertDialog1(context);
                }
              },
              child: Text("Soumettre"),
            ),
          ],
        ),
      ),
    );
  }
}

showAlertDialog1(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text(txtok),
    onPressed: () {
      Navigator.of(context).pop(); // dismiss dialog
      FirstPage();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(txtmessage),
    content: Text(
        "Merci d'avoir completer le formulaire\nvous ne pouvez pas rentrer dans le batiment\nÀ la prochaine"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialog2(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text(txtok),
    onPressed: () {
      Navigator.of(context).pop(); // dismiss dialog
      FirstPage();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(txtmessage),
    content: Text(
        "Merci d'avoir completer le formulaire\nvous pouvez rentrer dans le batiment\nÀ la prochaine"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
