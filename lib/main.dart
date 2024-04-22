

// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_oprations/all_st.dart';
import 'package:crud_oprations/checkuser.dart';
import 'package:crud_oprations/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB1EGimSBhxh2kHe27LWE0MeyTVPe4eUUI", // paste your api key here
      appId: "1:58727652061:android:ee9fc5e50b9a18ccbc9934", //paste your app id here
      messagingSenderId: "58727652061", //paste your messagingSenderId here
      projectId: "crud-operation-c96ab", //paste your project id here
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CheckUser(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   static late String studentName, studentId,studentProgramId;
   static late double studentgpa;

  getStudentName(name){
    studentName =name;
  }

  getStudentId(id){
    studentId =id;
  }

  getStudentProgramId(programId){
    studentProgramId =programId;
  }

  getStudentGpa(gpa){
    studentgpa = double.parse(gpa);
  }
   // @override
   // void initState() {
   //   super.initState();
   //   Firebase.initializeApp(
   //     options: const FirebaseOptions(
   //       apiKey: "AIzaSyB1EGimSBhxh2kHe27LWE0MeyTVPe4eUUI", // paste your api key here
   //       appId: "1:58727652061:android:ee9fc5e50b9a18ccbc9934", //paste your app id here
   //       messagingSenderId: "58727652061", //paste your messagingSenderId here
   //       projectId: "crud-operation-c96ab", //paste your project id here
   //     ),
   //   ).whenComplete(() {
   //     print("completed");
   //     setState(() {});
   //   });
   // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Crud Operation"),
        centerTitle: true,
      ),
      body: Column(

        children: [
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
              decoration: InputDecoration(
                label: Text("Name"),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.0,
                  ),
                ),
              ),
              onChanged: (String name) {
                getStudentName(name);
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
              decoration: InputDecoration(
                label: Text("Student Id"),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.0,
                  ),
                ),
              ),
              onChanged: (String id) {
                getStudentId(id);
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
              decoration: InputDecoration(
                label: Text("Study Program Id"),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.0,
                  ),
                ),
              ),
              onChanged: (String programId) {
                getStudentProgramId(programId);
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
              decoration: InputDecoration(
                label: Text("GPA"),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.0,
                  ),
                ),
              ),
              onChanged: (String gpa) {
                getStudentGpa(gpa);
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //create
              ElevatedButton(

                  onPressed: (){
                    createData();
                  },
                  child:Text("Create",style:  TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

                  ),
              ),
              //read
              ElevatedButton(

                  onPressed: (){
                    readData();
                  },
                  child:Text("Read",style:  TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

                  ),
              ),
              //update
              ElevatedButton(

                  onPressed: (){
                    updateData();
                  },
                  child:Text("Update",style:  TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

                  ),
              ),
              //delete
              ElevatedButton(

                  onPressed: (){
                    delete();
                  },
                  child:Text("Delete",style:  TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

                  ),
              ),

            ],
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>Student()));
          }, child: Text("See List",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: logOut,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
   logOut()async{
     FirebaseAuth.instance.signOut().then((value) => {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()))
     });
   }

  void createData() {
    print("created");



    DocumentReference documentReference =
       FirebaseFirestore.instance.collection("MyCollage").doc(studentName);

      // create map
    Map<String,dynamic> st={
      "studentName": studentName,
      "studentId":studentId,
      "studentProgramId":studentProgramId,
      "studentGpa":studentgpa
    };
    documentReference.set(st).whenComplete((){
      print("$studentName created");
    });
  }

  void readData() async{
    print("read");
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("MyCollage").doc(studentName);
    try{


      DocumentSnapshot snapshot = await documentReference.get();
      // Check if the document exists
      if (snapshot.exists) {
        // Extract the data from the document
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

        // Access the "studentName" field directly
        String studentName = data["studentName"];
        String studentId = data["studentId"];
        String studentProgramId = data["studentProgramId"];
        num studentGpa = data["studentGpa"];

        // Use the retrieved data (e.g., print it)
        print("Student name: $studentName");
        print("Student Id: $studentId");
        print("Student Program: $studentProgramId");
        print("Student Gpa: $studentGpa");
      } else {
        print("Document does not exist!");
      }
    }
    on FirebaseException catch (e) {
      print("Error reading data: ${e.message}");
    }


  }

  void updateData() {
    print("updated");

    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("MyCollage").doc(studentName);

    Map<String,dynamic> st={
      "studentName": studentName,
      "studentId":studentId,
      "studentProgramId":studentProgramId,
      "studentGpa":studentgpa
    };
    documentReference.set(st).whenComplete((){
      print("$studentName updated");
    });
  }

  void delete() {
    print("deleted");
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("MyCollage").doc(studentName);

    documentReference.delete().whenComplete(() {
      print("$studentName deleted");
    });

  }
}
