import React from "react";
import { useLocation } from "react-router-dom";
import styles from "../../assets/user/css/Checkout.module.css";
import Header from "../../components/user/Header";
import Footer from "../../components/user/Footer";

export default function CheckoutSuccess() {
  const location = useLocation();
  const { orderDetails } = location.state || {}; // Mendapatkan data dari state saat redirect
  console.log(orderDetails);

  if (!orderDetails) {
    return <p>Data transaksi tidak ditemukan.</p>;
  }

  return (
    <>
      <Header />
      <div className={`${styles.checkoutContainer} page-content`}>
        <h2 className="text-center text-xl font-bold mb-4">Checkout Berhasil!</h2>
        <div className="border p-4">
          <h3 className="font-bold">Nomor Order: {orderDetails.order_number}</h3>
          <p>Status: {orderDetails.status}</p>
          <p>Metode Pembayaran: {orderDetails.metode_pembayaran}</p>
          <div className="mt-4">
            <h4>Ringkasan Produk:</h4>
            <ul>
              {orderDetails.items.map((item) => (
                <li key={item.id} className="flex justify-between">
                  <span>{item.produk_nama}</span>
                  <span>Rp.{(item.harga * item.jumlah).toLocaleString()}</span>
                </li>
              ))}
            </ul>
            <div className="mt-4">
              <span className="font-bold">Total: </span>
              Rp.{orderDetails.total.toLocaleString()}
            </div>
          </div>
        </div>
      </div>
      <Footer />
    </>
  );
}
