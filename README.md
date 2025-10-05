# Mini dbt Project 🚀

This is a **mini dbt project** built on **Databricks** to demonstrate modern data transformation workflows.  
The project follows a **Bronze → Silver → Gold** layered architecture and includes models, snapshots, and tests.  

---

## 📂 Project Structure

```text
dbt_one/
├── models/
│ ├── bronze/ # Raw ingestion models
│ │ ├── bronze_sales.sql
│ │ ├── bronze_customer.sql
│ │ └── bronze_products.sql
│ ├── silver/ # Cleaned & enriched models
│ │ ├── sales_silver.sql
│ │ ├── customers_silver.sql
│ │ └── products_silver.sql
│ ├── gold/ # Analytics-ready models
│ │ ├── total_sales_by_product.sql
│ │ ├── total_sales_by_city.sql
│ │ └── customer_lifetime_value.sql
│ └── source.yml 
├── snapshots/ # SCD Type 2 snapshots
│ ├── customers_snapshot.sql
│ └── products_snapshot.sql
├── macros/ # Custom macros
│ └── multiply.sql
├── seeds
├── tests
├── dbt_project.yml # Main project config
└── README.md # Project documentation
```
## ⚡ Features

- **Layered Modeling (Bronze → Silver → Gold)**  
  - Bronze: Raw ingested data  
  - Silver: Cleaned, joined, enriched data  
  - Gold: Final analytics-ready tables  

- **Snapshots**  
  - Example: `customers_snapshot` (tracks slowly changing dimensions with timestamp strategy).  

- **Generic & Custom Tests**  
  - Non-null, uniqueness, referential integrity  
  - Example custom test: `generic_nonnegative`  

- **Macros**  
  - Example: `multiply(col1, col2)` for calculated fields

## 🛠️ Getting Started

1. **Clone the repository**
```
git clone https://github.com/RAHULMAC05/Mini_dbt_project.git
cd Mini_dbt_project

---


```
2. **Set up dbt environment**
```
pip install dbt-databricks

---


```
3. **Configure your dbt profile**  
Create or update `~/.dbt/profiles.yml` with your Databricks credentials:
```yaml
dbt_p1:
  target: dev
  outputs:
    dev:
      type: databricks
      catalog: hive_metastore
      schema: bronze_layer
      host: <your-databricks-host>
      http_path: <your-http-path>
      token: <your-personal-access-token>

---


```
4. **Run dbt commands**
```bash
dbt build       # Runs models, tests, snapshots, seeds
dbt run         # Runs models only
dbt test        # Executes tests
dbt snapshot    # Captures historical changes

---


```
## 📊 Example Use Cases

- Track historical changes in customers with **SCD Type 2 snapshots**  
- Clean and enrich sales transactions from raw logs  
- Build analytics-ready aggregates in the Gold layer

6. **Security Note**
```
- **profiles.yml** (with Databricks token) is excluded from GitHub via `.gitignore`.  
- Always keep your credentials safe and local.

---


```
7. **License**
```markdown
- This project is for **learning and demonstration purposes** only.



