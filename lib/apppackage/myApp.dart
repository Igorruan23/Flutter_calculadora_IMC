import 'package:flutter/material.dart';
import 'package:myappimc/apppackage/Imc_calcule.dart';

class myApp extends StatefulWidget {
  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatefulWidget {
  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  final TextEditingController _pesoController = TextEditingController();

  final TextEditingController _alturaController = TextEditingController();

  var calcular = calcularIMC();
  String resultado = '';
  String classificacao = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 194, 231, 219),
        //aAppBar" is the centered bar above the screen
        appBar: AppBar(
          title: const Text('Calculadora IMC'),
        ),

        body: Center(
          //SingleChildScrollView e usado para o app não quebrar quando abre o teclado
          child: SingleChildScrollView(
            reverse: true,
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
                    controller: _pesoController,
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
                    controller: _alturaController,
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
                  onPressed: () {
                    double peso = double.tryParse(_pesoController.text) ?? 0.0;
                    double altura =
                        double.tryParse(_alturaController.text) ?? 0.0;

                    if (peso > 0 && altura > 0) {
                      calcular.calcula(peso, altura);
                      setState(() {
                        var resultado = calcular.resultado.toStringAsFixed(2);
                        var classificacao = calcular.classificacao;
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                title: const Text("IMC resultado"),
                                icon: const Icon(Icons.width_full),
                                content: Card(
                                  elevation: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 177, 232, 241),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: 200,
                                    width: 150,
                                    child: ListView(
                                      children: [
                                        ListTile(
                                          title: Text(
                                            "O imc do usuario e de $resultado",
                                            selectionColor: Colors.blue,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        ListTile(
                                          title: Text(
                                              "classificação: $classificacao",
                                              selectionColor: Colors.blue),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      
                                      },
                                      child: const Text("OK!"))
                                ],
                              );
                            });
                      });
                    } else {
                      {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                "erro ao calcular, ambos os campos devem estar prenchidos com numeros, certifique-se de colocar os campos com numeros")));
                      }
                    }
                  },
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
        ),
      ),
    );
  }
}
