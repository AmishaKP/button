import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
FirebaseFirestore firestore = FirebaseFirestore.instance;
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: button(),));
}
class button extends StatefulWidget {
  const button({Key? key}) : super(key: key);

  @override
  State<button> createState() => _buttonState();
}

class _buttonState extends State<button> {
 void create()async{
   try{
     await firestore.collection('user').doc('testuser').set({
       'firstname' : 'maneesha',
       'lastname' : 'cv',
       'age' : '22',
     });
   }catch(e){
     print(e);
   }
 }
 void update()async{
   try{
     firestore.collection('user').doc('testuser').update({
       'firstname' : 'hridya',
       'age' : '20',
     });
   } catch (e) {
     print(e);
   }
 }
 void read() async {
   DocumentSnapshot documentSnapshot;
   try {
     documentSnapshot = await firestore.collection('user').doc('testuser').get();
     print(documentSnapshot.data());
   } catch (e) {
     print(e);
   }
 }
 void delete() async {
   try {
     firestore.collection('user').doc('testuser').delete();
   } catch (e) {
     print(e);
   }
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter crud with firebase'),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){create();
            }, child: Text('create',style:
              TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.cyanAccent,),)),
            SizedBox(height: 20,),
            TextButton(onPressed: (){update();}, child: Text('update',style:
              TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.cyanAccent,),)),
          SizedBox(height: 20,),
            TextButton(onPressed: (){delete();}, child: Text('delete',style:
            TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.cyanAccent,),)),
            SizedBox(height: 20,),
            TextButton(onPressed: (){read();}, child: Text('read',style:
            TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.cyanAccent,),)),
          ],
        ),
      ),
    );
  }
}

