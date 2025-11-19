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
- [8️⃣ Jawaban Tugas Individu 8](#8️⃣-jawaban-tugas-individu-8)
- [9️⃣ Jawaban Tugas Individu 9](#9️⃣-jawaban-tugas-individu-8)

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

## 8️⃣ Jawaban Tugas Individu 8

### Question:  
Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()` pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

### Answer:  
`Navigator.push()` digunakan untuk **menambahkan halaman baru di atas halaman sebelumnya**, sehingga pengguna masih bisa **kembali ke halaman sebelumnya** menggunakan tombol back. Sedangkan `Navigator.pushReplacement()` akan **mengganti halaman saat ini dengan halaman baru**, jadi halaman lama **tidak bisa dikembalikan lagi**.  

Dalam konteks aplikasi saya, `Navigator.push()` cocok digunakan saat pengguna **berpindah antar halaman yang masih bisa dikunjungi kembali**, seperti dari halaman utama ke halaman form produk. Sementara `Navigator.pushReplacement()` lebih cocok untuk **navigasi satu arah**, misalnya setelah pengguna mengklik home, pengguna langsung diarahkan ke halaman utama tanpa bisa kembali ke halaman sebelumnya.  

---

### Question:  
Bagaimana kamu memanfaatkan hierarchy widget seperti `Scaffold`, `AppBar`, dan `Drawer` untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

### Answer:  
Saya memanfaatkan hierarchy widget ini untuk membuat **struktur halaman yang rapi dan konsisten** di seluruh aplikasi. `Scaffold` menjadi kerangka utama setiap halaman, karena di dalamnya saya bisa menambahkan elemen-elemen seperti `AppBar`, `Drawer`, dan `Body`. `AppBar` saya gunakan untuk menampilkan **judul halaman** dan **ikon navigasi**, sedangkan `Drawer` berfungsi sebagai menu samping agar pengguna bisa berpindah ke halaman lain seperti *Halaman Utama*, atau *Tam* dengan mudah.

---

### Question:  
Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti `Padding`, `SingleChildScrollView`, dan `ListView` saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

### Answer:  
Widget seperti `Padding`, `SingleChildScrollView`, dan `ListView` sangat membantu untuk membuat **tampilan form yang nyaman dan responsif**.  

- `Padding` memberikan **ruang di sekitar elemen**, supaya tidak menempel di tepi layar dan terlihat lebih rapi.  
- `SingleChildScrollView` memungkinkan halaman form **bisa discroll**, terutama ketika form panjang dan layar pengguna kecil.  
- `ListView` berguna kalau kita punya **banyak elemen form dinamis** yang disusun vertikal, karena sudah otomatis mendukung scrolling dan manajemen layout yang efisien.  

Contohnya di aplikasi **Football Shop**, saat membuat halaman *Product Form*, saya membungkus semua `TextFormField` di dalam `SingleChildScrollView`, lalu memberi `Padding` di sekelilingnya agar jaraknya pas dan tidak terlihat sempit.  

---

### Question:  
Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

### Answer:  
Saya menyesuaikan warna tema dengan menggunakan **`ThemeData`** di dalam `MaterialApp`. Dari situ, saya menentukan **primaryColor** nya. Selain itu, saya juga menjaga konsistensi warna di seluruh widget seperti tombol (`ElevatedButton`), ikon, dan `AppBar`. Saya memberi warna dengan hex 0xFF3E75E3.

---

## 9️⃣ Jawaban Tugas Individu 9

### Question:  
Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan `Map<String, dynamic>` tanpa model?

### Answer:  
Model Dart diperlukan agar data yang diterima atau dikirim memiliki **struktur yang jelas**, **type safety**, dan lebih mudah dalam maintenance.

Jika hanya memakai `Map<String, dynamic>`:
- Error berupa salah key atau salah tipe baru terdeteksi saat runtime.
- Null-check harus dilakukan manual.
- Jika struktur JSON berubah, banyak kode lain ikut terdampak.

Dengan model:
- Kesalahan tipe terdeteksi lebih awal.
- Field bisa dibuat `required`.
- Perubahan cukup di satu tempat (`fromJson()`).

---

### Question:  
Apa fungsi package `http` dan `CookieRequest`? Mengapa instance `CookieRequest` perlu dibagikan ke semua komponen?

### Answer:  
- `http` → melakukan request HTTP dasar.  
- `CookieRequest` → mengelola login, session cookie, dan CSRF untuk Django.

Instance `CookieRequest` harus dibagikan ke semua komponen karena ia menyimpan **status autentikasi**. Semua halaman harus memakai instance yang sama agar autentikasi konsisten (semua request-response menggunakan sessionid yang sama contohnya).

---

### Question:  
Jelaskan konfigurasi konektivitas agar Flutter bisa berkomunikasi dengan Django. Apa akibatnya jika salah?

### Answer:  
- **`10.0.2.2` di `ALLOWED_HOSTS`** = agar emulator bisa akses server lokal. Jika salah: Django akan menolak request dari instance flutter.  
- **CORS** = agar request lintas domain diizinkan. Jika salah: request dari flutter diblokir browser.  
- **SameSite/Cookie** = agar session & CSRF tidak diblokir. Jika salah: login/CSRF (saat submit add product) gagal.  
- **Izin internet Android** = agar aplikasi bisa mengakses jaringan. Jika salah: koneksi gagal total.

---

### Question:  
Jelaskan mekanisme pengiriman data dari input hingga tampil di Flutter.

### Answer:  
1. Pengguna mengisi dan memvalidasi form.  
2. Data dikirim ke Django via `request.postJson()`.  
3. Django menyimpan data dan mengirim respons sukses.  
4. Flutter kembali ke halaman utama.  
5. Halaman daftar memuat data terbaru melalui `fetchProduct()` dan menampilkannya.

---

### Question:  
Jelaskan mekanisme autentikasi login, register, dan logout pada Flutter–Django.

### Answer:  
- **Register**: Flutter mengirim data => Django membuat akun => kembali ke halaman login.  
- **Login**: Flutter mengirim kredensial => Django membuat session => `CookieRequest` menyimpan cookie => masuk ke halaman utama.  
- **Logout**: Flutter memanggil logout => Django menghapus session => cookie dihapus => kembali ke halaman login.

---

### Question:  
Jelaskan mekanisme autentikasi login, register, dan logout pada Flutter–Django.

### Answer:  
- **Register**: Flutter mengirim data => Django membuat akun => kembali ke halaman login.  
- **Login**: Flutter mengirim kredensial => Django membuat session => `CookieRequest` menyimpan cookie => masuk ke halaman utama.  
- **Logout**: Flutter memanggil logout => Django menghapus session => cookie dihapus => kembali ke halaman login.

---

### Question:  
Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial).

### Answer:  
1. **Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.**
Di settings.py, saya membuat konfigurasi CORS agar server django dapat menerima request dari flutter. Saya juga menambahkan 10.0.2.2 pada allowed host. Kemudian, saya membuat application baru bernama 'authentication' yang berfungsi sebagai API login, logout, register untuk aplikasi flutter saya. Saya juga membuat endpoint create_product_flutter di main/views.py sebagai API create product dari flutter. Terakhir, saya membuat endpoint proxy_image untuk menangani permasalahan CORS pada gambar.

2. **Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.**
Saya membuat register.dart pada directory /screen sebagai tampilan halaman register. Saya membuat tiga TextFormField untuk menampung tiga field yaitu username, password1, dan password2. Terakhir, pada submit button, saya melakukan request POST ke endpoint /auth/register pada server django yang telah saya deploy di pws.

3. **Membuat halaman login pada proyek tugas Flutter.**
Saya membuat login.dart pada directory /screen sebagai tampilan halaman login. Saya membuat duaTextFormField untuk menampung username dan password. Terakhir, pada submit button, saya melakukan request POST ke endpoint /auth/login pada server django yang telah saya deploy di pws.

4. **Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.**
Pertama-tama, saya melakukan instalasi package provider dan juga pbp_django_auth. Kemudian di main.dart, saya mengimplementasikan Provider sehingga seluruh komponen saya dapat mengakses dan menyimpan cookies lewat instance CookieRequest. Jika di suatu komponen saya membutuhkan cookies tersebut, saya tinggal menambahkan konfigurasi context.watch<CookieRequest>() pada variabel request.

5. **Membuat model kustom sesuai dengan proyek aplikasi Django.**
Saya membuat model product_entry pada directory /models untuk menyimpan field apa saja yang ada pada model product. Saya menggunakan website app.quicktype.io untuk generate model berdasarkan contoh JSON dari product.

6. **Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.** Tampilkan name, price, description, thumbnail, category, dan is_featured dari masing-masing item pada halaman ini (Dapat disesuaikan dengan field yang kalian buat sebelumnya).  
Saya membuat product_entry_list.dart pada directory /screen sebagai tampilan halaman yang berisi daftar semua produk. Untuk mengambil data JSON dari semua produk, saya cukup melakukan fetching ke endpoint /json yang telah saya buat pada tugas yang lalu di server django saya. Setelah fetching, saya kemudian melakukan build widget ProductEntryCard untuk tiap produk. Widget ini terletak di product_entry_card.dart pada directory /widgets da berfungsi untuk menampilkan data untuk setiap produk. 

7. **Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item. Halaman ini dapat diakses dengan enekan salah satu card item pada halaman daftar Item. Tampilkan seluruh atribut pada model item kamu pada halaman ini Tambahkan tombol untuk kembali ke halaman daftar item.**
Saya membuat product_detail.dart pada directory /screen sebagai tampilan halaman yang berisi detail dari suatu produk. Pada halaman daftar item tadi, saya menambahkan Navigator.push() pada atribut onTap pada itemBuilder agar jika masing-masing card product bila diklik akan melakukan navigasi menuju halaman product_detail.dart. Data produk tidak didapat melalui fetching, tetapi dari data produk yang ada pada halaman daftar item. 

8. **Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.**  
Saya memodifikasi endpoint /json di server django untuk melakukan filter apabila terdapat query parameter filter=mine. Saya juga memodifikasi product_entry_list.dart di /screens dengan menambahkan dua button, dimana masing-masing button akan mengubah state filter (all atau mine). Jika tombol My Products ditekan, maka data akan difetch ulang dengan query params filter=mine.
