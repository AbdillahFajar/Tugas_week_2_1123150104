import 'dart:io';

double _readNumber(String label) {
  while (true) {
    stdout.write('$label: ');
    final input = stdin.readLineSync();
    if (input == null) continue;
    final value = double.tryParse(input.trim());
    if (value != null) return value;
    print('Input tidak valid. Masukkan angka.');
  }
}

void menu() {
  print('\n=== Kalkulator Sederhana ===');
  print('1) Tambah');
  print('2) Kurang');
  print('3) Kali');
  print('4) Bagi');
  print('5) Keluar');
  stdout.write('Pilih [1-5]: ');
  final pilih = stdin.readLineSync()?.trim();
  if (pilih == '5') {
    print('Bye!');
    return;
  } else if (pilih == '1') {
    print('\nAnda memilih operasi penjumlahan');
  } else if (pilih == '2') {
    print('\nAnda memilih operasi pengurangan');
  } else if (pilih == '3') {
    print('\nAnda memilih operasi perkalian');
  } else if (pilih == '4') {
    print('\nAnda memilih operasi pembagian');
  }
  final a = _readNumber('Masukkan angka pertama');
  final b = _readNumber('Masukkan angka kedua');
  switch (pilih) {
    case '1':
      print('Hasil: ${a + b}');
      break;
    case '2':
      print('Hasil: ${a - b}');
      break;
    case '3':
      print('Hasil: ${a * b}');
      break;
    case '4':
      print('Hasil: ${a / b}');
      break;
    default:
      print('Pilihan tidak dikenal.');
  }
}

void main() {
  while (true) {
    menu();
  }
}
