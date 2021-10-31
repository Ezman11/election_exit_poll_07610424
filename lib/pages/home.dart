import 'dart:js';

import 'package:election_exit_poll_07610424/models/api_result.dart';
import 'package:election_exit_poll_07610424/models/item.dart';
import 'package:election_exit_poll_07610424/services/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Item>> _list;

  @override
  void initState() {
    print('_______________');
    super.initState();
    _list = _loadItem();
  }

  Future<List<Item>> _loadItem() async {
    List list = await Api().fetch('exit_poll');
    var _dataList = list.map((item) => Item.fromJson(item)).toList();
    return _dataList;
  }


  Widget _body(){
    return Container(
      child: FutureBuilder<List<Item>>(
        future: _list,
        builder: (context, snapshot) {
          return Column(
            children: [
              Text(_list.toString()),
              Text('AAAAAAA')
            ],
          );
        },
      ),
    );
  }



  Widget _head() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Image.asset(
              'assets/images/vote_hand.png',
              width: 100.0,
            ),
            Text(
              'EXIT POLL',
              style: GoogleFonts.mitr(
                  fontSize: 20.0,
                  color: Colors.grey,
                  shadows: [
                    const Shadow(
                      color: Colors.white,
                      offset: Offset(1.0, 1.0),
                    ),
                  ]),
              textAlign: TextAlign.center,
            ),
            Text('เลือกตั้ง อบต.',
                style: GoogleFonts.mitr(fontSize: 25.0, color: Colors.white)),
            Text('\nรายชื่อผู้สมัครรับเลือกตั้ง',
                style: GoogleFonts.mitr(fontSize: 15.0, color: Colors.white)),
            Text('นายกองค์การบริหารส่วนตำบลเขาพระ',
                style: GoogleFonts.mitr(fontSize: 15.0, color: Colors.white)),
            Text('อำเภอเมืองนครนายก จังหวัดนครนายก',
                style: GoogleFonts.mitr(fontSize: 15.0, color: Colors.white)),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _head(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
