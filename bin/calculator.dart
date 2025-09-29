import 'dart:io';

double _readNumber(String label) {
  while (true) {
    stdout.write('$label: '); 
    final input = stdin.readLineSync(); //Ini untuk sistem membaca inputan yang masuk
    if (input == null) continue; //Jika inputan bukan null, maka lanjut eksekusi hasilnya
    final value = double.tryParse(input.trim()); //Ini untuk eksekusi hasil dari inputan yang dimasukkan
    if (value != null) return value; //Jika hasilnya bukan null, maka tampilkan hasilnya
    print('Input tidak valid. Masukkan angka.'); //Ini bekerja, ketika user mengosongkan atau mengisi inputan selain dari angka
  }
}



void menu() {
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
  }
  else if (pilih == '5') {
    print('\nAnda memilih operasi Pembagian Bulat');
  }
  else if (pilih == '6') {
    print('\nAnda memilih operasi Modulus');
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
    case '5':
      print('Hasil: ${a ~/ b}');
      break;
    case '6':
      print('Hasil: ${a % b}');
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
