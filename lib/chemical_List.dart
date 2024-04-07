import 'package:aiapp/data.dart';
import 'package:aiapp/detail_screen.dart';
import 'package:flutter/material.dart';

class ChemicalList extends StatelessWidget {
  const ChemicalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chemical List'),
      ),
      body: ListView.builder(
          itemCount: chemicalData.length,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(screenData: chemicalData[index])));
              },
              child: Container(
                height: 70,
                width: double.infinity,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chemicalData[index].scientificName,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    Text(chemicalData[index].commanName)
                  ],
                ),
              ),
            );
          }),
    );
  }
}
