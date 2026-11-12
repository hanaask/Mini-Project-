                                        -- STUDI KASUS --
-- ANALISIS PRODUK (MENGETAHUI KARAKTERISTIK PRODUK YANG DIJUAL) BATAS HANYA 20 PRODUK PERTAMA --
SELECT  
  name, category, department, brand, retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
ORDER BY id ASC
LIMIT 20;

-- IDENTIFIKASI PRODUK PREMIUM --
-- CARI PRODUK DENGAN RETAIL PRICE DIATAS 100 --
-- TAMPILKAN NAMA PRODUK, KATEGORI, MEREK, DAN HARGA RETAILNYA DAN URUTKAN DARI HARGA TERTINGGI KE TERENDAH --
SELECT
 name,
 category,
 brand,
 retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE retail_price > 100
ORDER BY retail_price DESC;

-- EVALUASI KATEGORI PRODUK --
-- tim produk ingin mengetahui kategori dengan jumlah produk terbanyak --
-- hitung jumlah pada setiap kategori dari tabel produk, dan urutkan hasil dari jumlah produk terbesar--
SELECT
  category,
  COUNT(*) AS total_items
FROM `bigquery-public-data.thelook_ecommerce.products`
GROUP BY category
ORDER BY total_items DESC;

-- MENGENAL PELANGGAN DAN PESANAN --
-- TIM CRM INGIN MELIHAT PELANGGAN YANG MELAKUKAN PEMESANAN -- 
-- GABUNGKAN TABEL USERS DAN ORDERS UNTUK MENAMPILKAN ID pesanan, status_pesanan, tanggal pesanan dibuat, serta nama depan dan nama belakang pelanggan --
SELECT
  o.order_id,
  o.status,
  o.created_at,
  u.first_name,
  u.last_name
FROM bigquery-public-data.thelook_ecommerce.orders as o
INNER JOIN bigquery-public-data.thelook_ecommerce.users as u
  ON o.user_id = u.id;

-- ANALISIS PENJUALAN PER KATEGORI --
-- KATEGORI PRODUK DENGAN NILAI PENJUALAN TERBESAR --
-- GABUNGKAN TABEL order_items dan products lalu hitung total nilai penjualan berdasarkan kategori --
-- tampilkan kategori dan total penjualan kemudian urutkan dari yang terbesar --
SELECT
  p.category,
  SUM (oi.sale_price) AS total_penjualan
FROM bigquery-public-data.thelook_ecommerce.order_items as oi
LEFT JOIN bigquery-public-data.thelook_ecommerce.products as p
ON oi.product_id = p.id
WHERE p.category IS NOT NULL
GROUP BY p.category
ORDER BY total_penjualan DESC;

select 
  p.category, 
  SUM(oi.sale_price) AS total_sales,
  COUNT(oi.id) AS total_items_sold
from `bigquery-public-data.thelook_ecommerce.orders` as o
inner join bigquery-public-data.thelook_ecommerce.order_items as oi
  ON o.order_id = oi.order_id
inner join bigquery-public-data.thelook_ecommerce.products as p  
  on oi.product_id = p.id
GROUP BY p.category
ORDER BY total_sales DESC;
