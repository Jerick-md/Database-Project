PRAGMA foreign_keys = ON;

-- Manager Table
CREATE TABLE Manager (
    manager_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    contact VARCHAR(20) NOT NULL,
    email VARCHAR(100) NULL,
    address TEXT
);

-- Manager Table Values
INSERT INTO Manager(first_name, last_name, contact, address)
VALUES ('Bernadette', 'Niemo', '09776190894', 'Zone-1,Bulan,Sorsogon');

-- Employee Table
CREATE TABLE Employee (
    employee_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INTEGER NULL,
    address TEXT NOT NULL,
    date_hired DATE NULL,
    position VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    manager_id INTEGER,
    FOREIGN KEY (manager_id)
        REFERENCES Manager(manager_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Employee Table Values
INSERT INTO Employee(first_name, last_name, age, address, date_hired, position, salary, status, manager_id)
VALUES ('Renzy', 'Canelas', 24, 'Sua,Matnog,Sorsogon', '2025-06-06', 'Crew', 300, 'Part_time', 1),
       ('Reymart', 'Amante', 23, 'Sua,Matnog,Sorsogon', '2025-12-23', 'Crew', 300, 'Part_time', 1),
       ('Ahiezer', 'Furio', 25, 'Zone-2,Bulan,Sorsogon', '2025-04-12', 'Crew', 300, 'Part_time', 1),
       ('Dave Mikael', 'Calamdag', 21, 'Sua,Matnog,Sorsogon', '2025-03-25', 'Crew', 300, 'Part_time', 1),
       ('Timothy', 'Esquillo', 19, 'Managa-naga,Bulan,Sorsogon', '2025-11-17', 'Crew', 300, 'Part_time', 1),
       ('Ardel', 'Bordaje', 20, 'Zone-2,Bulan,Sorsogon', '2025-11-25', 'Crew', 300, 'Part_time', 1),
       ('Jomelyn', 'Canlas', 22, 'Zone-2,Bulan,Sorsogon', '2025-01-01', 'Crew', 300, 'Part_time', 1),
       ('Lea Gloriance', 'Valeriano', 22, 'Zone-2,Bulan,Sorsogon', '2025-01-01', 'Crew', 300, 'Part_time', 1),
       ('Florence', 'Gonzales', 52, 'Zone-8,Bulan,Sorsogon', '2025-08-15', 'Team_Leader', 400, 'Full_time', 1);

-- Menu Table
CREATE TABLE Menu (
    menu_id INTEGER PRIMARY KEY AUTOINCREMENT,
    menu_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- Menu Table Values
INSERT INTO Menu(menu_name, price)
VALUES ('Classic Burger', 42),
       ('Cheese Burger', 52),
       ('Bacon Egg', 76),
       ('Bacon Sandwich', 44),
       ('Bacon cheese', 58),
       ('Hamwich', 47),
       ('Egg Sandwich', 53),
       ('Egg w/cheese', 58),
       ('Superlong', 69),
       ('Footlongdog', 58),
       ('Chilidog', 72),
       ('Makhotdog', 42),
       ('Sisig Burger', 80),
       ('Pizza buiscuit', 52),
       ('Supreme Overload', 89),
       ('Footlong Overload', 99),
       ('Supermak', 55),
       ('Coke mismo', 25),
       ('Coke 1.5L', 85),
       ('Bottled water 350ml', 12),
       ('Bottled water 500ml', 35),
       ('Minute maid', 35),
       ('Vitasoy', 41),
       ('Dutch-Milk small', 19),
       ('Dutch-Milk big', 34),
       ('Cobra energy drink', 30),
       ('Chuckie small', 18),
       ('Chuckie big', 35);

-- Suppliers Table
CREATE TABLE Suppliers (
    supplier_id INTEGER PRIMARY KEY AUTOINCREMENT,
    supplier_name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(20) NULL,
    address TEXT
);

-- Suppliers Table Values
INSERT INTO Suppliers(supplier_name, address)
VALUES ('Big-Mac Main Branch', 'Legazpi,Lucena');

-- Raw Materials Table
CREATE TABLE Raw_Materials (
    material_id INTEGER PRIMARY KEY AUTOINCREMENT,
    material_name VARCHAR(100) NOT NULL,
    stock_quantity DECIMAL(10,2) NOT NULL,
    unit VARCHAR(20) NOT NULL,
    supplier_id INTEGER,
    FOREIGN KEY (supplier_id)
        REFERENCES Suppliers(supplier_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Raw Materials Table Values
INSERT INTO Raw_Materials(material_name, stock_quantity, unit, supplier_id)
VALUES ('Regular Patty', 110, 'pack', 1),
       ('Slice cheese', 4, 'box', 1),
       ('Superlong hotdog', 60, 'pack', 1),
       ('Footlong hotdog', 50, 'pack', 1),
       ('Regular hotdog', 20, 'pack', 1),
       ('Nutridog', 20, 'pack', 1),
       ('Siopao', 3, 'pcs', 1),
       ('Supermak patty', 10, 'pack', 1),
       ('Sisig', 36, 'pcs', 1),
       ('Egg', 2, 'tray', 1),
       ('Bacon', 5, 'pack', 1),
       ('Burger buns', 10, 'pack', 1),
       ('Hotdog buns', 5, 'pack', 1),
       ('Burger dressing', 7, 'box', 1),
       ('Mayonaise', 5, 'box', 1),
       ('Ketchup', 5, 'box', 1),
       ('Taco sauce', 3, 'pack', 1),
       ('Pizza biscuit', 9, 'pack', 1),
       ('Ham', 0, 'pack', 1),
       ('Superlong buns', 2, 'pack', 1),
       ('Hotdog buns', 5, 'pack', 1);

-- Menu Materials Table
CREATE TABLE Menu_Material (
    menu_material_id INTEGER PRIMARY KEY AUTOINCREMENT,
    menu_id INTEGER,
    material_id INTEGER,
    quantity DECIMAL(10,2) NOT NULL,
    unit VARCHAR(20) NOT NULL,
    UNIQUE (menu_id, material_id),
    FOREIGN KEY (menu_id)
        REFERENCES Menu(menu_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (material_id)
        REFERENCES Raw_Materials(material_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Menu Materials Table Values
INSERT INTO Menu_Material(menu_id, material_id, quantity, unit)
VALUES (1,12,2,'pcs'), (1,1,2,'pcs'), (1,14,12,'grams'),
       (2,12,2,'pcs'), (2,1,2,'pcs'), (2,2,2,'slice'), (2,14,12,'grams'),
       (3,12,2,'pcs'), (3,10,2,'pcs'), (3,11,2,'pcs'), (3,16,12,'grams'), (3,15,12,'grams'),
       (4,12,2,'pcs'), (4,11,2,'pcs'), (4,15,12,'grams'),
       (5,12,2,'pcs'), (5,11,2,'pcs'), (5,2,2,'slice'), (5,15,12,'grams'),
       (6,12,2,'pcs'), (6,15,12,'grams'), (6,19,2,'pcs'),
       (7,12,2,'pcs'), (7,10,2,'pcs'), (7,16,12,'grams'),
       (8,12,2,'pcs'), (8,10,2,'pcs'), (8,2,2,'slice'), (8,16,12,'grams'),
       (9,3,1,'pcs'), (9,20,1,'pcs'), (9,16,12,'grams'), (9,15,12,'grams'),
       (10,4,1,'pcs'), (10,21,1,'pcs'), (10,16,12,'grams'), (10,15,12,'grams'), (10,2,1,'pcs'),
       (11,5,2,'pcs'), (11,17,2,'pcs'), (11,13,2,'pcs'),
       (12,13,2,'pcs'), (12,6,2,'pcs'), (12,16,12,'grams'),
       (13,9,2,'pcs'), (13,15,12,'grams'), (13,12,2,'pcs'),
       (14,18,1,'pcs'), (14,16,12,'grams'),
       (15,8,2,'pcs'), (15,10,2,'pcs'), (15,2,2,'pcs'), (15,12,2,'pcs'), (15,14,12,'grams'), (15,16,12,'grams'),
       (16,4,1,'pcs'), (16,21,1,'pcs'), (16,1,2,'pcs'), (16,10,2,'pcs'), (16,15,12,'grams'), (16,16,12,'grams'),
       (17,12,2,'pcs'), (17,8,2,'pcs'), (17,14,12,'grams');

-- Supplier Materials Bridge Table
CREATE TABLE Supplier_Materials (
    supplier_id INTEGER,
    material_id INTEGER,
    PRIMARY KEY (supplier_id, material_id),
    FOREIGN KEY (supplier_id)
        REFERENCES Suppliers(supplier_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (material_id)
        REFERENCES Raw_Materials(material_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Supplier Materials Table Values
INSERT INTO Supplier_Materials(supplier_id, material_id)
VALUES (1,1), (1,2), (1,3), (1,4), (1,5),
       (1,6), (1,7), (1,8), (1,9), (1,10),
       (1,11), (1,12), (1,13), (1,14), (1,16),
       (1,17), (1,18), (1,19), (1,20), (1,21);

-- Sales Table
CREATE TABLE Sales (
    sales_id INTEGER PRIMARY KEY AUTOINCREMENT,
    menu_id INTEGER,
    employee_id INTEGER,
    sale_date DATETIME NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    quantity_sold INT NOT NULL,
    FOREIGN KEY (menu_id)
        REFERENCES Menu(menu_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (employee_id)
        REFERENCES Employee(employee_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Sales Table Values
INSERT INTO Sales(menu_id, employee_id, sale_date, start_time, end_time, quantity_sold)
VALUES (1,8,'2026-04-13','05:00:00','13:00:00',8),
       (2,8,'2026-04-13','05:00:00','13:00:00',5),
       (3,8,'2026-04-13','05:00:00','13:00:00',3),
       (5,8,'2026-04-13','05:00:00','13:00:00',2),
       (8,8,'2026-04-13','05:00:00','13:00:00',2),
       (7,8,'2026-04-13','05:00:00','13:00:00',3),
       (9,8,'2026-04-13','05:00:00','13:00:00',4),
       (12,8,'2026-04-13','05:00:00','13:00:00',3),
       (11,8,'2026-04-13','05:00:00','13:00:00',1),
       (17,8,'2026-04-13','05:00:00','13:00:00',3),
       (18,8,'2026-04-13','05:00:00','13:00:00',4),
       (20,8,'2026-04-13','05:00:00','13:00:00',3),
       (1,1,'2026-04-13','13:00:00','21:00:00',11),
       (2,1,'2026-04-13','13:00:00','21:00:00',20),
       (3,1,'2026-04-13','13:00:00','21:00:00',4),
       (5,1,'2026-04-13','13:00:00','21:00:00',5),
       (4,1,'2026-04-13','13:00:00','21:00:00',6),
       (8,1,'2026-04-13','13:00:00','21:00:00',8),
       (7,1,'2026-04-13','13:00:00','21:00:00',2),
       (9,1,'2026-04-13','13:00:00','21:00:00',16),
       (10,1,'2026-04-13','13:00:00','21:00:00',10),
       (12,1,'2026-04-13','13:00:00','21:00:00',8),
       (11,1,'2026-04-13','13:00:00','21:00:00',4),
       (13,1,'2026-04-13','13:00:00','21:00:00',3),
       (17,1,'2026-04-13','13:00:00','21:00:00',3),
       (27,1,'2026-04-13','13:00:00','21:00:00',1),
       (28,1,'2026-04-13','13:00:00','21:00:00',3),
       (18,1,'2026-04-13','13:00:00','21:00:00',8),
       (20,1,'2026-04-13','13:00:00','21:00:00',6),
       (21,1,'2026-04-13','13:00:00','21:00:00',2),
       (24,1,'2026-04-13','13:00:00','21:00:00',1),
       (14,1,'2026-04-13','13:00:00','21:00:00',4),
       (1,4,'2026-04-13','21:00:00','05:00:00',26),
       (2,4,'2026-04-13','21:00:00','05:00:00',24),
       (3,4,'2026-04-13','21:00:00','05:00:00',7),
       (5,4,'2026-04-13','21:00:00','05:00:00',5),
       (4,4,'2026-04-13','21:00:00','05:00:00',10),
       (8,4,'2026-04-13','21:00:00','05:00:00',9),
       (7,4,'2026-04-13','21:00:00','05:00:00',7),
       (9,4,'2026-04-13','21:00:00','05:00:00',18),
       (10,4,'2026-04-13','21:00:00','05:00:00',12),
       (12,4,'2026-04-13','21:00:00','05:00:00',13),
       (11,4,'2026-04-13','21:00:00','05:00:00',8),
       (13,4,'2026-04-13','21:00:00','05:00:00',4),
       (17,4,'2026-04-13','21:00:00','05:00:00',10),
       (27,4,'2026-04-13','21:00:00','05:00:00',3),
       (28,4,'2026-04-13','21:00:00','05:00:00',1),
       (18,4,'2026-04-13','21:00:00','05:00:00',11),
       (20,4,'2026-04-13','21:00:00','05:00:00',9),
       (21,4,'2026-04-13','21:00:00','05:00:00',2),
       (24,4,'2026-04-13','21:00:00','05:00:00',1),
       (22,4,'2026-04-13','21:00:00','05:00:00',2),
       (14,4,'2026-04-13','21:00:00','05:00:00',4);

-- View: Employee Sales
CREATE VIEW EmployeeSales AS
SELECT e.first_name,
       m.menu_name,
       s.quantity_sold,
       m.price
FROM Sales s
JOIN Menu m ON s.menu_id = m.menu_id
JOIN Employee e ON s.employee_id = e.employee_id;

-- Sample Queries

-- Employee row number by salary
SELECT first_name, salary,
       ROW_NUMBER() OVER (ORDER BY salary DESC) AS rank
FROM Employee;

-- Employee rank and dense rank by salary
SELECT first_name, salary,
       RANK() OVER (ORDER BY salary DESC) AS rank,
       DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank
FROM Employee;

-- Running total salary
SELECT first_name, salary,
       SUM(salary) OVER (ORDER BY salary) AS running_total
FROM Employee;

-- Total salary by address
SELECT address, first_name, salary,
       SUM(salary) OVER (PARTITION BY address) AS total_salary_address
FROM Employee;

-- Previous and next salary
SELECT first_name, salary,
       LAG(salary) OVER (ORDER BY salary) AS prev_salary,
       LEAD(salary) OVER (ORDER BY salary) AS next_salary
FROM Employee;

-- Menu sold by employee_id 4
SELECT menu_name
FROM Menu
WHERE menu_id IN (
    SELECT menu_id
    FROM Sales
    WHERE employee_id = 4
);

-- Employees who have sales
SELECT first_name
FROM Employee e
WHERE EXISTS (
    SELECT 1
    FROM Sales s
    WHERE s.employee_id = e.employee_id
);

-- Inventory status
WITH Inventory AS (
    SELECT material_name,
           stock_quantity,
           CASE
               WHEN stock_quantity = 0 THEN 'Out Stock'
               WHEN stock_quantity > 300 THEN 'Over Stock'
               ELSE 'Normal Stock'
           END AS InventoryStock
    FROM Raw_Materials
)
SELECT * FROM Inventory;

-- Employee accountability report
SELECT e.first_name || ' ' || e.last_name AS employee_name,
       m.menu_name,
       s.quantity_sold,
       s.sale_date
FROM Sales s
INNER JOIN Employee e ON s.employee_id = e.employee_id
INNER JOIN Menu m ON s.menu_id = m.menu_id;

-- Average sale quantity per employee
SELECT e.first_name || ' ' || e.last_name AS employee,
       AVG(s.quantity_sold) AS avg_sales
FROM Sales s
JOIN Employee e ON s.employee_id = e.employee_id
GROUP BY e.employee_id;

-- Most common quantity_sold
SELECT quantity_sold,
       COUNT(*) AS frequency
FROM Sales
GROUP BY quantity_sold
ORDER BY frequency DESC;

-- Employee total revenue
WITH Total_reven AS (
    SELECT em.first_name,
           SUM(m.price * s.quantity_sold) AS Revenue
    FROM Sales s
    INNER JOIN Menu m ON m.menu_id = s.menu_id
    INNER JOIN Employee em ON em.employee_id = s.employee_id
    GROUP BY em.employee_id, em.first_name
)
SELECT first_name, Revenue
FROM Total_reven;
