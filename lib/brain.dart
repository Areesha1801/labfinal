import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var list = List<Widget>();
List hiddenPasswords = List();
List data = List();
class brain{

  void getData(data){
    print(data);
  }
  void dataProcess(){
    for(int i=0; i<= data.length-1; i+2){
      hiddenPasswords.add(data[i]);
      String x;
      String dots = '';
      x = data[i+1];
      for(int j =0; j<=x.length-1; j++){
        dots = "$dots" + "*";
      }
      hiddenPasswords.add(dots);
    }
  }
  List hiddenPasswordsList(){
    return hiddenPasswords;
  }


}