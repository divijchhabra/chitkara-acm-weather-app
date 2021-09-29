import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String enteredCity = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(onPressed:(){
                Navigator.pop(context);
              },icon: Icon(Icons.arrow_back_ios)),
            ),
          ),

          SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              height: 50,
              width: 300,
              color: Colors.white,
              child: TextField(
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                onChanged: (val) {
                  setState(() {
                    enteredCity = val;
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Enter city Name',
                    hintStyle: TextStyle(color: Colors.black)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FlatButton(
            color: Colors.red,
            child: Container(
              width: 200,
              height: 50,
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  Text(
                    'Get Weather',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
            onPressed: () {
              Navigator.pop(context, enteredCity);
            },
          )
        ],
      ),
    );
  }
}
