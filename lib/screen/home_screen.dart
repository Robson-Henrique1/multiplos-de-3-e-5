import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textControler = TextEditingController();
  String infotext = 'O resultado e';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 220),
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                textAlign: TextAlign.center,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], //
                controller: textControler,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Digite um numero',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
          ),
          Text(infotext, style: const TextStyle(fontSize: 20, color: Colors.white)),
          const SizedBox(height: 30),
          buildButtonRes('Calcular'),
        ],
      ),
    );
  }

  Widget buildButtonRes(String titulo) {
    return GestureDetector(
      onTap: () {
        if(textControler.text == '' || textControler.text == null){
          setState(() {
            infotext = 'Digite um numero';
          });
          return;
        }
        multiplos(textControler);
      } ,
      child: Container(
        margin: const EdgeInsets.all(1),
        width: MediaQuery.of(context).size.width * 0.4,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Center(
            child: Text(
          titulo,
          style: const TextStyle(fontSize: 20, color: Colors.blue),
        )),
      ),
    );
  }

  multiplos(limite) {
    int multiplode3 = 0;
    int multiplode5 = 0;
    int textControlerr = int.parse(textControler.text);
    int i = 0;
    for (i = 0; i < textControlerr; i++) {
      if (i % 3 == 0) multiplode3 += i;
      if (i % 5 == 0) multiplode5 += i;
    }
    setState(() {
      int res = multiplode3 + multiplode5;
      infotext = 'O resultado é: ${res.toStringAsFixed(0)}';
    });
  }
}
