# <img src="https://github.com/stefarion/dreamscape-mobile/blob/main/img/Item_Dreamscape_Pass.png" width="40" height="40" /> Dreamscape Mobile
Dreamscape Mobile merupakan versi *mobile* Dreamscape Corner, yaitu E-Commerce yang menyediakan produk *merchandise* dari Honkai: Star Rail. E-Commerce ini terinspirasi dari Honkai Shop yang juga menjual *merchandise game* yang sama. Nama "Dreamscape Corner" di ambil dari nama toko di dalam *game* bernama "Dreamscape Sales Store" yang terletak di Penacony.
<br>
<br>
Daftar Tugas Individu yang telah dikerjakan dapat dilihat di bawah ini.
+ [Tugas 7 Individu](https://github.com/stefarion/dreamscape-mobile?tab=readme-ov-file#tugas-individu-7)
+ [Tugas 8 Individu](https://github.com/stefarion/dreamscape-mobile?tab=readme-ov-file#tugas-individu-8)
+ [Tugas 9 Individu](https://github.com/stefarion/dreamscape-mobile?tab=readme-ov-file#tugas-individu-9)
<br>

Dibuat oleh,<br>
**Nama:** Stefanus Tan Jaya<br>
**NPM:** 2306152456<br>
**Kelas:** PBP D<br>
<br>
<br>

# Tugas
## Tugas Individu 9
### a. Pentingnya model untuk pengambilan atau pengiriman data JSON?
Model diperlukan untuk pengambilan atau pengiriman data JSON, yaitu
+ Membuat data lebih mudah dipahami dan diakses karena data JSON dikonversi menjadi objek dengan atribut terstruktur.
+ Memastikan data sesuai dengan format dan tipe yang ditetapkan.
+ Dapat digunakan kembali (*reusability*) untuk berbagai bagian aplikasi lain, sehingga tidak perlu *parsing* JSON di tiap tempat.

Tidak membuat model tidak selalu menyebabkan *error*, namun kekurangannya
+ Kesulitan *maintenance* proyek.
+ Data JSON harus diproses dan dipetakan manual.
+ Data lebih sulit diakses dan rawan kesalahan tipe data.

### b. Fungsi *library* `http`
Secara umum, *library* `http` digunakan untuk
+ Melakukan HTTP *request*, seperti `GET`, `POST`, `PUT`, `PATCH`, dan `DELETE` ke *server*.
+ Menerima dan memproses data dari API dalam bentuk JSON atau bentuk lain.
+ Mengirim data dalam bentuk JSON atau lainnya ke API (*server*).
+ Mengelola fungsi koneksi jaringan, termasuk *timeout* dan *error* (404, 500, dll).

Dalam proyek ini, `http` digunakan untuk *fetch* data dari *server* Django proyek sebelumnya (Dreamscape Corner) yang berisi informasi produk dalam bentuk JSON. Informasi produk tersebut akan ditampilkan pada halaman `Product List` pada proyek Flutter ini.

### c. Fungsi dan Pentingnya `CookieRequest`
`CookieRequest` adalah bagian dari *library* `pbp_django_auth` yang digunakan proyek Flutter untuk terhubung dengan *backend* pada proyek Django. Fungsi utama `CookieRequest` antara lain
+ Mengelola otentikasi berbasis *cookie* (contohnya `csrf_token`) yang menyimpan sesi *login user*.
+ Menyertakan *cookie* ke dalam *header* setiap *request* HTTP untuk memastikan *server* memvalidasi *user*.
+ Menggunakan `POST` dan `GET` untuk mengakses API *backend* Django sambil mengingat sesi *user*.

Alasan *instance* `CookieRequest` perlu dibagikan ke semua komponen antara lain
+ Menjaga konsistensi sesi *user* karena seluruh komponen butuh *instance* atau status *login* yang sama.
+ Kemudahan melakukan *request* HTTP tanpa perlu mengelola *cookie* secara manual.
+ Menghindari duplikasi data, sehingga aplikasi dapat mengelola sesi cukup dari satu sumber data otentikasi dan *cookie*.

### d. Mekanisme pengiriman data dari *input* sampai dapat ditampilkan
1. *User* memasukkan data melalui *form* misalnya di *interface* Flutter.
2. Data yang di-*input* dikirim ke server melalui `http` maupun `CookieRequest` dalam bentuk JSON misalnya.
3. Server Django menerima data *request*, kemudian memprosesnya, seperti menyimpan ke *database*.
4. Server Dango mengembalikan respons dalam bentuk JSON.
5. Flutter menerima respons dari server.
6. Respons berupa JSON dikonversi menjadi objek Dart dengan menggunakan model.
7. Objek Dart dapat ditampilkan pada *interface* Flutter.

### e. Mekanisme autentikasi *login*, *register*, dan *logout*
### - *Login*
1. *User* memasukkan *username* dan *password* pada *field interface* Flutter yang tersedia.
2. Data *request* dikirim ke *endpoint login* Django proyek sebelumnya dengan menggunakan `CookieRequest`.
3. Django memverifikasi kredensial *user* dan mengembalikan *cookie* autentikasi jika berhasil (*matched*).
4. Sesi *cookie* disimpan di `CookieRequest` untuk keperluan *request* selanjutnya.
5. Menu utama aplikasi dapat ditampilkan setelah berhasil *login*.
### - *Register*
1. *User* memasukkan informasi akun, seperti *username*, nama lengkap, *email*, dan *password* pada *field interface* Flutter yang tersedia.
2. Data *request* dikirim ke *endpoint register* Django proyek sebelumnya dengan menggunakan `http` atau `CookieRequest`.
3. Django menyimpan data pengguna baru ke *database* dan mengembalikan respons.
4. Flutter menampilkan pesan respons pada *interface* aplikasi.
### - *Logout*
1. Flutter mengirim *request* untuk *logout* ke *endpoint logout* Django proyek sebelumnya dengan menggunakan `CookieRequest`.
2. Django menghapus sesi *user*, kemudian Flutter mengubah status *user* menjadi tidak *login*.
3. *User* diarahkan kembali ke halaman *login*.

### f. Proses Implementasi Integrasi antara Django dan Flutter
1. Untuk memastikan *deployment* proyek Django sebelumya (Dreamscape Corner) berjalan dengan baik, integrasi dalam proyek Flutter ini akan mengarah ke *localhost* `http://127.0.0.1:8000` di mana proyek Django harus diaktifkan terlebih dahulu.
2. Buat *app* `authentication` baru di proyek Django, *download* `django-cors-headers` untuk proyek Django, dan buat fungsi *login* di `views.py`. Jangan lupa tambah *routing* URL di `urls.py`
3. Pada proyek Flutter, *download package* `provider` dan `pbp_django_auth` dan implementasikan pada `main.dart`
    ```
    ···
    @override
    Widget build(BuildContext context) {
      return Provider(
        create: (_) {
          CookieRequest request = CookieRequest();
          return request;
        },
        child: MaterialApp(
          ···
        )
      )
    }
    ```
4. Buat `login.dart` pada folder `screens` sebagai *interface* halaman *login*. Dalam proses *login*, data berupa *username* dan *password* akan dikirim sebagai *request* ke *endpoint login* Django untuk diverifikasi kredensialnya. Flutter akan memproses *response* yang dikembalikan.
    ```
    final response = await request
        .login("http://127.0.0.1:8000/auth/login/", {
      'username': username,
      'password': password,
    });

    if (request.loggedIn) {
      String message = response['message'];
      String uname = response['username'];
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage()),
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
                content:
                    Text("$message Welcome, $uname.")),
          );
      }
    } else {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Login Failed!'),
            content: Text(response['message']),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      }
    }
    ```
5. Buat fungsi *register* pada `authentication/views.py` dan atur *routing* URL pada `authentication/urls.py`.
6. Buat `register.dart` pada folder `screens` sebagai *interface* halaman *register*. Dalam proses *register*, data berupa informasi akun akan dikirim sebagai *request* ke *endpoint register* Django untuk menyimpan akun baru pada *database*. Flutter akan memproses *response* yang dikembalikan.
    ```
    final response = await request.postJson(
        "http://127.0.0.1:8000/auth/register/",
        jsonEncode({
          "username": username,
          "password1": password1,
          "password2": password2,
        }));
    if (context.mounted) {
      if (response['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Successfully registered!'),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const LoginPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to register!'),
          ),
        );
      }
    }
    ```
7. Buat `product_entry.dart` pada folder `models` untuk menyimpan model kustom yang sesuai dengan proyek Django.
    ```
    import 'dart:convert';

    List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

    String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

    class ProductEntry {
        String model;
        String pk;
        Fields fields;

        ProductEntry({
            required this.model,
            required this.pk,
            required this.fields,
        });

        factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
            model: json["model"],
            pk: json["pk"],
            fields: Fields.fromJson(json["fields"]),
        );

        Map<String, dynamic> toJson() => {
            "model": model,
            "pk": pk,
            "fields": fields.toJson(),
        };
    }

    class Fields {
        int user;
        String name;
        int price;
        String description;
        String category;

        Fields({
            required this.user,
            required this.name,
            required this.price,
            required this.description,
            required this.category,
        });

        factory Fields.fromJson(Map<String, dynamic> json) => Fields(
            user: json["user"],
            name: json["name"],
            price: json["price"],
            description: json["description"],
            category: json["category"],
        );

        Map<String, dynamic> toJson() => {
            "user": user,
            "name": name,
            "price": price,
            "description": description,
            "category": category,
        };
    }
    ```
8. Buat `list_products.dart` pada folder `screens` untuk menunjukkan semua produk pada *endpoint* JSON di proyek Django pada proyek Flutter. Gunakan *request* `GET` seperti berikut.
    ```
    ···
    Future<List<ProductEntry>> fetchMood(CookieRequest request) async {
      final response = await request.get('http://127.0.0.1:8000/json/');
      
      // Melakukan decode response menjadi bentuk json
      var data = response;
      
      // Melakukan konversi data json menjadi object ProductEntry
      List<ProductEntry> listProduct = [];
      for (var d in data) {
        if (d != null) {
          listProduct.add(ProductEntry.fromJson(d));
        }
      }
      return listProduct;
    }

    @override
    Widget build(BuildContext context) {
      final request = context.watch<CookieRequest>();
      ···
    }
    ```
9. Buat `product_details.dart` pada folder `screens` untuk menampilkan detail setiap produk pada `list_products.dart`. Untuk menampilkan seluruh detail produk, impor `product_entry.dart` dan asosiasikan setiap *field*.
    ```
    import 'package:flutter/material.dart';
    import 'package:dreamscape_mobile/models/product_entry.dart';

    class ProductDetails extends StatelessWidget {
      final Fields item;

      const ProductDetails({super.key, required this.item});

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          ···
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Category: ${item.category}",
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  "Price: Rp${item.price}",
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  "Description: \n${item.description}",
                  style: const TextStyle(color: Colors.white),
                ),
                ···
    ```
    Buat tombol untuk kembali ke `list_products.dart`
    ```
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
        child: const Text(
        'Back to Product List',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    ```
10. Pada `list_products.dart`, halaman detail produk bisa diakses dengan klik satu produ yang bersangkutan. Kodenya sebagai berikut.
    ```
    ···
    return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (_, index) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetails(item: snapshot.data![index].fields),
            ),
          );
        },
        child: Container(
          ···
        )
      )
    )
    ```
11. Kode pada `list_products.dart` sudah memastikan bahwa daftar produk yang ditampilkan sudah terasosiasi dengan *user* yang sedang *login* karena adanya `CookieRequest` yang menyimpan sesi *user*.
    ```
    Future<List<ProductEntry>> fetchMood(CookieRequest request) async
    ```

## Tugas Individu 8
### a. Kegunaan dan Keuntungan `const`
Inisialiasi `const` digunakan untuk membuat objek bersifat *compile-time constant*, artinya objek tersebut ditentukan saat *compile-time* dan tidak mengalami perubahan selama *run-time*. Kegunaan lainnya ialah menghemat memori. Hal ini dikarenakan objek `const` hanya dibuat sekali saat kompilasi, sehingga terjadi optimasi dan objek dapat digunakan kembali di seluruh aplikasi. Keuntungan penggunaan `const` adalah dapat meningkatkan performa aplikasi dan penggunaan memori yang lebih efisien karena dapat menghindari pembuatan *widget* yang berulang.

`const` sebaiknya digunakan pada *stateless widget* dan nilai tetap yang sudah diketahui waktu kompilasi, seperti warna, margin, *padding*, dan teks statis. Seperti kebalikannya, `const` tidak digunakan pada *stateful widgets* dan nilai dinamis yang dapat berubah saat *run-time*. Contoh penggunaan `const` adalah pada `MyApp` karena berupa *stateless widget*.
```
class MyApp extends StatelessWidget {
  const MyApp({super.key});
···
```

### b. Penggunaan *Row* dan *Column*
*Row* dan *Column* adalah *widget layout* dasar pada Flutter. *Row* digunakan untuk menyusun *widget* secara horizontal, `mainAxisAlignment` untuk mengatur distribusi *widget* secara horizontal, dan `crossAxisAlignment` untuk mensejajarkan *widget* sepanjang sumbu silang (vertikal). Sementara pada *Column*, *widget* disusun secara vertikal, `mainAxisAlignment` untuk mengatur distribusi *widget* secara vertikal, dan `crossAxisAlignment` untuk mensejajarkan *widget* secara horizontal. <br>

Contoh implementasi *Row* dalam proyek ini terletak pada `AppBar` untuk menyetarakan ikon *drawer*, gambar logo dan judul aplikasi secara horizontal.
```
appBar: AppBar(
  title: Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'img/Item_Dreamscape_Pass.png',
          height: 40, // Set the size of your logo
          width: 40,
        ),
      ),
      const SizedBox(width: 8),
      const Text(
        'Dreamscape Mobile',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  backgroundColor: Theme.of(context).colorScheme.primary,
),
```
Contoh implementasi *Column* dalam proyek ini terletak pada `Form` untuk menyetarakan *field*-*field input* secara vertikal.
```
body: Form(
  key: _formKey,
  child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Diisi dengan berbagai field input
···
```

### c. Elemen *input* pada *form* proyek ini
Elemen *input* yang digunakan pada *form* proyek ini hanya `TextFormField` yang berfungsi untuk menerima *input* teks dari *user*. *Input* dalam `TextFormField` bisa divalidasi dengan *validator* dan dapat didekorasi, baik model *input* dan bordernya. Beberapa elemen *input* Flutter lain yang belum digunakan pada proyek ini, antara lain `Checkbox`, `Radio`, `Switch`, `Slider`, `DatePicker`, dan  `TimePicker`.<br>

`Checkbox` untuk menerima *input boolean*. `Radio` untuk menerima *input* pilihan tunggal dari opsi-opsi. `Switch` menerima *input boolean* dalam bentuk saklar. `Slider` menerima *input* angka dalam bentuk *slider*. `DatePicker` menerima *input* tanggal. `TimePicker` menerima *input* waktu.

### d. Pengaturan *theme* pada proyek ini
Pengaturan *theme* pada proyek ini terletak di `main.dart` dalam `MaterialApp`. `MaterialApp` sendiri berfungsi sebagai pengaturan dasar dan penyedia struktur proyek Flutter, termasuk *theme* di dalamnya. Dengan demikian, *widget* lain dalam aplikasi akan mengikuti *theme* yang telah ditentukan, sehingga tampilan aplikasi konsisten. Dalam `MaterialApp`, `ThemeData` digunakan untuk mengatur aspek-aspek tema, contohnya warna. Lalu, `ColorScheme` digunakan untuk mengatur skema warna yang lebih terstruktur dan konsisten.
```
···
return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dreamscape Mobile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialColor(
···
```
Cara mengimplementasikan *theme* warna tersebut pada *widget* lain bisa dengan *command*
```
color: Theme.of(context).colorScheme.primary,
```

### e. Penanganan navigasi pada proyek ini
Dalam menangani navigasi dalam proses perpindahan halaman aplikasi, proyek ini memanfaatkan *widget* bawaan Flutter, yaitu `Navigator`. *Widget* ini bekerja layaknya sebuah *stack*. Setiap kali *user* ingin berpindah ke halaman baru, halaman tersebut akan ditambahkan ke *stack* (*push*), dan saat kembali, halaman tersebut dihapus dari *stack* (*pop*). `Navigator` bisa digunakan dalam pembuatan tampilan *Navigation Bar*, seperti *Sidebar* pada proyek ini. Terdapat tiga fungsi `Navigator` yang telah digunakan pada proyek ini, yaitu
1. `Navigator.push` untuk menambahkan *route* baru ke *stack* navigasi.
    ```
    if (item.name == "Tambah Produk") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductEntryFormPage(),
        ),
      );
    }
    ```
2. `Navigator.pop` untuk menghapus *route* teratas dari *stack* navigasi.
    ```
    actions: [
      TextButton(
        child: const Text('OK'),
        onPressed: () {
          Navigator.pop(context);
          _formKey.currentState!.reset();
        },
      ),
    ],
    ```
3. `Navigator.pushReplacement` untuk menganti *route* teratas dengan *route* baru.
    ```
    onTap: () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ));
    },
    ```

### f. Proses Implementasi *Form*, *Input*, *Layout*, dan Navigasi
1. Buat *file* `productentry_form.dart` dan definisikan *class* `_ProductEntryFormPageState` untuk menyimpan *state* dari *form* yang akan dibuat.
2. Buat variabel untuk menyimpan *input* dari masing-masing *field*.
    ```
    class _ProductEntryFormPageState extends State<ProductEntryFormPage> {
      final _formKey = GlobalKey<FormState>();
      String _name = "";
      String _category = "";
      int _amount = 0;
      int _price = 0;
      String _description = "";
    ···
    ```
3. Buat `Form` dan gunakan *widget* `Column` untuk menyetarakan semua *field* secara vertikal.
    ```
    ···
    body: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
    ···
    ```
4. Pakai `TextFormField` yang di-*wrap* oleh `Padding` sebagai tempat pengisian *input* untuk masing-masing *field*.
    ```
    ···
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Enter your product's name",
          labelText: "Product Name",
          hintStyle: TextStyle(color: Color(0xFFE0E0E0), fontFamily: 'Tahoma'),
          labelStyle: TextStyle(color: Colors.white, fontFamily: 'Tahoma'),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
    ···
    ```
5. Validasi isi *input*. Untuk tipe `String` contohnya,
    ```
    ···
    onChanged: (String? value) {
      setState(() {
        _name = value!;
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Product's name can't be empty!";
      }
      if (value.length < 3 || value.length > 255) {
        return "Product's name must be between 3 and 255 characters!";
      }
      if (RegExp(r'[<>()\[\]]').hasMatch(value)) {
        return "Product's name can't contain symbols!";
      }
      return null;
    },
    ···
    ```
    Untuk tipe `int` contohnya,
    ```
    ···
    onChanged: (String? value) {
      setState(() {
        _amount = int.tryParse(value!) ?? 0;
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Amount can't be empty!";
      }
      if (int.tryParse(value) == null) {
        return "Amount must be numbers!";
      }
      if (int.tryParse(value)! < 0) {
        return "Amount can't be negative!";
      }
      return null;
    },
    ···
    ```
6. Buat tombol `Save` yang dapat memunculkan *pop-up* berupa data yang di-*input* pada *form*.
    ```
    ···
    Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
                Theme.of(context).colorScheme.primary),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Product added successfully!'),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Product Name: $_name'),
                          Text('Category: $_category'),
                          Text('Amount: $_amount'),
                          Text('Price: Rp $_price'),
                          Text('Description: $_description'),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.pop(context);
                          _formKey.currentState!.reset();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: const Text(
            "Add Product",
            style: TextStyle(color: Colors.white, fontFamily: 'Tahoma', fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
    ···
    ```
7. Atur navigasi pada `product_card.dart` di mana saat *user* klik tombol `Tambah Produk`, *user* diarahkan ke *form page* untuk menambah produk.
    ```
    ···
    onTap: () {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
        );
        if (item.name == "Tambah Produk") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductEntryFormPage(),
            ),
          );
        }
    ···
    ```
8. Buat *file* `left_drawer.dart` dalam *folder* `widgets` sebagai *sidebar* navigasi ke berbagai halaman di aplikasi dengan menggunakan *widget* `Drawer`. Isinya berupa `DrawerHeader` dan `ListTile` yang akan digunakan untuk *redirection* ke halaman lain pada aplikasi.
9. Buat `ListTile` bernama `Home Page` yang akan mengarahkan *user* ke halaman utama aplikasi.
    ```
    ···
    ListTile(
      leading: const Icon(Icons.home_outlined, color: Colors.white),
      title: const Text(
        'Home Page', 
        style: TextStyle(color: Colors.white, fontFamily: 'Tahoma')
      ),
      // Bagian redirection ke MyHomePage
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ));
      },
    ),
    ···
    ```
10. Buat `ListTile` bernama `Add Product` yang akan mengarahkan *user* ke *form page* tambah produk.
    ```
    ···
    ListTile(
      leading: const Icon(Icons.shopping_cart_sharp, color: Colors.white),
      title: const Text(
        'Add Product', 
        style: TextStyle(color: Colors.white, fontFamily: 'Tahoma')
      ),
      // Bagian redirection ke MoodEntryFormPage
      onTap: () {
        /*
        Routing ke MoodEntryFormPage
        */
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductEntryFormPage(),
            ));
      },
    ),
    ···
    ```

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