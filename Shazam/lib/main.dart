import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:super_app/charts.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
runApp(Login());

  runApp( MaterialApp(
    title: 'Named Route Navigation',
    theme: ThemeData(
      // This is the theme of your application.
      primarySwatch: Colors.blue,
    ),
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => Login(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => ContainerDemo(),
      '/third': (context) => Library(),
    },
  ));
}

class Login extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
   Login({Key key, String appTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Login';

    DatabaseReference DatabaseReference_testRef;
    return MaterialApp(
      title: appTitle,
      home: Scaffold(

        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.account_circle_rounded,
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.pushNamed(context, '/second');
            DatabaseReference_testRef = FirebaseDatabase.instance.ref().child("test");
            var _testRef;
            _testRef.set("Hello world ${Random().nextInt(100)}");
          },
        ),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.email_rounded),
              hintText: 'Enter your e-mail',
              labelText: 'E-Mail',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter valid email';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: const Icon(Icons.lock_rounded),
              hintText: 'Enter your password',
              labelText: 'Password',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter valid password';
              }
              return null;
            },

          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('NEXT'),
            ),
          ),
        ],
      ),
    );
  }
}


class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.blue,
        ),
        onPressed: (){
          Navigator.pop(context);
        },
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color(0xFF2979FF),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(16),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 10,
                  left: 10,
                  child:  IconButton(

                    icon: const Icon(Icons.my_library_music_rounded),
                    onPressed: (){
                      Navigator.pushNamed(context, '/third');
                    },
                    iconSize: 36,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child:  IconButton(

                    icon: const Icon(Icons.bar_chart_rounded),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Charts()),
                      );
                    },
                    iconSize: 36,
                    color: Colors.white,
                  ),
                ),
                Card(
                  elevation: 12,
                  shape: CircleBorder(
                      side: BorderSide(
                          width: 100,
                          color: Colors.transparent
                      )
                  ),
                  color: Colors.white,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60.0, vertical: 60),
                      decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Tap to Shazam',
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(color: Colors.white, fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 85,
                  right: 140,
                  child: Icon(
                    Icons.search,
                    size: 36,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class Library extends StatelessWidget {
  Library({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.blue,
            ),
          onPressed: (){
            Navigator.pop(context);
          },
          backgroundColor: Colors.white,
        ),
        appBar: AppBar(title: Text("Shazams"), backgroundColor: Colors.blue,),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(3.0, 12.0, 3.0, 12.0),
          children: <Widget>[
            ProductBox(
                name: "Honey",
                artist: "Kehlani",
                time: "14 Apr, 19:01",
                image: "honey.jpg"
            ),
            ProductBox(
                name: "Dis-ease",
                artist: "BTS",
                time: "10 Apr, 13:56",
                image: "Dis-ease.png"
            ),
            ProductBox(
                name: "Still with You",
                artist: "Jungkook",
                time: "10 Apr, 13:54",
                image: "swy.jpg"
            ),
            ProductBox(
                name: "Wind FLower",
                artist: "MAMAMOO",
                time: "10 Apr, 13:52",
                image: "wf.jpg"
            ),
            ProductBox(
                name: "Yellow",
                artist: "Coldplay",
                time: "10 Apr, 13:51",
                image: "yellow.jpg"
            ),
          ],
        )
    );
  }
}
class ProductBox extends StatelessWidget {
  ProductBox({Key key, this.name, this.artist, this.time, this.image}) :
        super(key: key);
  final String name;
  final String artist;
  final String time;
  final String image;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 110,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset("assets/" + image),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                  this.name, style: TextStyle(
                                  fontWeight: FontWeight.bold
                              )
                              ),
                              Text(this.artist), Text(this.time.toString()
                              ),
                            ],
                          )
                      )
                  )
                ]
            )
        )
    );
  }
}



