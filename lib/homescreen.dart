import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key key}) : super(key: key);

  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  var PasswordListWidgets = List<Widget>();
  List data = List();
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: Image.asset('images/img.png'),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Row(
        children: [
      Drawer(
      child: ListView(
      padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Text(
              'Areesha Asif',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text("Add Password"),
            onTap: () {
               addPassword();
            },
          ),
          ListTile(
            title: const Text("Save Passwords to Cloud"),
            onTap: () {
              savePassword();
            },
          ),
          ListTile(
            title: const Text("Show Passwords"),
            onTap: () {
              ShowPasswords();
            },
          ),

        ],
      ),
    ),],),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
                      Center(child: Text(''),),
                      Column(children: PasswordListWidgets,),
                    ],

                  ),
                ),
              ],
            ),
          ),

      ],),
    );
  }


  Future<void> _showFirstDialogue(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context){
      TextEditingController passwordController = TextEditingController();
      return AlertDialog(
        title: Text('First Dialogue Box'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Enter Password',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff69A03A)),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                child: Text('Ok'),
                onTap: (){
                  openSecondDialogueBox();

                },
              ),
              Padding(padding: EdgeInsets.all(8.0)),
            ],
          ),
        ),
      );
    });
  }
  Future<void> _showSecondDialogue(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context){
      TextEditingController passwordController = TextEditingController();
      TextEditingController descriptionController = TextEditingController();
      return AlertDialog(
        title: Text('Second Dialogue Box'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Enter Description',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff69A03A)),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Enter Password',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff69A03A)),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                child: Text('Ok'),
                onTap: (){
                  print('show');
                  saveToDatabase(descriptionController.text, passwordController.text);
                  PasswordListWidgets.add(postsUI(descriptionController.text, passwordController.text));
                  PasswordListWidgets.add(SizedBox(height: 10,),);
                },
              ),
              Padding(padding: EdgeInsets.all(8.0)),
            ],
          ),
        ),
      );
    });
  }
  void saveToDatabase(String d, String pass){
    DatabaseReference ref = FirebaseDatabase.instance.ref();
      var cartData={
        "Description": d,
        "Password": pass,};
      ref.child("Data").push().set(cartData);

    }
  void addPassword() {
    _showFirstDialogue(context);
  }
  void openSecondDialogueBox(){
    _showSecondDialogue(context);
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

  void savePassword() {}

  void ShowPasswords() {}
}
