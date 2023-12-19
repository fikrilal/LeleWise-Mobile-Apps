class NotificationHelper {
  static Map<String, String> getDetails(String universalMessage) {
    String deskripsi;
    String tindakan;

    if (universalMessage == "Kolam lele kamu dalam keadaan baik!") {
      deskripsi = 'Suhu air kolam yang terlalu tinggi dapat menimbulkan stres pada ikan dan mengurangi kadar oksigen dalam air. Ini bisa berakibat buruk pada kesehatan ikan dan lingkungan kolam secara keseluruhan.';
      tindakan = 'Untuk mengatasi ini, Anda perlu mengurangi pemaparan kolam terhadap sinar matahari langsung dan menggunakan sistem pendingin air atau menambahkan air dingin secara bertahap untuk menurunkan suhu. Penting juga untuk memastikan bahwa sirkulasi air di dalam kolam berjalan dengan baik agar suhu air dapat tersebar secara merata.';
    } else if (universalMessage == "PH air kolam kamu terlalu tinggi!") {
      deskripsi = 'Kondisi PH yang terlalu tinggi bisa berbahaya bagi ikan, sementara suhu air yang terlalu rendah bisa menyebabkan ikan menjadi tidak aktif dan metabolismenya melambat. Kondisi ini memerlukan penyesuaian yang cepat dan tepat.';
      tindakan = 'Untuk mengatasi tingkat PH yang tidak seimbang, Anda bisa menggunakan bahan kimia khusus untuk kolam atau metode alami. Sementara itu, suhu air yang rendah bisa dinaikkan secara bertahap dengan menggunakan pemanas air. Sangat penting untuk memonitor kondisi kolam secara rutin agar dapat memastikan bahwa kedua faktor ini - PH dan suhu - tetap berada pada level yang ideal untuk kesehatan ikan.';
    } else if (universalMessage == "PH terlalu tinggi & suhu terlalu rendah!") {
      deskripsi = 'Kombinasi suhu air yang terlalu tinggi dan PH yang tidak seimbang dapat menciptakan lingkungan yang tidak sehat untuk ikan. Kondisi ini bisa memicu pertumbuhan alga berlebih dan menyebabkan stres pada ikan.';
      tindakan = 'Menghadapi kondisi di mana PH dan suhu air kolam sama-sama terlalu tinggi membutuhkan tindakan yang cepat dan efektif. Pertama, penggunaan sistem pendingin sangat dianjurkan untuk menurunkan suhu air. Selanjutnya, penyesuaian tingkat PH harus dilakukan dengan hati-hati menggunakan produk yang aman dan direkomendasikan untuk kolam ikan. Selain itu, meningkatkan aerasi di kolam akan membantu dalam menstabilkan suhu dan PH. Penting untuk terus memantau kondisi air dan melakukan penyesuaian yang diperlukan untuk menjaga lingkungan kolam yang sehat.';
    } else if (universalMessage == "Suhu air kolam kamu terlalu tinggi!") {
      deskripsi = 'Suhu air yang meningkat di atas batas normal dapat menimbulkan berbagai masalah. Pertama, suhu yang terlalu tinggi dapat mengurangi kadar oksigen terlarut dalam air, membuat ikan sulit bernapas. Ini juga bisa mempercepat pertumbuhan alga dan mikroorganisme berbahaya lainnya, mengganggu keseimbangan ekologis kolam. Lebih lanjut, suhu tinggi dapat memicu stres pada ikan, mengurangi sistem kekebalan mereka dan meningkatkan kerentanan terhadap penyakit.';
      tindakan = 'Langkah pertama adalah mengevaluasi dan mengurangi sumber pemanasan eksternal, seperti paparan sinar matahari langsung. Jika kolam terletak di area terbuka, pertimbangkan untuk menambahkan penutup atau naungan di atas kolam. Anda juga bisa menggunakan sistem pendingin air atau mengganti sebagian air kolam dengan air yang lebih dingin secara bertahap untuk menghindari shock termal pada ikan. Selain itu, periksa dan pastikan sistem filtrasi dan sirkulasi air berfungsi dengan baik, karena ini membantu mendistribusikan suhu secara merata di seluruh kolam.';
    } else if (universalMessage == "Kolam lele kamu dalam keadaan baik!") {
      deskripsi = 'Ketika kolam lele Anda berada dalam kondisi optimal, itu berarti parameter lingkungan seperti suhu, PH, kualitas air, dan kadar oksigen terlarut berada dalam kisaran yang ideal untuk spesies ikan Anda. Kondisi ini menunjukkan bahwa lingkungan kolam mendukung pertumbuhan dan kesehatan ikan, serta memastikan keseimbangan ekosistem kolam.';
      tindakan = 'Meskipun kolam Anda saat ini dalam keadaan baik, penting untuk menjaga keadaan ini. Rutinlah melakukan pemeriksaan kualitas air, termasuk pengukuran suhu dan PH. Pertahankan kebersihan kolam dengan rutin membersihkan filter dan menghilangkan sisa makanan atau limbah ikan. Jaga keseimbangan nutrisi dengan memberi makan ikan secara teratur dan dalam jumlah yang tepat. Selain itu, pantau kesehatan ikan secara visual untuk tanda-tanda penyakit atau stres.';
    } else if (universalMessage == "Suhu air kolam kamu terlalu rendah!") {
      deskripsi = 'Suhu air yang terlalu rendah dapat memperlambat proses biologis dalam ikan, termasuk metabolisme dan pencernaan. Ini juga bisa mempengaruhi sistem imun ikan, meningkatkan risiko penyakit. Dalam suhu yang ekstrem, ikan dapat menjadi tidak aktif dan kehilangan nafsu makan, yang dapat berdampak buruk pada kesehatan mereka secara keseluruhan.';
      tindakan = 'Untuk menaikkan suhu air, pertama-tama periksa dan atasi sumber dingin, seperti angin atau naungan yang berlebihan. Gunakan pemanas air kolam untuk meningkatkan suhu secara bertahap. Idealnya, perubahan suhu harus dilakukan perlahan untuk menghindari shock termal. Monitor suhu air secara teratur untuk memastikan bahwa suhu tetap berada dalam kisaran yang aman untuk ikan Anda. Selain itu, pastikan isolasi yang baik di sekitar kolam untuk menjaga stabilitas suhu.';
    } else if (universalMessage == "PH terlalu rendah & suhu terlalu tinggi!") {
      deskripsi = 'Kombinasi PH yang terlalu rendah dengan suhu yang terlalu tinggi menciptakan kondisi yang sangat tidak stabil di kolam Anda. PH yang rendah dapat merusak sistem biologis ikan, mengganggu proses reproduksi, dan menyebabkan stres yang berlebihan. Sementara itu, suhu tinggi, seperti yang telah dibahas, menurunkan kadar oksigen dan meningkatkan risiko penyakit. Kondisi ini memerlukan perhatian segera untuk mencegah kerusakan jangka panjang pada ekosistem kolam.';
      tindakan = 'Langkah pertama adalah menurunkan suhu air dengan metode yang telah disebutkan sebelumnya, seperti penggunaan sistem pendingin atau penambahan air dingin. Untuk menaikkan PH, Anda dapat menggunakan bahan kimia khusus kolam yang aman untuk ikan. Lakukan penyesuaian PH dan suhu secara bertahap dan hati-hati untuk menghindari stres tambahan pada ikan. Penting untuk terus memantau kedua parameter ini dan melakukan penyesuaian yang diperlukan untuk menjaga stabilitas lingkungan kolam.';
    } else if (universalMessage == "PH air kolam kamu terlalu rendah!") {
      deskripsi = 'PH air yang terlalu rendah bisa berdampak buruk pada kesehatan ikan dan lingkungan kolam secara keseluruhan. PH yang tidak seimbang dapat mengganggu keseimbangan kimia air, mempengaruhi ketersediaan nutrisi dan mineral penting bagi ikan, serta meningkatkan risiko kondisi yang merugikan seperti penyakit dan pertumbuhan alga yang berlebihan.';
      tindakan = 'Untuk menyesuaikan PH ke level yang lebih aman, gunakan produk penyesuaian PH yang khusus dirancang untuk kolam ikan. Lakukan perubahan ini secara bertahap untuk menghindari perubahan mendadak yang bisa stres pada ikan. Selalu periksa instruksi dan rekomendasi produsen saat menggunakan produk penyesuaian PH. Terus pantau PH dan lakukan penyesuaian secara berkala untuk menjaga stabilitasnya.';
    } else if (universalMessage == "PH dan suhu air kolam kamu terlalu rendah!") {
      deskripsi = 'Kondisi di mana PH dan suhu air kolam sama-sama terlalu rendah menunjukkan lingkungan yang tidak mendukung bagi ikan. Suhu yang rendah dapat memperlambat fungsi biologis ikan dan menurunkan aktivitas mereka, sementara PH rendah bisa berdampak negatif pada kesehatan dan kesejahteraan ikan serta keseimbangan ekosistem kolam.';
      tindakan = 'Mulailah dengan meningkatkan suhu air secara bertahap menggunakan pemanas air kolam. Penting untuk melakukan peningkatan suhu ini secara hati-hati untuk menghindari shock termal pada ikan. Selanjutnya, untuk menyesuaikan PH, tambahkan produk penyesuaian PH yang sesuai dengan kebutuhan kolam Anda. Pastikan untuk melakukan penyesuaian PH secara bertahap dan monitor kondisi air secara rutin untuk memastikan bahwa kedua faktor ini - suhu dan PH - berada dalam kisaran yang aman dan stabil untuk ikan.';
    } else {
      deskripsi = 'Kondisi ini terjadi ketika sistem monitoring Anda tidak dapat mengidentifikasi atau mendeteksi kondisi spesifik di kolam. Ini mungkin disebabkan oleh berbagai faktor, seperti kesalahan sensor, gangguan pada perangkat lunak, atau kondisi kolam yang berada di luar parameter normal yang dapat dideteksi oleh sistem.';
      tindakan = 'Dalam situasi ini, langkah pertama adalah melakukan pemeriksaan manual pada kolam. Periksa secara fisik kondisi air, termasuk kejernihan, warna, dan adanya gejala tidak biasa pada ikan, seperti perilaku lesu atau tidak normal. Gunakan kit uji air manual untuk memeriksa suhu, PH, dan parameter air lainnya. Pastikan juga untuk memeriksa peralatan kolam, termasuk sensor, pompa, dan sistem filtrasi, untuk memastikan semuanya berfungsi dengan baik. Jika Anda menemukan masalah atau jika tidak yakin tentang kondisi kolam, segera konsultasikan dengan ahli kolam atau akuarium untuk mendapatkan bantuan lebih lanjut. Selalu lebih baik untuk berhati-hati dalam mengelola kesehatan ekosistem kolam Anda.';
    }

    return {'deskripsi': deskripsi, 'tindakan': tindakan};
  }
}