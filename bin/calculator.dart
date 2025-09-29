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

//Buat rumus matematika pake fungsi lambda
double penjumlahan(double a, double b) => a + b;

double pengurangan(double a, double b) => a - b;

double perkalian(double a, double b) => a * b;

double pembagian(double a, double b) => a / b;

int pembagianBulat(double a, double b) => a ~/ b;

double sisaBagi(double a, double b) => a % b;

void choosingOption(pilih) {
  if (pilih == '1') {
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
  }
}

void printResult(pilih) {
  final a = _readNumber('Masukkan angka pertama');
  final b = _readNumber('Masukkan angka kedua');
  switch (pilih) {
    case '1':
      print('Hasil =  ${a + b}');
      break;
    case '2':
      print('Hasil =  ${a - b}');
      break;
    case '3':
      print('Hasil =  ${a * b}');
      break;
    case '4':
      print('Hasil =  ${a / b}');
      break;
    case '5':
      print('Hasil =  ${a ~/ b}');
      break;
    case '6':
      print('Hasil =  ${a % b}');
      break;
  }
}

void menu() {
  while (true) {
    //Awal loop
    print('\n=== Kalkulator Sederhana ===');
    print('1) Penjumlahan');
    print('2) Pengurangan');
    print('3) Perkalian');
    print('4) Pembagian');
    print('5) Pembagian Bulat');
    print('6) Modulus');
    print('7) Keluar');
    stdout.write('Pilih [1-7]: '); //Ini mengisi variabel $label yang dibuat di _readNumber
    final pilih = stdin.readLineSync()?.trim();
    choosingOption(pilih);
    /* Membuat aturan logika untuk membatasi pilihan yang dipilih:
       Kalau pilihannya selain dari pilihan 1–6, langsung ke default.*/
    if (pilih == '7') {
      //Start Choosing Option
      print('Bye!');
      return;
    }
    else if (!(["1", "2", "3", "4", "5", "6"].contains(pilih))) {
      print('Menu yang Anda pilih tidak ada. Silahkan pilih menu yang sesuai.');
      continue; // Kembali ke awal loop
    }
    printResult(pilih);
  }
}

void main() {
  menu();
}
