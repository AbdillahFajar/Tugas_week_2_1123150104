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

//Buat rumus matematika pake fungsi dengan parameter
void penjumlahan(double a, double b) {
  print('Hasil = ${a + b}');
}

void pengurangan(double a, double b) {
  print('Hasil = ${a - b}');
}

void perkalian(double a, double b) {
  print('Hasil = ${a * b}');
}

void pembagian(double a, double b) {
  print('Hasil = ${a / b}');
}

void pembagianBulat(double a, double b) {
  print('Hasil = ${a ~/ b}');
}

void sisaBagi(double a, double b) {
  print('Hasil = ${a % b}');
}

void menu() {
  while (true) {
    print('\n=== Kalkulator Sederhana ===');
    print('1) Penjumlahan');
    print('2) Pengurangan');
    print('3) Perkalian');
    print('4) Pembagian');
    print('5) Pembagian Bulat');
    print('6) Modulus');
    print('7) Keluar');
    stdout.write('Pilih [1-7]: ');
    final pilih = stdin.readLineSync()?.trim();
    if (pilih == '7') {
      print('Bye!');
      return;
    } else if (pilih == '1') {
      print('\nAnda memilih operasi Penjumlahan');
    } else if (pilih == '2') {
      print('\nAnda memilih operasi Pengurangan');
    } else if (pilih == '3') {
      print('\nAnda memilih operasi Perkalian');
    } else if (pilih == '4') {
      print('\nAnda memilih operasi Pembagian');
    } else if (pilih == '5') {
      print('\nAnda memilih operasi Pembagian Bulat');
    } else if (pilih == '6') {
      print('\nAnda memilih operasi Modulus');
    } else{
      print('Pilihan tidak dikenal.');
      return;
    }
    
    final a = _readNumber('Masukkan angka pertama');
    final b = _readNumber('Masukkan angka kedua');

    switch (pilih) {
      case '1':
        penjumlahan(a, b);
        break;
      case '2':
        pengurangan(a, b);
        break;
      case '3':
        perkalian(a, b);
        break;
      case '4':
        pembagian(a, b);
        break;
      case '5':
        pembagianBulat(a, b);
        break;
      case '6':
        sisaBagi(a, b);
        break;
      default:
        print('Menu yang Anda pilih, tidak ada. Silahkan pilih menu yang sesuai.');
    }
  }
}

void main() {
  menu();
}
