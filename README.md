# Manajemen Deadline Tugas

## Deskripsi Aplikasi

Aplikasi **Manajemen Deadline Tugas** adalah aplikasi berbasis Flutter yang dirancang untuk membantu mahasiswa dalam mencatat dan mengelola tugas perkuliahan.

Melalui aplikasi ini, pengguna dapat menambahkan, mengedit, dan menghapus tugas dengan mudah. Setiap tugas memiliki informasi berupa:

- Mata Kuliah
- Deskripsi Tugas
- Deadline
- Jenis Tugas (Individu, Kelompok, Praktikum, UTS)
- Status (Belum, Sedang Dikerjakan, Selesai)

Aplikasi ini dibuat menggunakan konsep dasar Flutter seperti `StatefulWidget`, `GetX`, `ListView.builder`, serta manajemen state menggunakan `setState()`.

---

## Fitur Aplikasi

- Menambahkan tugas baru  
- Mengedit tugas yang sudah ada  
- Menghapus tugas  
- Menampilkan daftar tugas dalam bentuk Card  
- Status tugas dengan indikator warna  
  - Hijau → Selesai  
  - Merah → Belum / Sedang Dikerjakan  
- Dropdown untuk memilih jenis tugas  
- Dropdown untuk memilih status tugas  
- Navigasi antar halaman menggunakan GetX  

---

## Widget yang Digunakan

### Struktur Dasar
- `MaterialApp`
- `Scaffold`
- `AppBar`
- `Container`
- `Padding`
- `Center`

### Layout
- `Column`
- `Row`
- `SizedBox`
- `ListView.builder`
- `Card`
- `ListTile`

### Input & Form
- `Form`
- `TextFormField`
- `DropdownButtonFormField`
- `TextEditingController`

### Tombol & Navigasi
- `ElevatedButton`
- `ElevatedButton.icon`
- `IconButton`
- `FloatingActionButton`
- `Get.to()`
- `Get.back)`

### Styling
- `BoxDecoration`
- `LinearGradient`
- `BorderRadius`
- `OutlineInputBorder`
- `Icon`
- `Colors`

---
