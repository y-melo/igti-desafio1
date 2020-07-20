import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import './objects/accounts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IGTI - Desafio 1',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" Desafio 1"),
        ),
        // body: Container(child:Text("Test"))
        body: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: FlatButton(
            child: Text("Press"),
            onPressed: getList,
            color: Colors.blueAccent,
          ),
        ));
  }

  void getList() async {
    const _accountApi = "/api/accounts";
    var _host = "http://192.168.70.53:3090";
    var _uri = _host + _accountApi;
    final response = await http.get(_uri);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data as List;

      var sum = 0;
      var accCountQT100 = 0;
      var accCountQT100AG33 = 0;
      var agMaxAmmount = result[0]['balance'];
      var agMinAmmount = result[0]['balance'];
      var maxAgencyList = [];
      var eachAgMaxAmmount = 0;
      var sumBiggestAmmountAgencies = 0;
      var replace = true;
      var tempAg;

      result.forEach((element) {
        sum += element['balance'];
        if (element['balance'] >= 100) {
          accCountQT100 += 1;

          if (element['agencia'] == 33) {
            accCountQT100AG33 += 1;
          }
        }

        if (element['balance'] > agMaxAmmount) {
          agMaxAmmount = element['agencia'];
        }
        if (element['balance'] < agMinAmmount) {
          agMinAmmount = element['agencia'];
        }

        maxAgencyList.forEach((account) {
          // If current is in agency this
          // Check if the amount if bigger and update
          if (element['agencia'] == account['agencia']){
            if (element['balance'] > account['ammount']) {
              
              eachAgMaxAmmount = element['balance'];
              tempAg = element['agencia'];
              replace = true;
            } 
            } else {
              replace = false;
          }
        });
        if (maxAgencyList.length == 0) {
          tempAg = element['agencia'];
          eachAgMaxAmmount = element['balance'];
        }
        if (replace) {
          maxAgencyList.add({'agencia': tempAg, 'maxAmount': eachAgMaxAmmount});
        }
      });

      maxAgencyList.forEach((element) {
        sumBiggestAmmountAgencies += element['maxAmount'];
      });

      print("Answer 1 - Balance:" + sum.toString());
      print("Answer 2 - Balance QT 100 :" + accCountQT100.toString());
      print("Answer 3 - Balance QT 100 and Ag:" + accCountQT100AG33.toString());
      print("Answer 4 - Agency greater balance :" + agMaxAmmount.toString());
      print("Answer 5 - Agency lower balance :" + agMinAmmount.toString());
      print("Answer 6 - Sum of Biggest amount :" +
          sumBiggestAmmountAgencies.toString());
    } else {
      print("failed to get stuff");
    }
  }
}
