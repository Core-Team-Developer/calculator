import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const App(),
    );
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // Definisi Variabel
  List<String> buttons = [
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '.',
    '0',
    '00',
    '+',
  ];

  String input = "0";

  double operation(String a, String b, String operasi) {
    final newA = double.parse(a);
    final newB = double.parse(b);

    switch (operasi) {
      case "+":
        return newA + newB;
      case "-":
        return newA - newB;
      case "x":
        return newA * newB;
      case "/":
        return newA / newB;
      default:
        return newA + newB;
    }
  }

  void tapNumber(String value) {
    setState(() {
      if (input != "0") {
        input += value;
      } else {
        input = value;
      }
    });
  }

  void tapOperation(String value) {
    final list = input.split('');

    int countOperation = 0;

    for (String numb in list) {
      if (int.tryParse(numb) == null) {
        countOperation++;
      }
    }

    if (countOperation > 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
          content: Text(
            "Kalkulator hanya menerima satu operasi",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    } else {
      setState(() {
        bool canAddOperation = list.last != value;
        if (input != "0" && canAddOperation) {
          input += value.toString();
        }
      });
    }
  }

  void tapResult() {
    if (input.contains('+')) {
      final list = input.split('+');
      final result = operation(list.first, list.last, '+');
      setState(() {
        input = result.toString();
      });
    }

    if (input.contains('-')) {
      final list = input.split('-');
      final result = operation(list.first, list.last, '-');
      setState(() {
        input = result.toString();
      });
    }

    if (input.contains('x')) {
      final list = input.split('x');
      final result = operation(list.first, list.last, 'x');
      setState(() {
        input = result.toString();
      });
    }

    if (input.contains('/')) {
      final list = input.split('/');
      final result = operation(list.first, list.last, '/');
      setState(() {
        input = result.toString();
      });
    }
  }

  void tapDelete() {
    setState(() {
      if (input.length > 1) {
        input = input.substring(0, input.length - 1);
      } else {
        input = "0";
      }
    });
  }

  void tapClear() {
    setState(() {
      input = "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Display(result: input),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 4 / 3,
              ),
              itemCount: buttons.length,
              itemBuilder: (context, index) {
                final button = buttons[index];

                if (int.tryParse(button) != null) {
                  return InkWell(
                    onTap: () {
                      tapNumber(button);
                    },
                    child: Number(
                      number: button,
                    ),
                  );
                } else {
                  return InkWell(
                    onTap: () {
                      tapOperation(button);
                    },
                    child: Action(
                      operation: button,
                    ),
                  );
                }
              },
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                      tapClear();
                    },
                    child: const Action(operation: "CLEAR"),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      tapDelete();
                    },
                    child: const Action(operation: "DEL"),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      tapResult();
                    },
                    child: const Action(
                      operation: "=",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Display extends StatelessWidget {
  const Display({Key? key, required this.result}) : super(key: key);
  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Align(
        alignment: Alignment.centerRight,
        child: SelectableText(
          result,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class Number extends StatelessWidget {
  const Number({Key? key, required this.number}) : super(key: key);
  final String number;

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(border: Border.all(width: 1)),
        child: Center(
          child: Text(number),
        ),
      ),
    );
  }
}

class Action extends StatelessWidget {
  const Action({Key? key, required this.operation}) : super(key: key);
  final String operation;

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(border: Border.all(width: 1)),
        child: Center(
          child: Text(operation),
        ),
      ),
    );
  }
}
