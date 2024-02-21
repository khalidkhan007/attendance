import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class View_all_Student extends StatefulWidget {
  const View_all_Student({super.key});

  @override
  State<View_all_Student> createState() => _View_all_StudentState();
}

class _View_all_StudentState extends State<View_all_Student> {
  final databaseRef = FirebaseDatabase.instance.ref("Post");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Student Recorde",style: GoogleFonts.acme(fontWeight: FontWeight.bold,color: Colors.red),),
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: databaseRef,
              defaultChild: Center(child: CircularProgressIndicator()),
              itemBuilder: (context, snapshot, animation, index) {
                return Card(
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text("Name")),
                      DataColumn(label: Text("Student ID")),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text(snapshot.child("Name").value.toString())),
                        DataCell(Text(snapshot.child("studentid").value.toString())),
                      ]),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
