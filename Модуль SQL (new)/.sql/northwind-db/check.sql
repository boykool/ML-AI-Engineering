-- Ожидается: categories 8, customers 93, employee_territories 49, employees 9,
-- order_details 2155, orders 830, products 77, regions 4, shippers 3,
-- suppliers 29, territories 53
SELECT 'categories', COUNT(*) FROM categories
UNION ALL SELECT 'customers', COUNT(*) FROM customers
UNION ALL SELECT 'employee_territories', COUNT(*) FROM employee_territories
UNION ALL SELECT 'employees', COUNT(*) FROM employees
UNION ALL SELECT 'order_details', COUNT(*) FROM order_details
UNION ALL SELECT 'orders', COUNT(*) FROM orders
UNION ALL SELECT 'products', COUNT(*) FROM products
UNION ALL SELECT 'regions', COUNT(*) FROM regions
UNION ALL SELECT 'shippers', COUNT(*) FROM shippers
UNION ALL SELECT 'suppliers', COUNT(*) FROM suppliers
UNION ALL SELECT 'territories', COUNT(*) FROM territories;
