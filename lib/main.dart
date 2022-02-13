import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

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

  void tapResult() {
    setState(() {
      final result = input.interpret();

      input = result.toString();
    });
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
                String button = buttons[index];
                return InkWell(
                  onTap: () {
                    if (button == 'x') {
                      button = '*';
                    }
                    setState(() {
                      if (input != "0") {
                        input += button;
                      } else {
                        input = button;
                      }
                    });
                  },
                  child: Button(
                    value: button,
                  ),
                );
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
                    child: const Button(value: "CLEAR"),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      tapDelete();
                    },
                    child: const Button(value: "DEL"),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      tapResult();
                    },
                    child: const Button(
                      value: "=",
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

class Button extends StatelessWidget {
  const Button({Key? key, required this.value}) : super(key: key);
  final String value;

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(border: Border.all(width: 1)),
        child: Center(
          child: Text(value),
        ),
      ),
    );
  }
}
