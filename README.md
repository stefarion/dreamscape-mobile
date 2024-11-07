# <img src="https://github.com/stefarion/dreamscape-mobile/blob/main/img/Item_Dreamscape_Pass.png" width="40" height="40" /> Dreamscape Mobile
Dreamscape Mobile merupakan versi *mobile* Dreamscape Corner, yaitu E-Commerce yang menyediakan produk *merchandise* dari Honkai: Star Rail. E-Commerce ini terinspirasi dari Honkai Shop yang juga menjual *merchandise game* yang sama. Nama "Dreamscape Corner" di ambil dari nama toko di dalam *game* bernama "Dreamscape Sales Store" yang terletak di Penacony.
<br>
<br>
Daftar Tugas Individu yang telah dikerjakan dapat dilihat di bawah ini.
+ [Tugas 7 Individu](https://github.com/stefarion/dreamscape-mobile?tab=readme-ov-file#tugas-individu-7)
+ [Tugas 8 Individu](https://github.com/stefarion/dreamscape-mobile?tab=readme-ov-file#tugas-individu-8)
<br>

Dibuat oleh,<br>
**Nama:** Stefanus Tan Jaya<br>
**NPM:** 2306152456<br>
**Kelas:** PBP D<br>
<br>
<br>

# Tugas
## Tugas Individu 8
### a. Kegunaan dan Keuntungan `const`

### b. Penggunaan *Row* dan *Column*

### c. Elemen *input* pada *form* proyek ini

### d. Pengaturan *theme* pada proyek ini

### e. Penanganan navigasi pada proyek ini

## Tugas Individu 7
### a. *Stateless Widget*, *Stateful Widget*, dan Perbedaannya
***Stateless widget*** adalah *widget* yang tidak dapat berubah setelah dibuat. Ia akan *override method* `build()` dan mengembalikan sebuah *widget*. Sementara itu, ***stateful widget*** adalah *widget* yang dapat berubah saat *run-time*, yaitu ketika *user* melakukan suatu aksi terhadap dirinya. *Widget* ini akan *override method* `createState()` dan mengembalikan sebuah *state*.<br>

*Stateless widget* tidak bergantung pada perubahan data atau perilaku, tidak memiliki *state*, dan hanya di-*render* sekali saja. `Text` dan `Icon` adalah contoh dari *stateless widget*. *Stateful widget* justru memiliki *state* internal dan dapat di-*render* ulang jika ada perubahan data atau *state*. `Checkbox` dan `Radio Button` adalah contoh dari *stateful widget*.

### b. *Widget* yang digunakan pada proyek ini
Kumpulan *widget* yang saya gunakan, baik dari bawaan Flutter maupun dari rancangan saya sendiri bisa dilihat sebagai berikut.
+ *Widget* bawaan Flutter
1. `MaterialApp`, berfungsi sebagai pengaturan dasar dan penyedia struktur proyek Flutter.
2. `StatelessWidget` yang diterapkan pada `MyApp`, berfungsi untuk menyusun tampilan statis `MyApp`.
3. `ThemeData`, berfungsi untuk menyimpan informasi tema proyek, seperti warna, teks, dan lainnya.
4. `ColorScheme`, berfungsi untuk membuat skema warna.
5. `Color`, berfungsi untuk memnentukan warna.
6. `runAPpp`, berfungsi untuk menjalankan proyek Flutter dan menampilkan *widget* utama.
7. `Scaffhold`, berfungsi untuk menyediakan struktur dasar halaman, seperti `AppBar`, *body page*, dan lainnya.
8. `AppBar`, berfungsi sebagai *header* proyek.
9. `Padding`, berfungsi untuk menambah jarak antar konten.
10. `Column`, berfungsi untuk menyusun *widget* secara vertikal.
11. `Row`, berfungsi untuk menyusun *widget* secara horizontal.
12. `Text`, berfungsi untuk menampilkan teks.
13. `GridView`, berfungsi untuk menampilkan `ItemCard` dalam *grid* atau tata letak yang rapi.
14. `Card`, berfungsi untuk menampilkan bentuk layaknya kartu.
15. `Material` dalam `ItemCard`, berfungsi untuk memberikan warna latar belakang dan efek *inkwell*.
16. `ScaffholdMessanger`, berfungsi untuk menampilkan pesan *snackbar* ketika tombol `ItemCard` ditekan.
17. `Icon`, berfungsi untuk menampilkan ikon pada `ItemCard`. 
+ *Widget* rancangan *developer*
1. `MyApp`, berfungsi menginisialisasi dan menjalankan struktur dasar proyek Flutter berserta *home page*.
2. `MyHomePage`, berfungsi sebagai *widget* utama proyek yang menampilkan *home page*.
3. `InfoCard`, berfungsi untuk menampilkan informasi *developer* dalam bentuk kartu dengan *widget* `Card`.
4. `ItemHomePage`, berfungsi untuk menyimpan informasi tiap `ItemCard`.
5. `ItemCard`, berfungsi untuk menampilkan ikon dan nama *item* dari `ItemHomePage` dalam tampilan kotak yang terhubung dengan `GridView`.

### c. Fungsi `setState()` dan variabel yang terdampak
*Method* `setState()` dalam *stateful widget* berfungsi untuk memberi tahu *framework* bahwa  ada perubahan pada *state* internal *widget* yang memerlukan *rebuild* tampilan. Ketika `setState()` dipanggil, Flutter akan memanggil ulang fungsi `build()` untuk memperbarui tampilan berdasarkan nilai terbaru. Variabel yang terpengaruh oleh `setState()` hanya variabel yang *mutable* dan merupakan bagian dari *state*. Contohnya bisa berupa variabel yang menyimpan nilai perubahan tersebut, seperti **counter*, boolean*, dan *list*.

### d. Perbedaan `const` dan `final`
Inisialisasi `const` dan `final` pada variabel sama-sama digunakan supaya nilai variabel tersebut tidak berubah. Perbedaan utamanya terdapat bagaimana memori dialokasi. `final` diinisialisasi saat *run-time*, sementara `const` diinisialisasi saat *compile-time*. `const` digunakan untuk nilai yang konstan dan tidak pernah berubah di semua *state* aplikasi. `final` digunakan untuk nilai yang akan diinisialisasi hanya satu kali, tetapi baru tersedia saat aplikasi berjalan, misalnya data dari API.

### e. Proses Implementasi Elemen Dasar Flutter
1. Buat program Flutter baru dengan perintah
    ```
    flutter create dreamscape_mobile
    ```
2. Pada `main.dart`, tetapkan warna latar untuk proyek menjadi
    ```
    ···
    theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialColor(
            0xFF336699,
            <int, Color>{
              50: Color(0xFFe0eaf3),
              100: Color(0xFFb3c9e0),
              200: Color(0xFF80a5cc),
              300: Color(0xFF4d80b8),
              400: Color(0xFF2665a9),
              500: Color(0xFF336699),
              600: Color(0xFF2e5e8a),
              700: Color(0xFF27527a),
              800: Color(0xFF21466a),
              900: Color(0xFF153354),
            },
          ),
        ).copyWith(
          secondary: Color(0xFF336699),
        ),
        scaffoldBackgroundColor: Color(0xFF0e1b4d),
        useMaterial3: true,
      ),
    ···
    ```
3. Ubah `AppBar` pada `menu.dart` untuk mengimplementasikan warna dan menampilkan gambar menjadi
    ```
    ···
    appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('img/Item_Dreamscape_Pass.png'),
        ),
        title: const Text(
          'Dreamscape Mobile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    ···
    ```
4. Di *file* yang sama, buat *class* `ItemHomePage` yang berisi atribut untuk *button*.
    ```
    class ItemHomepage {
        final String name;
        final IconData icon;
        final Color color;

        ItemHomepage(this.name, this.icon, this.color);
    }
    ```
5. Di dalam *class* `MyHomePage`, buat *list of* `ItemHomePage` untuk mendefinisikan atribut ketiga *button* yang ingin ditambahkan (nama, ikon, dan warna yang berbeda).
    ```
    ···
    final List<ItemHomepage> items = [
        ItemHomepage("Lihat Daftar Produk", Icons.store_mall_directory_outlined, Color(0xFF3A7BD5)),
        ItemHomepage("Tambah Produk", Icons.add_circle_outline, Color(0xFF4CAF50)),
        ItemHomepage("Logout", Icons.logout, Color(0xFFF44336)),
    ];
    ···
    ```
6. Buat *class* `ItemCard` untuk menampilkan ketiga *button* tersebut dengan kriteria definisi yang sudah ditetapkan. Gunakan *snackbar* untuk menampilkan pesan "Kamu telah menekan tombol [nama button]!" saat *button* diklik.
    ```
    class ItemCard extends StatelessWidget {
        // Menampilkan kartu dengan ikon dan nama.
        final ItemHomepage item; 
        
        const ItemCard(this.item, {super.key}); 

        @override
        Widget build(BuildContext context) {
            return Material(
            // Menentukan warna latar belakang dari tema aplikasi.
            color: item.color,
            // Membuat sudut kartu melengkung.
            borderRadius: BorderRadius.circular(12),
            
            child: InkWell(
                // Aksi ketika kartu ditekan.
                onTap: () {
                // Menampilkan pesan SnackBar saat kartu ditekan.
                ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                    SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
                    );
                },
                // Container untuk menyimpan Icon dan Text
                child: Container(
                padding: const EdgeInsets.all(8),
                child: Center(
                    child: Column(
                    // Menyusun ikon dan teks di tengah kartu.
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Icon(
                        item.icon,
                        color: Colors.white,
                        size: 30.0,
                        ),
                        const Padding(padding: EdgeInsets.all(3)),
                        Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                        ),
                    ],
                    ),
                ),
                ),
            ),
            );
        }
    }
    ```
7. Untuk merapikan letak *button*, tetapkan *grid* pada `MyHomePage` menjadi
    ```
    ···
    GridView.count(
        primary: true,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        // Agar grid menyesuaikan tinggi kontennya.
        shrinkWrap: true,

        // Menampilkan ItemCard untuk setiap item dalam list items.
        children: items.map((ItemHomepage item) {
            return ItemCard(item);
        }).toList(),
    ),
    ···
    ```