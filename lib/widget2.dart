

import 'package:flutter/material.dart';
class BottomBar extends StatelessWidget {
  TextEditingController phoneController=TextEditingController();
  static ValueNotifier<String>enteredValue=ValueNotifier("");
  BottomBar(this._isContainerVisible);
  final bool _isContainerVisible;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: enteredValue,

              builder: (BuildContext context,String newValue,Widget ?child){
            return Card(
              elevation: 7,
                shadowColor: Colors.grey,
                child: Container(
                  margin: EdgeInsets.only(left: 0),
                    height: _isContainerVisible ? 70.0 : 0.0,
                    width: _isContainerVisible ? 280.0 : 0.0,
                    color: Colors.red,
                    child: Center(
                        child: Text(newValue)
                    )
                )
            );
              }
              )
        ],
      ),
    );
  }
}
