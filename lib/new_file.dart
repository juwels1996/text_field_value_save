import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isContainerVisible = false;
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(top: 15,)),
              Card(
                elevation: 9,
                shadowColor: Colors.pinkAccent,
                child: Container(
                  height: 70,
                  width: 400,
                  color: Colors.deepPurple,
                  child: Container(
                    transform: Matrix4.rotationZ(0.1),
                    child: Center(
                        child: Text(
                          phoneController.text,
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _isContainerVisible = true;
                  });
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                iconSize: 40.0,
              ),

            ],
          ),
          SizedBox(height: 12,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ColoredContainer(_isContainerVisible),
            SizedBox(
              height: 15,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _isContainerVisible = true;
                });
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              iconSize: 40.0,
            ),
          ],),


          SizedBox(
            height: 15,
          ),

          Container(
            color: Colors.white,
            width: 400,
            margin: EdgeInsets.only(right: 50),
            child: TextField(
                controller: phoneController,
                onChanged: (value) {
                  setState(() {
                    phoneController.text;
                  });
                }),
          ),
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
                          content: Text(phoneController.text),
                        ),
                      );

                  },
                );
              },
              child: Text(
                "Save",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
        ],
      ),
    );
  }
}

class ColoredContainer extends StatelessWidget {
  TextEditingController textEditingController=TextEditingController();
  ColoredContainer(this._isContainerVisible);
  final bool _isContainerVisible;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedContainer(
      duration: Duration(seconds: 1),
      color: Colors.red,
      height: _isContainerVisible ? 70.0 : 0.0,
      width: _isContainerVisible ? 400.0 : 0.0,

    ));
  }
}
