import 'package:flutter/material.dart';
import 'package:labfinal/brain.dart';

class hiddenPasswordsPage extends StatefulWidget {
  const hiddenPasswordsPage({Key key}) : super(key: key);

  @override
  _hiddenPasswordsPageState createState() => _hiddenPasswordsPageState();
}

class _hiddenPasswordsPageState extends State<hiddenPasswordsPage> {
  brain obj = brain();
  var listt = List<Widget>();

  Widget postsUI(String description, String Password){
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.all(15.0),
      child: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(description),
                Text(Password),
              ],),

          ],),),);
  }
  List<Widget> processWidgets(){
    for(int i =0; i<= obj.hiddenPasswordsList().length-1; i+2){
      listt.add(postsUI(obj.hiddenPasswordsList()[i], obj.hiddenPasswordsList()[i+1]),);
    }
    return listt;
  }
  @override
  void initState() {
    super.initState();
    obj.dataProcess();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Passwords Page',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Passwords',
                              style: TextStyle(
                                color: Color(0xff1C6E16),
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                      Column (
                        children: processWidgets(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
