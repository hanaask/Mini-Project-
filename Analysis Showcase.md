Nama : Hana

Project : Thelook Ecommerce

---

**bagaimana penjualan per kategori dari product yang tersedia di thelook ecommerce ?**

```sql
SELECT
    p.category,
    SUM(oi.sale_price) AS total_sales,
    COUNT(oi.id) AS total_items_sold
FROM `bigquery-public-data.thelook_ecommerce.orders` AS o
INNER JOIN `bigquery-public-data.thelook_ecommerce.order_items` AS oi
    ON o.order_id = oi.order_id
INNER JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
    ON oi.product_id = p.id
GROUP BY p.category
ORDER BY total_sales DESC
```

**output**

- kategori penjualan terbanyak ada pada Outerwear & Coats, Jeans, Sweaters
