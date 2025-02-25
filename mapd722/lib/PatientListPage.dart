import 'package:flutter/material.dart';

class PatientListPage extends StatefulWidget {
  const PatientListPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PatientListState();
  }
  
}
class _PatientListState extends State<PatientListPage> {
  // Listing some data
  List<Map<String, dynamic>> patients = [
    {'name': 'Patient 1', 'isCritical': false},
    {'name': 'Patient 2', 'isCritical': true},
    {'name': 'Patient 3', 'isCritical': false},
    {'name': 'PAtient 4', 'isCritical': true},
    {'name': 'PAtient 5', 'isCritical': false},
  ];

  void _addPatient() {
    setState(() {
      int newIndex = patients.length + 1;
      patients.add({'name': 'Patient $newIndex', 'isCritical': false});
    });
  }

  // To delete a patient
  void _deletePatient(int index) {
    setState(() {
      patients.removeAt(index);
    });
  }

  void _editPatient(int index) {
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Patient List")),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(18),
          child: 
          Row(
            children: [
            // TextField(
            //   decoration: InputDecoration(
            //     hintText: 'Search',
            //     prefixIcon: Icon(Icons.search),
            //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            // ),
            IconButton(onPressed: ()=> _addPatient(), icon: Icon(Icons.person_add, color: Colors.black))
            ],
        ),),
            Expanded(
              
              child: ListView.builder(
                padding: EdgeInsets.all(18),
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  final patient = patients[index];
                  return Card(
                    color: patient['isCritical'] ? const Color.fromARGB(255, 220, 113, 105) : const Color.fromARGB(255, 230, 230, 230),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(patient['name'] as String, style: TextStyle(fontSize: 20),),
                        Row(children: [
                        IconButton(onPressed: () => _editPatient(index), icon: Icon(Icons.edit, color: Colors.black), iconSize: 30,),
                        IconButton(onPressed: () => _deletePatient(index), icon: Icon(Icons.delete, color: Colors.red,), 
                            iconSize: 30,)
                        ],),
                      ],
                    ),
                  );
                }))
        ],
      ),
    );
  }

}