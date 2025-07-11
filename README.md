# Retail-Sales-Inventory-Analysis

# 🛍️ Retail Sales & Inventory Analysis 

A data-driven Power BI dashboard that provides actionable insights into retail product performance, sales trends, and inventory management. Built using Power BI, DAX, and structured CSV datasets.

---

## 📊 Dashboard Overview

The dashboard is divided into **3 key pages**:

### 🔹 Page 1: Sales Overview
- Total Revenue, Units Sold, AOV
- Top Products & Categories
- Monthly Sales Trends
- Store-wise Performance

### 🔹 Page 2: Total Revenue & AVg order value by day
Visuals: Line chart comparing Total Revenue and AOV
Observations:
Highest Revenue: June 1 (₹10.4K), June 30 (₹9.7K)
Highest AOV: June 11 (₹342), June 22 (₹316)
Revenue & AOV both dipped on June 6 and June 20

### 🔹 Page 3: Inventory Dashboard
- Low Stock Alerts
- Inventory Turnover Ratio

- Turnover ratio is best in Grocery segment


---

## 🧠 Key Business Insights

- A-class products generate over 80% of total revenue.
- Certain products haven't sold in over 15 days — potential dead stock.
- Inventory turnover varies across products; stock optimization is needed.
- Category-level performance helps in targeted promotions.

---

## 📁 Project Files

| File Name | Description |
|-----------|-------------|
| `Retail Sales & Inventory Analysis.pbix` | Power BI Dashboard file |
| `products.csv` | Product data |
| `sales.csv` | Sales transactions |
| `inventory.csv` | Inventory status |
| `Retail_Sales_Inventory_Analysis_Report.docx` | Detailed analysis report |

---

## 🛠️ Tools & Technologies

- **SQL (planned logic)** – Analysis & Inventory Turnover Logic
- **Power BI** – Dashboard & Visualization
- **DAX** – Custom KPIs & Business Logic
- **Power Query** – Data Transformation
- **CSV** – Raw Data Files
---

## 📄 Report Summary

A detailed [project report](Retail_Sales_Inventory_Analysis_Report.docx) is included, covering:
- Data Sources
- Dashboard Structure
- DAX Logic
- Business Insights
- Recommendations

## DAX Measures Used
Total Revenue =	SUMX(sales, quantity_sold * RELATED(price))
Total Units Sold =	SUM(sales[quantity_sold])
Inventory Turnover =	DIVIDE(SUM(sales[quantity_sold]), AVERAGE(inventory[quantity_in_stock]))

---






