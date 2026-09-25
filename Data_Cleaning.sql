USE AdventureWorks2025; 

-- 1. Data Profilling

-- Product Category
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT Name) AS distinct_category_name
FROM Production.ProductCategory;

-- Product Subcategory
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT Name) AS distinct_subcatergory_name
FROM Production.ProductSubcategory;

-- Product Catergory Table
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT Name) AS distinct_product_names,
    COUNT(DISTINCT MakeFlag) AS distinct_make_flag,
    COUNT(DISTINCT FinishedGoodsFlag) AS distinct_finished_good,
    COUNT(DISTINCT Color) AS distinct_color,

    MIN(TRY_CAST(SafetyStockLevel AS INT)) AS min_safety_stock_level,
    MAX(TRY_CAST(SafetyStockLevel AS INT)) AS max_safety_stock_level,
    AVG(TRY_CAST(SafetyStockLevel AS INT)) AS avg_safety_stock_level,

    MIN(TRY_CAST(ReorderPoint AS INT)) AS min_reorder_point,
    MAX(TRY_CAST(ReorderPoint AS INT)) AS max_reorder_point,
    AVG(TRY_CAST(ReorderPoint AS INT)) AS avg_reorder_point,

    MIN(TRY_CAST(StandardCost AS DECIMAL(18,2))) AS min_standard_cost,
    MAX(TRY_CAST(StandardCost AS DECIMAL(18,2))) AS max_standard_cost,
    AVG(TRY_CAST(StandardCost AS DECIMAL(18,2))) AS avg_standard_cost,

    MIN(TRY_CAST(ListPrice AS DECIMAL(18,2))) AS min_list_price,
    MAX(TRY_CAST(ListPrice AS DECIMAL(18,2))) AS max_list_price,
    AVG(TRY_CAST(ListPrice AS DECIMAL(18,2))) AS avg_list_price,

    MIN(TRY_CAST(DaysToManufacture AS Int)) AS min_days_to_manufacture,
    MAX(TRY_CAST(DaysToManufacture AS Int)) AS max_days_to_manufacture,
    AVG(TRY_CAST(DaysToManufacture AS Int)) AS avg_days_to_manufacture,

    MIN(TRY_CAST(SellStartDate AS Date)) AS earliest_sell_start_date,
    MAX(TRY_CAST(SellStartDate AS Date)) AS latest_sell_start_date,

    MIN(TRY_CAST(SellEndDate AS Date)) AS earliest_sell_end_date,
    MAX(TRY_CAST(SellEndDate AS Date)) AS latest_sell_end_date,

    MIN(TRY_CAST(DiscontinuedDate AS Date)) AS earliest_discontinued_date,
    MAX(TRY_CAST(DiscontinuedDate AS Date)) AS latest_discontinued_date
FROM Production.Product;

-- Location 
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT Name) AS distinct_location_name,

    MIN(TRY_CAST(CostRate AS DECIMAL(18,2))) AS min_cost_rate_hour,
    MAX(TRY_CAST(CostRate AS DECIMAL(18,2))) AS max_cost_rate_hour,
    AVG(TRY_CAST(CostRate AS DECIMAL(18,2))) AS avg_cost_rate_hour,

    MIN(TRY_CAST(Availability AS DECIMAL(18,2))) AS min_work_capacity_hours,
    MAX(TRY_CAST(Availability AS DECIMAL(18,2))) AS max_work_capacity_hours,
    AVG(TRY_CAST(Availability AS DECIMAL(18,2))) AS avg_work_capacity_hours
FROM Production.Location;

-- Product Inventory 
SELECT
    COUNT(*) AS total_rows,

    COUNT(DISTINCT ProductID) AS distinct_products,
    COUNT(DISTINCT LocationID) AS distinct_locations,
    COUNT(DISTINCT Shelf) AS distinct_shelves,
    COUNT(DISTINCT Bin) AS distinct_bins,

    MIN(TRY_CAST(Quantity AS INT)) AS min_quantity,
    MAX(TRY_CAST(Quantity AS INT)) AS max_quantity,
    AVG(TRY_CAST(Quantity AS DECIMAL(18,2))) AS avg_quantity,
    SUM(TRY_CAST(Quantity AS INT)) AS total_inventory_quantity,

    MIN(TRY_CAST(Bin AS INT)) AS min_bin,
    MAX(TRY_CASt(Bin AS INT)) AS max_bin
FROM Production.ProductInventory;

-- Transaction History + Archive

--SELECT *
--INTO dbo.FullTransactionHistory
--FROM Production.TransactionHistory

--UNION ALL

--SELECT *
--FROM Production.TransactionHistoryArchive;

SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT ProductID) AS distinct_product,
    COUNT(DISTINCT ReferenceOrderID) AS distinct_order,
    COUNT(DISTINCT TransactionType) AS distinct_transaction_type,

    MIN(TRY_CAST(TransactionDate AS Date)) AS earliest_transaction_date,
    MAX(TRY_CAST(TransactionDate AS Date)) AS latest_transaction_date,

    MIN(TRY_CAST(Quantity AS INT)) AS min_quantity,
    MAX(TRY_CAST(Quantity AS INT)) AS max_quantity,
    AVG(TRY_CAST(Quantity AS DECIMAL(18,2))) AS avg_quantity,

    MIN(TRY_CAST(ActualCost AS INT)) AS min_cost,
    MAX(TRY_CAST(ActualCost AS INT)) AS max_cost,
    AVG(TRY_CAST(ActualCost AS DECIMAL(18,2))) AS avg_cost

FROM dbo.FullTransactionHistory;

-- Vendor
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT AccountNumber) AS distinct_account_number,
    COUNT(DISTINCT Name) AS distinct_account_name,
    COUNT(DISTINCT CreditRating) AS distinct_credit_rating,
    COUNT(DISTINCT PreferredVendorStatus) AS  distinct_vendor_status,
    COUNT(DISTINCT ActiveFlag) AS distinct_active_flag
FROM Purchasing.Vendor;

-- Product Vendor
SELECT 
    COUNT(*) AS total_rows, 
    COUNT(DISTINCT BusinessEntityID) AS  distinct_business_entity,

    MIN(TRY_CAST(AverageLeadTime AS DECIMAL(18,2))) AS min_avg_lead_time,
    MAX(TRY_CAST(AverageLeadTime AS DECIMAL(18,2))) AS max_avg_lead_time,

    MIN(StandardPrice) AS min_standard_price,
    MAX(StandardPrice) AS max_standard_price,
    AVG(CAST(StandardPrice AS DECIMAL(18,2))) AS avg_standard_price,

    MIN(TRY_CAST(LastReceiptCost AS DECIMAL(18,2))) AS min_last_receipt_cost,
    MAX(TRY_CAST(LastReceiptCost AS DECIMAL(18,2))) AS max_last_receipt_cost,
    AVG(TRY_CAST(LastReceiptCost AS DECIMAL(18,2))) AS avg_last_receipt_cost,

    MIN(TRY_CAST(MinOrderQty AS DECIMAL(18,2))) AS min_order_qty,
    MAX(TRY_CAST(MinOrderQty AS DECIMAL(18,2))) AS max_min_order_qty,
    AVG(TRY_CAST(MinOrderQty AS DECIMAL(18,2))) AS avg_min_order_qty,

    MIN(TRY_CAST(MaxOrderQty AS DECIMAL(18,2))) AS min_max_order_qty,
    MAX(TRY_CAST(MaxOrderQty AS DECIMAL(18,2))) AS max_order_qty,
    AVG(TRY_CAST(MaxOrderQty AS DECIMAL(18,2))) AS avg_max_order_qty,

    MIN(TRY_CAST(OnOrderQty AS DECIMAL(18,2))) AS min_on_order_qty,
    MAX(TRY_CAST(OnOrderQty AS DECIMAL(18,2))) AS max_on_order_qty,
    AVG(TRY_CAST(OnOrderQty AS DECIMAL(18,2))) AS avg_on_order_qty,

    MIN(TRY_CAST(LastReceiptDate AS DATE)) AS earliest_last_receipt_date,
    MAX(TRY_CAST(LastReceiptDate AS DATE)) AS latest_last_receipt_date

FROM Purchasing.ProductVendor;

-- Purchase Order Header
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT Status) AS distinct_status,
    COUNT(DISTINCT VendorId) AS distinct_vendor,
    COUNT(DISTINCT ShipMethodId) AS distinct_ship_method,

    MIN(TRY_CAST(RevisionNumber AS INT)) AS min_revision_number,
    MAX(TRY_CAST(RevisionNumber AS INT)) AS max_revision_number,
    AVG(TRY_CAST(RevisionNumber AS INT)) AS avg_revision_number,

    MIN(TRY_CAST(OrderDate AS DATE)) AS earliest_order_date,
    MAX(TRY_CAST(OrderDate AS DATE)) AS latest_order_date,

    
    MIN(TRY_CAST(ShipDate AS DATE)) AS earliest_ship_date,
    MAX(TRY_CAST(ShipDate AS DATE)) AS latest_ship_date,

    MIN(TRY_CAST(SubTotal AS DECIMAL(18,2))) AS min_subtotal,
    MAX(TRY_CAST(SubTotal AS DECIMAL(18,2))) AS max_subtotal,
    AVG(TRY_CAST(SubTotal AS DECIMAL(18,2))) AS avg_subtotal,

    MIN(TRY_CAST(TaxAmt AS DECIMAL(18,2))) AS min_tax_amount,
    MAX(TRY_CAST(TaxAmt AS DECIMAL(18,2))) AS max_tax_amount,
    AVG(TRY_CAST(TaxAmt AS DECIMAL(18,2))) AS avg_tax_amount,

    
    MIN(TRY_CAST(Freight AS DECIMAL(18,2))) AS min_shipping_cost,
    MAX(TRY_CAST(Freight AS DECIMAL(18,2))) AS max_shipping_cost,
    AVG(TRY_CAST(Freight AS DECIMAL(18,2))) AS avg_shipping_cost,

    MIN(TRY_CAST(TotalDue AS DECIMAL(18,2))) AS min_total_due,
    MAX(TRY_CAST(TotalDue AS DECIMAL(18,2))) AS max_total_due,
    AVG(TRY_CAST(TotalDue AS DECIMAL(18,2))) AS avg_total_due

FROM Purchasing.PurchaseOrderHeader;

-- Purchase Order Detail
SELECT 
    COUNT(DISTINCT PurchaseOrderID) AS distinct_order,
    COUNT(DISTINCT PurchaseOrderDetailID) AS distinct_line_order,
    COUNT(DISTINCT ProductId) AS distinct_product, 

    MIN(TRY_CAST(DueDate AS DATE)) AS earliest_ship_date,
    MAX(TRY_CAST(DueDate AS DATE)) AS latest_ship_date,

    MIN(TRY_CAST(OrderQty AS INT )) AS min_order_qty,
    MAX(TRY_CAST(OrderQty AS INT)) AS max_order_qty,
    AVG(TRY_CAST(OrderQty AS INT)) AS avg_order_qty,

    MIN(TRY_CAST(UnitPrice AS DECIMAL(18,2))) AS min_unit_price,
    MAX(TRY_CAST(UnitPrice AS DECIMAL(18,2))) AS max_unit_price,
    AVG(TRY_CAST(UnitPrice AS DECIMAL(18,2))) AS avg_unit_price,
    
    MIN(TRY_CAST(LineTotal AS DECIMAL(18,2))) AS min_line_total,
    MAX(TRY_CAST(LineTotal AS DECIMAL(18,2))) AS max_line_total,
    AVG(TRY_CAST(LineTotal AS DECIMAL(18,2))) AS avg_line_total,

    
    MIN(TRY_CAST(ReceivedQty AS INT)) AS min_received_quantity,
    MAX(TRY_CAST(ReceivedQty AS INT)) AS max_received_quantity,
    AVG(TRY_CAST(ReceivedQty AS INT)) AS avg_received_quantity,

    MIN(TRY_CAST(StockedQty AS INT)) AS min_stocked_quantity,
    MAX(TRY_CAST(StockedQty AS INT)) AS max_stocked_quantity,
    AVG(TRY_CAST(StockedQty AS INT)) AS avg_stocked_quantity

FROM Purchasing.PurchaseOrderDetail;

-- Work Order
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT WorkOrderID) AS distinct_work_order,
    COUNT(DISTINCT ProductId) AS distinct_product, 
    COUNT(DISTINCT ScrapReasonID) AS distinct_scrap_reason, 

    MIN(TRY_CAST(OrderQty AS INT )) AS min_order_qty,
    MAX(TRY_CAST(OrderQty AS INT)) AS max_order_qty,
    AVG(TRY_CAST(OrderQty AS INT)) AS avg_order_qty,

    MIN(TRY_CAST(StockedQty AS INT)) AS min_stocked_quantity,
    MAX(TRY_CAST(StockedQty AS INT)) AS max_stocked_quantity,
    AVG(TRY_CAST(StockedQty AS INT)) AS avg_stocked_quantity,

    MIN(TRY_CAST(ScrappedQty AS INT)) AS min_scrapped_quantity,
    MAX(TRY_CAST(ScrappedQty AS INT)) AS max_scrapped_quantity,
    AVG(TRY_CAST(ScrappedQty AS INT)) AS avg_scrapped_quantity,

        
    MIN(TRY_CAST(StartDate AS DATE)) AS earliest_start_date,
    MAX(TRY_CAST(StartDate AS DATE)) AS latest_start_date,

    MIN(TRY_CAST(EndDate AS DATE)) AS earliest_end_date,
    MAX(TRY_CAST(EndDate AS DATE)) AS latest_end_date,

    MIN(TRY_CAST(DueDate AS DATE)) AS earliest_due_date,
    MAX(TRY_CAST(DueDate AS DATE)) AS latest_due_date

FROM Production.WorkOrder;

-- Scrap Reason 
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT Name) AS distinct_name
FROM Production.ScrapReason;

-- Bill of Materials
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT BillOfMaterialsID) AS distinct_bill_of_materials,
    COUNT(DISTINCT ProductAssemblyID) AS distinct_product,
    COUNT(DISTINCT ComponentID) AS distinct_conponent,
    COUNT(DISTINCT UnitMeasureCode) AS distinct_unit_measure,
    COUNT(DISTINCT BOMLevel) AS distinct_bom_level,

    MIN(TRY_CAST(StartDate AS DATE)) AS earliest_start_date,
    MAX(TRY_CAST(StartDate AS DATE)) AS latest_start_date,

    MIN(TRY_CAST(EndDate AS DATE)) AS earliest_end_date,
    MAX(TRY_CAST(EndDate AS DATE)) AS latest_end_date,

    MIN(TRY_CAST(PerAssemblyQty AS INT)) AS min_per_assembly_qty,
    MAX(TRY_CAST(PerAssemblyQty AS INT)) AS max_per_assembly_qty,
    AVG(TRY_CAST(PerAssemblyQty AS INT)) AS avg_per_assembly_qty

FROM Production.BillOfMaterials;

-- Unit Measure
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT Name) AS distinct_unit_measure_name
FROM Production.UnitMeasure;



