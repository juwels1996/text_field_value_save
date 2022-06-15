import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:typing_textshowing_another_field/widget2.dart';
import 'new_file.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController textController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool textenabled = true;
  bool _isContainerVisible = false;
  bool isContainerVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 360,
                child: Card(
                  elevation: 7,
                  color: Colors.yellow,
                  child: Container(
                      child: Center(
                          child: Text(
                    phoneController.text,
                  ))),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _isContainerVisible = !_isContainerVisible;
                  });
                },
                icon: Icon(
                  Icons.add,
                ),
                iconSize: 30.0,
              ),
            ],
          ),


          _isContainerVisible
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 360,
                      child: Card(
                        elevation: 7,
                        color: Colors.red,
                        child: Container(
                            child: Center(
                                child: Text(
                          textController.text,
                        ))),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isContainerVisible = !isContainerVisible;
                              });
                            },
                            icon: Icon(Icons.add)),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _isContainerVisible
                                    ? textController
                                    : emailController;
                              });
                            },
                            icon: Icon(Icons.edit))
                      ],
                    )
                  ],
                )
              : Container(),
          SizedBox(
            height: 12,
          ),
          isContainerVisible
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 360,
                      child: Card(
                        elevation: 7,
                        color: Colors.green,
                        child: Container(
                            child: Center(
                                child: Text(
                          emailController.text,
                        ))),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              _isContainerVisible = _isContainerVisible;
                            },
                            icon: Icon(Icons.add)),
                      ],
                    )
                  ],
                )
              : Container(),
          TextField(
              controller:

                  _isContainerVisible ? textController : phoneController,
              onChanged: (value) {
                setState(() {
                  _isContainerVisible?emailController.text:phoneController;
                  // _isContainerVisible ? phoneController.text:textController.text;
                });
              }),
          SizedBox(
            height: 12,
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 400,
                      color: Colors.white,
                      width: double.infinity,
                      child: AlertDialog(
                        // Retrieve the text the that user has entered by using the
                        // TextEditingController.
                        content: Column(
                          children: [
                            Text(phoneController.text),
                            Text(textController.text),
                            Text(emailController.text),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text(
                "Save",
                style: TextStyle(fontSize: 20),
              )),
          SizedBox(
            height: 20,
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
