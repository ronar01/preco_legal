import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _resultado = "";

  void _getPreco() async{
    String url = "https://blockchain.info/ticker";
    http.Response response;
    response = await http.get(Uri.parse(url));
    Map<String, dynamic> mapa = jsonDecode(response.body);
    setState(() {
      _resultado = mapa["BRL"]["buy"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Image.asset("images/bitcoin.png"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                "R\$ " + _resultado,
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: _getPreco,
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.amber)
                ),
                child: Text("Atualizar", style: TextStyle(fontSize: 20),)
            )

          ],
        ),
      ),
    );
  }
}
