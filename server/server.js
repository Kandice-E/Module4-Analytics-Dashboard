import express from "express";
import sql from "mssql";
import cors from "cors";
import { dbConfig } from "./config.js";

const app = express();
app.use(cors());
app.use(express.json());

// -----------------------------
// Database Connection Helper
// -----------------------------
async function getPool() {
  try {
    return await sql.connect(dbConfig);
  } catch (err) {
    console.error("Database connection failed:", err);
    throw err;
  }
}

// -----------------------------
// 1. Revenue by Category
// -----------------------------
app.get("/api/revenue-by-category", async (req, res) => {
  try {
    const pool = await getPool();
    const result = await pool.request().query(`
      SELECT p.category,
      SUM(oi.quantity * p.unit_price) AS total_revenue
      FROM OrderItems oi
      JOIN Parts p ON oi.part_id = p.part_id
      GROUP BY p.category
      ORDER BY total_revenue DESC;
    `);

    res.json(result.recordset);
  } catch (err) {
    console.error("Error fetching revenue by category:", err);
    res.status(500).json({ error: "Internal server error" });
  }
});

// -----------------------------
// 2. Orders for a Specific Customer
// -----------------------------
app.get("/api/orders-by-customer/:customerId", async (req, res) => {
  const customerId = req.params.customerId;

  try {
    const pool = await getPool();
    const result = await pool.request()
      .input("customerId", sql.Int, customerId)
      .query(`
        SELECT o.order_id,
               o.order_date,
               p.part_name,
               oi.quantity,
               p.unit_price,
               (oi.quantity * p.unit_price) AS line_total
        FROM Orders o
        JOIN OrderItems oi ON o.order_id = oi.order_id
        JOIN Parts p ON oi.part_id = p.part_id
        WHERE o.customer_id = @customerId
        ORDER BY o.order_date;
      `);

    res.json(result.recordset);
  } catch (err) {
    console.error("Error fetching orders for customer:", err);
    res.status(500).json({ error: "Internal server error" });
  }
});

// -----------------------------
// 3. Parts by Category
// -----------------------------
app.get("/api/parts-by-category/:category", async (req, res) => {
  const category = req.params.category;

  try {
    const pool = await getPool();
    const result = await pool.request()
      .input("category", sql.VarChar, category)
      .query(`
        SELECT part_id,
               part_name,
               description,
               manufacturer,
               unit_price
        FROM Parts
        WHERE category = @category;
      `);

    res.json(result.recordset);
  } catch (err) {
    console.error("Error fetching parts by category:", err);
    res.status(500).json({ error: "Internal server error" });
  }
});

// -----------------------------
// 4. All Categories (for dropdowns)
// -----------------------------
app.get("/api/categories", async (req, res) => {
  try {
    const pool = await getPool();
    const result = await pool.request().query(`
      SELECT DISTINCT category
      FROM Parts
      ORDER BY category;
    `);

    res.json(result.recordset);
  } catch (err) {
    console.error("Error fetching categories:", err);
    res.status(500).json({ error: "Internal server error" });
  }
});

// -----------------------------
// 5. Health Check
// -----------------------------
app.get("/", (req, res) => {
  res.send("Module 4 Backend API is running.");
});

// -----------------------------
// Start Server
// -----------------------------
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Backend running at http://localhost:${PORT}`);
});