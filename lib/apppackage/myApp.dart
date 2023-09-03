import 'package:flutter/material.dart';

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 194, 231, 219),
      //aAppBar" is the centered bar above the screen
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(child: Container()),
                Expanded(child: Container()),
                Expanded(
                  flex: 3,
                  child: Image.asset(
                    'lib/images/logo1.png',
                  ),
                ),
                Expanded(child: Container()),
                Expanded(child: Container()),
              ],
            ),
            Container(
              //the container responsible for user weight-related settings.
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 50,
              alignment: Alignment.center,
              child: TextField(
                onChanged: (value) {},
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    hintText: "Digite seu peso:"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              //The container responsible for user height-related settings.
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 50,
              alignment: Alignment.center,
              child: TextField(
                onChanged: (value) {},
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    hintText: "DIgite sua altura:"),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(146, 255, 255, 255))),
              child: const Text(
                "Calcular",
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
