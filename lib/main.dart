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
    // 1: hapus nilai return

    // 2: parsing nilai a dan b menjadi tipe data double

    // 3: pengkondisian operasi, dan operasikan dengan semestinya, langsung di return

    return 0;
  }

  void tapNumber(String value) {
    // 1: Kondisi jika input masih 0, assign value

    // 2: Jika tidak, concat string
  }

  void tapOperation(String value) {
    // 1: Membagi string inputan menjadi list dan pendefinisian variabel counter operation

    // 2: Melakukan counter dengan menggunakan looping untuk menghitung jumlah operasi

    // 3: Kondisi Jika Operasi Lebih dari 1, Menampilkan pesan tidak bisa menambah operasi

    // 4: Kondisi Jika Operasi tidak tersedia, Tambahkan operasi, refresh tampilan
  }

  void tapResult() {
    // 1: Pengecekan input apakah terdapat operasi

    // 2: Jika ada, bagi string operasi menjadi list dengan delimiter operasi diatas

    // 3: Harus terdapat 2 buah elemen dalam array, lalu panggil fungsi operasi tampung dalam sebuah variabel

    // 4: assign input dengan hasil diatas
  }

  void tapDelete() {
    // 1: Kondisi cek panjang string, jika lebih dari satu, hapus karakter terakhir dari input

    // 2: Jika tidak, assignkan nilai 0 dari input
  }

  void tapClear() {
    // 1: Assignkan input dengan nilai 0
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            // 1: Membuat Widget display dengan parameter input sebagai result
            // 2: Membuat Widget Gridview dengan jumlah 4 kolom
            // 3: Gunakan kondisi untuk mengecek number atau operasi
            // 4: buat widget number dan widget operasi dengan parameter yang sesuai
            // 5: 2 widget number dan operasi diberi gesture agar dapat di klik
            // 6: beri 2 widget tersebut fungsi yang sesuai
            // 5: buat sebuah row untuk operasi final, dan tambahkan fungsi yang sesuai
          ],
        ),
      ),
    );
  }
}
