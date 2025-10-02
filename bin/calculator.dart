import 'dart:io';
/*dart:io, adalah library bawaan (core library) dari Dart yang dipakai untuk keperluan I/O (Input/Output) berbasis synchronous & asynchronous. 
  Biasanya dipakai di aplikasi command line (console) atau server (bukan di Flutter UI langsung).*/

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

/*Penjelasan pembuatan fungsi _readNumber secara per baris:
1. Baris 3:
- double, tipe data hasil kembalian fungsi. Jadi, fungsi ini pasti akan mengembalikan nilai double
- tanda undescore (_) di depan tulisan readNumber artinya, fungsi itu bersifat private dan hanya bisa dipakai di file calculator.dart ini saja
- parameter String label, teks yang dipakai sebagai prompt untuk menampilkan tulisan yang dimasukkan di kodingan

2. Baris 4: Loop tanpa batas. Program akan terus mengulang isi loop sampai ada return yang menghentikannya.

3. Baris 5: Menampilkan teks ke layar (CLI), tanpa pindah baris.

4. Baris 6: 
- stdin.readLineSync();, membaca input dari keyboard (CLI (Command Line Interface))
- Hasil inputan akan jadi string. Dan akan jadi null kalau gak ketik apapun, lalu tekan enter
- Final, artinya kalau udah sekali isi, maka gak bisa diubah lagi nilainya

5. Baris 7: Kalau inputnya kosong, lewati loopnya dan mulai lagi dari awal (continue), 
            supaya program gak ngalamin crash kalau user cuma pencet enter tanpa ketik apapun

6. Baris 8:
- input.trim(), hapus spasi di depan atau belakang string (inputan)
- double.tryParse(input.trim()), mencoba mengubah input yang string menjadi tipe data double
- kalau berhasil diubah, hasilnya jadi angka (double)
- kalau gagal, hasilnya akan null

7. Baris 9: Aturan yang menyatakan bahwa, jika parsing (pengubahan) inputan yang string tadi ke tipe data double (double.tryParse(input.trim())) berhasil, 
            maka langsung kembalikan (return) angka itu (value) sekaligus keluar dari fungsi _readNumber

8. Baris 10: Adalah output yang akan keluar jika proses parsing gagal. Dalam kodenya, menurut pandangan amatir seperti saya, output ini dibungkus else, tapi di sini enggak. 
            Karena di blok if (value != null) sudah ada return, jadi, else tidak diperlukan lagi untuk membungkus output tersebut, alasannya adalah supaya kode bisa kelihatan lebih clean (bersih).
            Cara ini bekerja sama halnya dengan jika else diikutsertakan. Jadi gak ada bedanya, mau ada else atau enggak.
*/

//Buat rumus matematika pake fungsi lambda yang dikombinasikan dengan named parameter menggunakan kurung kurawal dan required (wajib diisi)
double penjumlahan({required double a,required double b}) => a + b;

double pengurangan({required double a,required double b}) => a - b;

double perkalian({required double a,required double b}) => a * b;

double pembagian({required double a,required double b}) => a / b;

int pembagianBulat({required double a,required double b}) => a ~/ b;

double sisaBagi({required double a,required double b}) => a % b;

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
//Memanggil fungsi operasi matematikanya, menggunakan aturan named parameter, yaitu menyebutkan nama parameternya dahulu, barulah menyebutkan variabel a dan b sebagai nilainya.
void printResult(pilih) {
  final a = _readNumber('Masukkan angka pertama');
  final b = _readNumber('Masukkan angka kedua');
  switch (pilih) {
    case '1':
      print('Hasil = ${penjumlahan (a: a, b: b)}');
      break;
    case '2':
      print('Hasil = ${pengurangan (a: a, b: b)}');
      break;
    case '3':
      print('Hasil = ${perkalian (a: a, b: b)}');
      break;
    case '4':
      print('Hasil = ${pembagian (a: a, b: b)}');
      break;
    case '5':
      print('Hasil = ${pembagianBulat (a: a, b: b)}');
      break;
    case '6':
      print('Hasil = ${sisaBagi (a: a, b: b)}');
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
