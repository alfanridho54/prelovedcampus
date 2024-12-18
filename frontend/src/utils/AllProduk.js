const Produk = [
       { name: "Laptop Asus Second", price: "Rp 4.599.000", img: "https://placehold.co/200x200?text=Laptop+Asus+Second" },
       { name: "Handphone Samsung Second", price: "Rp 3.000.000", img: "https://placehold.co/200x200?text=Handphone+Samsung+Second" },
       { name: "Kipas Angin Miyako Second", price: "Rp 100.000", img: "https://placehold.co/200x200?text=Kipas+Angin+Miyako+Second" },
       { name: "Hoodie H&M Second", price: "Rp 90.000", img: "https://placehold.co/200x200?text=Hoodie+H&M+Second" },
       { name: "Kemeja Flanel Akase Second", price: "Rp 120.000", img: "https://placehold.co/200x200?text=Kemeja+Flanel+Akase+Second" },
       { name: "Topi Converse Second", price: "Rp 40.000", img: "https://placehold.co/200x200?text=Topi+Converse+Second" },
       { name: "Meja Lipat Second", price: "Rp 50.000", img: "https://placehold.co/200x200?text=Meja+Lipat+Second" },
       { name: "Cermin Second", price: "Rp 20.000", img: "https://placehold.co/200x200?text=Cermin+Second" },
     ];

const repeatedProduk = Array.from({ length: 5 }, () => Produk).flat();

export default repeatedProduk;
