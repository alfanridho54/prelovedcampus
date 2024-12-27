import { useState } from "react";
import Category from "./Category";
import ProdukList from "./Produk";

const ProdukPage = () => {
  const [selectedCategory, setSelectedCategory] = useState(null);

  const handleCategorySelect = (categoryId) => {
    setSelectedCategory(categoryId); // Mengupdate kategori yang dipilih
  };

  return (
    <div>
      {/* Pastikan onCategorySelect dipassing */}
      <Category onCategorySelect={handleCategorySelect} />
      <ProdukList selectedCategory={selectedCategory} />
    </div>
  );
};

export default ProdukPage;
