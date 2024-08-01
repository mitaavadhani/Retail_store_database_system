1. Customer: Manages customer details including name, phone number, and loyalty points.

Attributes: CustomerID (PK), Name, Phone, LoyaltyPoints.

2. Employee: Tracks employee information, work hours, and payroll, linked to a specific store branch.

Attributes: EmployeeID (PK), Name, Address, Phone, Position, BranchID (FK), Attendance, WorkHours, Payroll.

3. Supplier: Manages supplier details including address, phone number, and payment mode.

Attributes: SupplierID (PK), Name, Address, Phone, PaymentMode.

4. Product: Stores product details, categorized by category ID, with links to orders and transactions.

Attributes: ProductID (PK), Name, Price, CategoryID (FK), OrderID (FK), TransactionID (FK)

5. Order: Manages orders with details on order date, total price, and status.

Attributes: OrderID (PK), OrderDate, TotalPrice, Status.

6. Transaction: Tracks transactions involving customers and employees, including transaction date and total price.

Attributes: TransactionID (PK), CustomerID (FK), EmployeeID (FK), TransactionDate, TotalPrice.

7. StoreBranch: Manages store branch details including manager, address, and phone number.

Attributes: BranchID (PK), Manager, Address, Phone.

Category: Groups products into categories identified by category name and ID.

Attributes: CategoryID (PK), Name.
