import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("Students"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("MyCollage").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final studentList = snapshot.data!.docs
              .map((doc) => doc.data() as Map<String, dynamic>)
              .toList();

          return ListView.builder(
            itemCount: studentList.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> studentData = studentList[index];
              return Row(
                children: [
                  Expanded(
                    child: Text(studentData["studentName"]),
                  ),
                  Expanded(
                    child: Text(studentData["studentId"]),
                  ),
                  Expanded(
                    child: Text(studentData["studentProgramId"]),
                  ),
                  Expanded(
                    child: Text(studentData["studentGpa"].toString()),
                  ),



                ],
              );
            },
          );
        },
      ),
    );
  }
}
