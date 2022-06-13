
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

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
      home:  HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController phoneController=TextEditingController();


  bool buttonenabled = true;
  bool _isContainerVisible = false;

  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Column(
        children: <Widget>[
          // Badge(
          //   badgeContent: Text("11"),
          //   child: Icon(Icons.phone_callback,size:60,),
          //   badgeColor: Colors.blue,
          // ),
          //
          //
          // SizedBox(height: 5,),
          // GestureDetector(
          //   onTap: (){},
          //   child: Container(
          //     height: 60,
          //     width: 100,
          //     child: ColoredBox(
          //       color: Colors.deepPurple,
          //       child: Center(child: Text("Click")),
          //     ),
          //   ),
          //
          // ),
          _isContainerVisible?Row(
      children: [
      Container(
      margin: EdgeInsets.only(left: 40),
      height: 100,
      width: 360,
      child: Card(
        elevation: 7,
        color: Colors.red,
        child: Container(
            child: Center(child: Text(phoneController.text,))),
      ),
    ),
    SizedBox(width: 6,),
    ],
    ) :
          SizedBox(width: 6,),
          IconButton(
            onPressed: () {
              setState(() {
                _isContainerVisible = !_isContainerVisible;
              });
            },
            icon: Icon(
              Icons.add,
            ),
            iconSize: 40.0,
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 40,top: 20),
                child: Card(
                  color: Colors.yellow,
                  elevation: 5,
                  child: Container(

                    height: 100,
                    width: 350,
                    child: Center(
                      child: Text(phoneController.text,
                        style: TextStyle(color: Colors.white,fontSize: 18),),
                    ),
                  ),
                ),
              ),

            ],
          ),
          TextField(
              controller: phoneController,
              onChanged:(value){
                setState(() {
                  phoneController.text;
                });
              }
          ),
          SizedBox(height: 12,),

          ElevatedButton(onPressed: (){},
              child: Text("Save",style: TextStyle(fontSize: 20),)),
          SizedBox(
            height: 20,
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
// class ColoredContainer extends StatelessWidget {
//
//   ColoredContainer(this._isContainerVisible,);
//   final bool _isContainerVisible;
//   TextEditingController phoneController=TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Center (
//         child: AnimatedContainer (
//             duration: Duration(seconds: 0),
//             color: Colors.red,
//             height: _isContainerVisible ? 70.0 : 0.0,
//             width: _isContainerVisible ? 400.0 : 0.0,
//             child: _isContainerVisible ?
//               Card(
//                 color: Colors.yellow,
//                 elevation: 5,
//                 child: Container(
//                   margin: EdgeInsets.only(left: 40),
//                   height: 100,
//                   width: 350,
//                   child: Center(
//                     child: Text(phoneController.text,
//                       style: TextStyle(color: Colors.white,fontSize: 18),),
//                   ),
//                 ),
//               ):
//
//
//
//                 Container(color: Colors.yellow,)
//         )
//     );
//   }
//
// }
