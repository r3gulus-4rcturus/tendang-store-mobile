# ⚽ Tendang Store Mobile

**Tendang Store Mobile** adalah aplikasi football shop mobile berbasis **Flutter**.  
Aplikasi ini dibuat sebagai salah satu tugas mata kuliah **Pemrograman Berbasis Platform**.  

🔗 **Versi website dapat diakses di link:**  
https://muhammad-lanang-tendangstore.pbp.cs.ui.ac.id/

---

## 👤 Identitas
- **Nama:** Muhammad Lanang Zalkifla Harits  
- **NPM:** 2406362860  
- **Kelas:** PBP A  

---

## 🚀 Cara Menjalankan Aplikasi


1. Clone repository ini
2. Masuk ke direktori project
   ```bash
   cd tendang_store
   ```
3. Install dependency
   ```bash
   flutter pub get
   ```
4. Jalankan aplikasi
   ```bash
   flutter run
   ```
   Atau untuk web:
   ```bash
   flutter config --enable-web
   flutter run -d chrome
   ```

---

## 📑 Quick Access
- [7️⃣ Jawaban Tugas Individu 7](#7️⃣-jawaban-tugas-individu-7)

---

## 7️⃣ Jawaban Tugas Individu 7

### Question:  
Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

### Answer:  
**Widget tree** adalah struktur hierarki yang membentuk tampilan aplikasi di Flutter. Semua elemen UI tersusun dari widget yang saling berhubungan seperti tree, dimulai dari **root widget** (biasanya `MaterialApp`) hingga ke bagian terkecil seperti `Text` atau `Icon`.  

Hubungan **parent-child** bekerja dengan konsep bahwa widget **parent** menjadi pembungkus (container) yang mengatur tata letak, ukuran, dan posisi dari widget **child**-nya. Sementara itu, child mengikuti batasan (*constraints*) yang diberikan parent dan mewarisi konteks darinya.  

Widget tree bersifat **immutable**, artinya tidak bisa diubah secara langsung. Jika ada perubahan pada state, Flutter akan **membangun ulang (rebuild)** bagian yang berubah agar tampilan tetap konsisten.  

---

### Question:  
Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

### Answer:  
Dalam proyek ini, saya menggunakan beberapa widget utama seperti `MaterialApp`, `Scaffold`, `AppBar`, `Padding`, `Column`, `Row`, `GridView`, `Card`, `Container`, `Text`, `Icon`, `InkWell`, `Material`, `SizedBox`, dan `Center`.  

`MaterialApp` menjadi root yang menyediakan konfigurasi aplikasi, `Scaffold` mengatur struktur halaman dengan `AppBar` dan `Body`, sedangkan `Column` dan `Row` digunakan untuk menyusun elemen secara vertikal atau horizontal. `GridView` menampilkan data dalam bentuk grid.  

Widget seperti `Padding`, `Container`, `SizedBox`, dan `Center` digunakan untuk mengatur posisi dan tampilan. `InkWell` digunakan agar elemen bisa merespons sentuhan, sementara `Text` dan `Icon` menampilkan teks dan ikon di layar.  

---

### Question:  
Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

### Answer:  
`MaterialApp` berfungsi sebagai wadah utama aplikasi yang menerapkan prinsip **Material Design**. Di dalamnya terdapat pengaturan penting seperti tema, routing, navigasi, serta dukungan internasionalisasi.  

Widget ini sering dijadikan **root widget** karena sudah mencakup banyak hal yang dibutuhkan aplikasi modern — seperti pengaturan **tema global**, **navigasi halaman (Navigator)**, dan integrasi dengan elemen-elemen khas Material Design. Dengan satu widget ini, struktur aplikasi menjadi lebih **konsisten, mudah diatur, dan siap digunakan** di berbagai platform.  

---

### Question:  
Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

### Answer:  
`StatelessWidget` digunakan ketika tampilan **tidak perlu berubah** setelah dibuat. Cocok untuk elemen statis seperti teks, ikon, atau informasi yang tidak bergantung pada interaksi pengguna.  

Sebaliknya, `StatefulWidget` digunakan untuk tampilan yang bisa **berubah selama aplikasi berjalan**. Biasanya dipakai untuk elemen yang bergantung pada input pengguna, animasi, atau data dari API.  

Saya akan memilih **StatelessWidget** untuk tampilan sederhana yang tetap sama, dan **StatefulWidget** ketika saya membutuhkan sesuatu yang **dinamis atau interaktif**, seperti form input, counter, atau animasi.  

---

### Question:  
Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

### Answer:  
`BuildContext` adalah objek yang menunjukkan **posisi suatu widget di dalam widget tree**. Dengan context, kita bisa mengakses widget lain di atasnya (*ancestor*) untuk mendapatkan data seperti tema, ukuran layar, atau melakukan navigasi.  

Context penting karena digunakan hampir di setiap fungsi Flutter, misalnya `Theme.of(context)`, `Navigator.of(context)`, atau `ScaffoldMessenger.of(context)`.  

Dalam metode `build`, context berperan untuk **mengakses informasi lingkungan** yang dibutuhkan widget agar bisa menyesuaikan diri dengan tampilan dan perilaku aplikasi secara keseluruhan.  

---

### Question:  
Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

### Answer:  
**Hot reload** memungkinkan kita melihat hasil perubahan kode secara langsung **tanpa kehilangan state** aplikasi yang sedang berjalan. Fitur ini sangat membantu kita saat mengembangkan UI karena hasil perubahan dapat terlihat hampir seketika. **Hot restart** di sisi lain akan **memulai ulang seluruh aplikasi dari awal**, menghapus semua state yang tersimpan, dan menjalankan ulang fungsi `main()`.  

Hot reload digunakan saat kita hanya mengubah tampilan atau layout, sementara hot restart digunakan ketika kita mengubah struktur logika, variabel global, atau kode yang mempengaruhi inisialisasi aplikasi.  

Dengan hot reload, proses development kode menjadi lebih cepat, efisien, dan interaktif dan tentu memudahkan programmer, karena kita tidak perlu menjalankan ulang aplikasi untuk setiap perubahan kecil.  

---
