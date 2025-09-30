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

//Mengubah isi pada fungsi choosingoption, dari logika if-else ke switch case return
String choosingOption(pilih) {
  switch(pilih)
  {
    case '1':
      return "\nAnda memilih operasi Penjumlahan";
    case '2':
      return "\nAnda memilih operasi Pengurangan";
    case '3':
      return "\nAnda memilih operasi Perkalian";
    case '4':
      return "\nAnda memilih operasi Pembagian";
    case '5':
      return "\nAnda memilih operasi Pembagian Bulat";
    case '6':
      return "\nAnda memilih operasi Modulus";
    case '7':
      print("Bye!");
      exit(0); //Mematikan program
    default:
      return "Menu yang Anda pilih, tidak tersedia. Silahkan pilih menu yang sesuai.";
  }
}

//Fungsi printResult untuk menampilkan hasil dari angka yang dimasukkan user. Fungsi ini menggunakan fungsi void yang tidak mengembalikan nilai (return)
void printResult(pilih) {
  final a = _readNumber('Masukkan angka pertama');
  final b = _readNumber('Masukkan angka kedua');
  switch (pilih) {
    case '1':
      print('Hasil = ${penjumlahan (a, b)}');
      break;
    case '2':
      print('Hasil = ${pengurangan (a, b)}');
      break;
    case '3':
      print('Hasil = ${perkalian (a, b)}');
      break;
    case '4':
      print('Hasil = ${pembagian (a, b)}');
      break;
    case '5':
      print('Hasil = ${pembagianBulat (a, b)}');
      break;
    case '6':
      print('Hasil = ${sisaBagi (a, b)}');
      break;
  }
}

void menu() {
  while (true) { //Memulai loop yang terus menerus dengan while(true)
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
    print(choosingOption (pilih));
    /* Membuat aturan logika untuk membatasi pilihan yang dipilih:
       Kalau pilihannya selain dari pilihan 1–6, langsung balik ke awal loop.*/
    if (!(["1", "2", "3", "4", "5", "6"].contains(pilih))) {
      continue; // Kembali ke awal loop
    }
    printResult(pilih);
  }
}

void main() {
  menu();
}
