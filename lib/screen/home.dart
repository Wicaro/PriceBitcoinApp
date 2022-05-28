// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, import_of_legacy_library_into_null_safe, deprecated_member_use, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:http/http.dart'
as http;
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({
    Key ? key
  }): super(key: key);

  @override
  State < Home > createState() => _HomeState();
}

class _HomeState extends State < Home > {

  String _price = "0";

  _priceBitcoin() async {

    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);
    
    Map<String, dynamic> res = json.decode(response.body);

    setState(() {
      _price = res["USD"]["buy"].toString();
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 9, 24),
      appBar: AppBar(
        title: Text("Price Bitcoin"),
        backgroundColor: Color.fromARGB(255, 3, 9, 24),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Image.asset("images/bitcoin.png", width: 200),
            ),
            Center(
              child:
              Text(
                "\$"+_price,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: FlatButton(
                onPressed: _priceBitcoin,
                color: Color.fromARGB(255, 76, 78, 175),
                child: Text('Update value', style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(side: BorderSide(
                  color: Color.fromARGB(255, 76, 78, 175),
                  width: 1,
                  style: BorderStyle.solid,
                ), borderRadius: BorderRadius.circular(50)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}