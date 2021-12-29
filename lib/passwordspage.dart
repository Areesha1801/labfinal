import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class passwordsPage extends StatefulWidget {
  const passwordsPage({Key key}) : super(key: key);

  @override
  _passwordsPageState createState() => _passwordsPageState();
}

class _passwordsPageState extends State<passwordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff69A03A),
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
                              'Orders',
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
                      StreamBuilder (
                        stream: FirebaseDatabase.instance
                            .reference()
                            .child('AcceptedOrders').onChildAdded,
                        builder:
                            (BuildContext context, AsyncSnapshot event) {
                          if (!event.hasData)
                            return  Center(child: Text('No History available'),); //CircularProgressIndicator();
                          Map<dynamic, dynamic> data = event.data.snapshot.value;
                          return Example(data);

                        },
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
  Widget Example(data) {

    String Description;
    String Password;
    for(var i in data.keys){
      if(i == 'Description'){
        Description = data['$i'];
      }else if(i == 'Password'){
        Password = data['$i'];
      }
      // items = data['$i'];
    }
      return postsUI(Description, Password);
  }
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
}
