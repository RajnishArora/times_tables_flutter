import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:times_tables_flutter/constants.dart';
//import 'dart:math';

void main() {
  runApp(MyTables());
}

class MyTables extends StatefulWidget {
  @override
  _MyTablesState createState() => _MyTablesState();
}

class _MyTablesState extends State<MyTables> {
  int tableOf = 2;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'TABLES',
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 18.0,
              ),
            ),
          ),
          backgroundColor: kPinkColor,
        ),
        body: Column(
          children: [
            Slider(
              activeColor: kPinkColor,
              inactiveColor: kSilverColor,
              min: 2.0,
              max: 20.0,
              value: tableOf.toDouble(),
              onChanged: (newValue) {
                setState(() {
                  tableOf = newValue.toInt();
                });
              },
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Table of $tableOf',
                      style: TextStyle(
                        fontSize: 18.0,
                        //fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: MyTable(tableOf),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTable extends StatelessWidget {
  final int tableOf;
  MyTable(this.tableOf);

  List<TableRow> createTable(tableOf) {
    List<TableRow> rowList = [];
    for (int i = 1; i <= 10; i++) {
      int result = i * tableOf;
      rowList.add(TableRow(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Center(
                child: Text(
                  tableOf.toString(),
                  style: kIntStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Text(
                'X',
                style: kIntStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Text(
                i.toString(),
                style: kIntStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Text(
                '=',
                style: kIntStyle,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Text(
                  result.toString(),
                  style: kIntStyle,
                ),
              ),
            ),
          ]));
    } //end od for loop
    return rowList;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
      child: Table(
        children: createTable(tableOf),
      ),
    );
  }
}
