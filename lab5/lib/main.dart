import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  late double _height;
  late double _width;
  String _result = "Укажите параметры";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(children: [
        Form(
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Ширина (мм):',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                        style: const TextStyle(fontSize: 20),
                        validator: (value) {
                          if (_isNumeric(value)) {
                            return "Укажите правильное значение";
                          }

                          setState(() {
                            _width = double.tryParse(value.toString())!;
                          });
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    'Высота (мм):',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: TextFormField(
                          style: const TextStyle(fontSize: 20),
                          validator: (value) {
                            if (_isNumeric(value)) {
                              return "Укажите правильное значение!";
                            }
                            setState(() {
                              _height = double.tryParse(value.toString())!;
                            });
                          })),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _result =
                            "S = $_width * $_height = ${(_width * _height).toStringAsFixed(3)} (мм2)";
                      });
                    } else {
                      setState(() {
                        _result = "Введите параметры";
                      });
                    }
                  },
                  child: const Text("Вычислить"))
            ],
          ),
          key: _formKey,
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
            color: Color.fromARGB(255, 0, 255, 136),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              _result,
              style: const TextStyle(
                fontSize: 23,
              ),
              textAlign: TextAlign.center,
            ))
      ]),
    );
  }
}

bool _isNumeric(String? str) {
  if (str == null) {
    return false;
  }
  return double.tryParse(str) == null;
}

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Зубко, лаб5",
          ),
        ),
        body: const MyForm(),
      ),
    ));
