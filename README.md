# The-Retail-Insights-Data-Analyst-using-SQL

<h3>Business Case:</h3>
<p>A regional supermarket chain, "FreshMart," is losing money because they overstock items that don't sell and run out of items that do. They need a data-driven report to optimize their inventory.</p>

<h3>Problem Statement:</h3>
<p>The Inventory Manager needs a "Stock Health Report" that identifies products nearing expiration and those that are "Dead Stock" (not sold in 60 days).</p>

<h3>Student Tasks:</h3>
<ul>
<li><b>Schema Design:</b> Create three tables: Products, Categories, and SalesTransactions.</li>
<li><b>The "Expiring Soon" Query:</b> Write a query to find all products where the ExpiryDate is within the next 7 days but StockCount is greater than 50.</li>
<li><b>The "Dead Stock" Analysis:</b> Identify products that exist in the Products table but have zero entries in the SalesTransactions table for the last 2 months.</li>
<li><b>Revenue Contribution:</b> Write a query using SUM and GROUP BY to show which Category generated the most revenue last month.</li>
</ul>

<h3>Deliverable:</h3>
<p>A .sql script that creates the schema, populates dummy data, and provides these three specific reports.</p>
