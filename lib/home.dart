/*
-----Code By Group 8-----
Name:MUHAMMAD AFIQ BIN ALUSRIZAN
Name :MUHAMMAD SYABIL  BIN ABU BAKAR
Name :MUHAMMAD AMIRUL BIN AZHAR 
*/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'add_fleet.dart';
import 'package:flutter/material.dart';
import 'detail.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fleet Management"),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddFleet()))
                  })
        ],
      ),
      backgroundColor: Color.fromARGB(255, 255, 215, 53),
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
                        height: 70,
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
                              margin: const EdgeInsets.only(left: 15),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${snap[index]['fleet_no']}" +
                                    "\n${snap[index]['fleet_name']}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            InkWell(
                              child: Container(
                                margin:
                                    const EdgeInsets.only(right: 5, top: 10),
                                alignment: Alignment.topRight,
                                child: Text(
                                  snap[index]['fleet_location'],
                                  style: TextStyle(
                                    color: Colors.blue[400],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                              onTap: () {
                                CircularProgressIndicator();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Detail(),
                                  ),
                                );
                              },
                            ),
                            InkWell(
                              child: Container(
                                margin: const EdgeInsets.only(right: 5),
                                alignment: Alignment.centerRight,
                                child: Text(
                                  snap[index]['date_registered'],
                                  style: TextStyle(
                                    color: Colors.blue[400],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                              onTap: () {
                                CircularProgressIndicator();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Detail(),
                                  ),
                                );
                              },
                            ),
                            InkWell(
                              child: Container(
                                margin:
                                    const EdgeInsets.only(right: 5, bottom: 10),
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  snap[index]['fleet_status'],
                                  style: TextStyle(
                                    color: Colors.green[400],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                              onTap: () {
                                CircularProgressIndicator();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Detail(),
                                  ),
                                );
                              },
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
