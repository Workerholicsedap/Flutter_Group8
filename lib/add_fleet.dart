/*
-----Code By Group 8-----
Name:MUHAMMAD AFIQ BIN ALUSRIZAN
Name :MUHAMMAD SYABIL  BIN ABU BAKAR
Name :MUHAMMAD AMIRUL BIN AZHAR 
*/
import 'home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddFleet extends StatefulWidget {
  const AddFleet({Key? key}) : super(key: key);

  @override
  State<AddFleet> createState() => _AddFleetState();
}

class _AddFleetState extends State<AddFleet> {
  TextEditingController _controllerNo = TextEditingController();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerDate = TextEditingController();
  TextEditingController _controllerLocation = TextEditingController();
  TextEditingController _controllerStatus = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Fleet'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Color.fromARGB(255, 255, 220, 78),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10.0, width: double.infinity),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Fleet Number(Must start with F(number)',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink, width: 2.0)),
                ),
                controller: _controllerNo,
              ),
              const SizedBox(height: 10.0, width: double.infinity),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Fleet Name',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink, width: 2.0)),
                ),
                controller: _controllerName,
              ),
              const SizedBox(height: 10.0, width: double.infinity),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Date Registered',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink, width: 2.0)),
                ),
                controller: _controllerDate,
              ),
              const SizedBox(height: 10.0, width: double.infinity),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Fleet Location',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink, width: 2.0)),
                ),
                controller: _controllerLocation,
              ),
              const SizedBox(height: 10.0, width: double.infinity),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Fleet Status',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink, width: 2.0)),
                ),
                controller: _controllerStatus,
              ),
              ElevatedButton(
                  onPressed: () {
                    Map<String, String> dataToSave = {
                      'fleet_no': _controllerNo.text,
                      'fleet_name': _controllerName.text,
                      'date_registered': _controllerDate.text,
                      'fleet_location': _controllerLocation.text,
                      'fleet_status': _controllerStatus.text,
                    };

                    FirebaseFirestore.instance
                        .collection('FleetManagement')
                        .add(dataToSave);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
