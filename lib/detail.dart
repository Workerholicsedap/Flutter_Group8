/*
-----Code By Group 8-----
Name:MUHAMMAD AFIQ BIN ALUSRIZAN
Name :MUHAMMAD SYABIL  BIN ABU BAKAR
Name :MUHAMMAD AMIRUL BIN AZHAR 
*/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'add_fleet.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fleet Detail"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Color.fromARGB(255, 174, 170, 153),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("FleetManagement")
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  final snap = snapshot.data!.docs;
                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snap.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 572,
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(2, 2),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://drive.google.com/uc?export=view&id=1IzTKW70XGZBxcskTxRyNzj0DXarxhgUo'))),
                              margin: const EdgeInsets.only(left: 0),
                              alignment: Alignment.center,
                              child: Text(
                                "Fleet No : ${snap[index]['fleet_no']}" +
                                    "\nFleet Name : ${snap[index]['fleet_name']}" +
                                    "\nDate Registered : ${snap[index]['date_registered']}" +
                                    "\nFleet Location : ${snap[index]['fleet_location']}" +
                                    "\nFleet Status : ${snap[index]['fleet_status']}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
