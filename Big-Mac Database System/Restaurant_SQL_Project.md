# Restaurant Sales and Inventory Management System using SQL

## Project Title
Restaurant Sales and Inventory Management System using SQL

## Project Description
This project is designed to manage restaurant operations including employees, menu items, sales transactions, inventory, and suppliers. The database uses SQL relationships to ensure accurate tracking and reporting.

## Objectives
1. Record and manage restaurant sales.
2. Monitor raw material inventory.
3. Track supplier information.
4. Generate sales reports.
5. Analyze best-selling menu items.

## Database Tables
- Manager
- Employee
- Menu
- Sales
- Suppliers
- Raw_Materials
- Menu_Material
- Supplier_Materials

## Entity Relationship Overview

Manager
→ Employee
→ Sales
→ Menu
→ Menu_Material
→ Raw_Materials
→ Suppliers

## Sample SQL Queries

### Total Sales per Menu
```sql
SELECT
    m.menu_name,
    SUM(s.quantity_sold) AS total_sold
FROM Sales s
JOIN Menu m ON s.menu_id = m.menu_id
GROUP BY m.menu_name
ORDER BY total_sold DESC;
```

### Employee Sales Performance
```sql
SELECT
    e.first_name || ' ' || e.last_name AS employee,
    SUM(s.quantity_sold) AS total_sales
FROM Sales s
JOIN Employee e ON s.employee_id = e.employee_id
GROUP BY e.employee_id;
```

### Current Inventory
```sql
SELECT
    material_name,
    stock_quantity,
    unit
FROM Raw_Materials;
```

### Menu and Required Ingredients
```sql
SELECT
    m.menu_name,
    r.material_name,
    mm.quantity
FROM Menu_Material mm
JOIN Menu m ON mm.menu_id = m.menu_id
JOIN Raw_Materials r ON mm.material_id = r.material_id;
```

### Supplier Report
```sql
SELECT
    s.supplier_name,
    r.material_name
FROM Suppliers s
JOIN Raw_Materials r
ON s.supplier_id = r.supplier_id;
```

## Scope
- Database Design
- Primary Keys and Foreign Keys
- SQL Joins
- Aggregate Functions
- Inventory Monitoring
- Sales Analytics
- Report Generation

## Conclusion
The Restaurant Sales and Inventory Management System demonstrates the practical use of SQL in managing restaurant operations. It integrates sales tracking, inventory management, employee monitoring, and supplier coordination into a single relational database.
