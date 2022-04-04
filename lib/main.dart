import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _name = '';
  bool lightOn = false;
  String? language;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Input Widget"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Write your name here...',
                  labelText: 'Your Name',
                ),
                onChanged: (String value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text('Hello, $_name'),
                          );
                        });
                  },
                  child: Text('Submit')),
              SizedBox(height: 20),
              Switch(
                  value: lightOn,
                  onChanged: (bool value2){
                    setState(() {
                      lightOn = value2;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(lightOn ? 'Light On' : 'Light Off'),
                          duration: Duration(seconds: 1),
                        ));
                  }
              ),
              ListTile(
                leading: Radio<String>(
                  value: 'Dart',
                  groupValue: language,
                  onChanged: (String? value){
                    setState(() {
                      language = value!;
                      showSnackbar();
                    });
                  },
                ),
                title: Text('Dart'),
              ),
              ListTile(
                leading: Radio<String>(
                  value: 'Kotlin',
                  groupValue: language,
                  onChanged: (String? value){
                    setState(() {
                      language = value!;
                      showSnackbar();
                    });
                  },
                ),
                title: Text('Kotlin'),
              ),
              ListTile(
                leading: Radio<String>(
                  value: 'Swift',
                  groupValue: language,
                  onChanged: (String? value){
                    setState(() {
                      language = value!;
                      showSnackbar();
                    });
                  },
                ),
                title: Text('Swift'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void showSnackbar(){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$language selected'),
          duration: Duration(seconds: 1),
        ));
  }
}
