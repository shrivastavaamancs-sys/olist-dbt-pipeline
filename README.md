Markdown
# Olist E-Commerce Data Engineering Pipeline (dbt + PostgreSQL)

An end-to-end production-grade Data Transformation & Modeling pipeline built using **dbt-core (v1.12.5)** and **PostgreSQL** on Brazilian E-Commerce public datasets (Olist).

---

## 🏗 Architecture & Data Flow

Raw CSV / Postgres Tables (9 Sources)
│
▼
Staging Layer (Clean & Standardize)
│
▼
Marts Layer (Dimensions & Facts)
│
▼
Advanced Analytics Marts (Sales & Seller Performance)


---

## 🛠 Tech Stack

* **Data Warehouse / Database**: PostgreSQL
* **Data Transformation Framework**: dbt-core (v1.12.5)
* **SQL Dialect**: PostgreSQL SQL
* **Data Quality & Testing**: dbt generic tests (`unique`, `not_null`)
* **Documentation & Lineage**: dbt docs & DAG Lineage viewer

---

## 📊 Data Models Overview

### 1. Staging Layer (`models/staging/`)
Integrates raw sources, cleans schemas, renames columns, and casts appropriate data types:
* `stg_customers`, `stg_orders`, `stg_order_items`, `stg_products`
* `stg_order_payments`, `stg_sellers`, `stg_product_category_translation`
* `stg_order_reviews`, `stg_geolocation`

### 2. Dimensional Core Layer (`models/marts/`)
* **`dim_customers`**: Customer dimension containing lifetime order counts, order dates, and total historical spend.
* **`dim_products`**: Product dimension enriched with English category translations.
* **`fct_orders`**: Central fact table aggregating item counts, freight charges, total order value, and delivery timelines.

### 3. Business Analytics Layer (`models/marts/`)
* **`mart_monthly_sales`**: Monthly aggregated metrics including revenue, total orders, and Average Order Value (AOV).
* **`mart_seller_performance`**: Seller performance tracking total fulfillment, unit volume, and revenue contribution.

---

## 🧪 Data Quality & Testing

Schema integrity and key constraints are enforced via `schema.yml`:
* Primary Key uniqueness (`unique`)
* Non-null constraints (`not_null`)
* Pass Rate: **100% (16/16 tests passing)**

---

## 🚀 How to Run Locally

1. **Clone the repository**:
   ```bash
   git clone [https://github.com/shrivastavaamancs-sys/olist-dbt-pipeline.git](https://github.com/shrivastavaamancs-sys/olist-dbt-pipeline.git)
   cd olist-dbt-pipeline
   Configure profiles.yml:
Ensure your local PostgreSQL credentials match target database details.

Execute Pipeline & Tests:

Bash
dbt deps
dbt build
Serve Interactive Lineage Graph:

Bash
dbt docs generate
dbt docs serve --host 127.0.0.1 --port 8080


Configure profiles.yml:
Ensure your local PostgreSQL credentials match target database details.

Execute Pipeline & Tests:

Bash
dbt deps
dbt build
Serve Interactive Lineage Graph:

Bash
dbt docs generate
dbt docs serve --host 127.0.0.1 --port 8080

---

### Step-by-Step Kaise Save Karein:

1. Upper code pura copy karein.
2. Apne GitHub editor mein purane text ko **`Ctrl + A`** karke delete karein, aur yeh wala paste kar dein.
3. Page ke top-right ya bottom-right mein green color ka **"Commit changes..."** button hoga, us par click kar dein.

Save hote hi aapka GitHub repository 100% professional portfolio project ban jayega!
