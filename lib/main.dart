import 'package:flutter/material.dart';

void main() {
  runApp(const KalkulatorApp());
}

class KalkulatorApp extends StatelessWidget {
  const KalkulatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalkulator Sederhana',
      home: const KalkulatorPage(),
    );
  }
}

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  final TextEditingController angka1Controller = TextEditingController();
  final TextEditingController angka2Controller = TextEditingController();

  String hasil = '';

  void hitung(String operasi) {
    try {
      double angka1 = double.parse(angka1Controller.text);
      double angka2 = double.parse(angka2Controller.text);

      double hasilPerhitungan;

      switch (operasi) {
        case '+':
          hasilPerhitungan = angka1 + angka2;
          break;
        case '-':
          hasilPerhitungan = angka1 - angka2;
          break;
        case '*':
          hasilPerhitungan = angka1 * angka2;
          break;
        case '/':
          if (angka2 == 0) {
            setState(() {
              hasil = 'Tidak bisa dibagi dengan 0';
            });
            return;
          }
          hasilPerhitungan = angka1 / angka2;
          break;
        default:
          hasil = 'Operasi tidak valid';
          return;
      }

      setState(() {
        hasil = 'Hasil: $hasilPerhitungan';
      });
    } catch (e) {
      setState(() {
        hasil = 'Input tidak valid. Masukkan angka!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Sederhana'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: angka1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Bilangan pertama',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: angka2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Bilangan kedua',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => hitung('+'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => hitung('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => hitung('*'),
                  child: const Text('×'),
                ),
                ElevatedButton(
                  onPressed: () => hitung('/'),
                  child: const Text('÷'),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Text(
              hasil,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}