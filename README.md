 # Auditor-Turnover (audit office-city-year panel)
This is a replication of building Audit Firm and Office Characteristics variables following Chen(JAR, 2024) and State-level variables following Carnes et.al.(JAR, 2023)

If you can obtain the original data from `Revelio Labs`, `Audit Analytics`, `BLS`, and `BEA`, you can construct the Audit Firm and Office Characteristics and State variables using my code (Steps 1-4) as follows:

|Variables Name | Variables Definition | Data Source | Reference |
| :--- | :--- |:---|:---|
|HIRED_AUDITORS_NUM| Total number of auditors in an office in a year | Revelio Labs  |  Chen(JAR, 2024)  |
|IN_FLOW_RATE <br> (For start year)| $\cfrac{\text{Number of flow in auditors}\_{t}}{\text{Total number of auditors}} = 1$ |  Revelio Labs  |  Chen(JAR, 2024)  | 
|IN_FLOW_RATE <br> (For none start year)| $\cfrac{\text{Number of flow in auditors}\_{t}}{\text{Total number of auditors}\_{t-1}}$ |  Revelio Labs  |  Chen(JAR, 2024)  | 
|OUT_FLOW_RATE <br> (For start year)| $\text{Flow out rate = 0}$  |   Revelio Labs | Chen(JAR, 2024)|
|OUT_FLOW_RATE <br> (For none start year)| $\cfrac{\text{Number of flow out auditors}\_{t}}{\text{Total number of auditors}\_{t-1}}$ |   Revelio Labs | Chen(JAR, 2024)|
|NET_FLOW_RATE| $\cfrac{\text{Total number of auditors}_{t} - \text{Total number of auditors}\_{t-1}}{\text{Total number of auditors}\_{t}}$  |  Revelio Labs  |Chen(JAR, 2024)|
|OFFICE_SIZE|  Number of audit clients in an audit office in a year | Audit Analytics | Chen(JAR, 2024)|
|LARGE_OFFICE| Set to 1 if an audit office’s size is greater than the sample median in an MSA in a year, otherwise, set to 0 |  Audit Analytics  | Chen(JAR, 2024)|
|MARKET_SHARE| $\cfrac{\text{Total number of audit clients in an office in a year}}{\text{Total number of audit clients for all Big 4 offices in the same MSA in a year}}$ |  Audit Analytics | Chen(JAR, 2024)|
|HIGH_SALARY|  Set to 1 if a office provided auditors with average salary that above the median of MSA-level in a year, otherwise, set to 0 |  Revelio Labs |Chen(JAR, 2024)|
|RESTATE_PERC|  $\cfrac{\text{Number of restatement announcements for clients}\_{t}}{\text{Total number of audit clients}\_{t}}$ |  Audit Analytics|Chen(JAR, 2024)|
|MSA_OFFICES| Total number of audit offices in a MSA in a year  |  Revelio Labs |Chen(JAR, 2024)|
|OFFICE_GROWTH_NUMBERS|  The percentage change in total number of audit clients in an audit office from year t–1 to year t | Audit Analytics|Chen(JAR, 2024)|
|OFFICE_GROWTH_FEES| The percentage change in total audit fees in an audit office from year t–1 to year t  | Audit Analytics|Chen(JAR, 2024)|
|HIGH_GROWTH| Set to 1 if an office’s growth in audit fees is greater than the sample median in a year, otherwise, set to 0   | Audit Analytics|Chen(JAR, 2024)|
|UNEMPLOYED|  The average annual unemployment rate in the state | BLS |Carnes et.al.(JAR, 2023)|
|GDP_GROWTH|  The average annual percentage change in GDP in the state  | BEA |Carnes et.al.(JAR, 2023)|

### Reference
  Carnes, Robert R., Dane M. Christensen, and Paul E. Madsen. "Externalities of financial statement fraud on the incoming accounting labor force." Journal of Accounting Research 61.5 (2023): 1531-1589.
  
  Chen, Jade Huayu. "When Employees Go to Court: Employee Lawsuits and Talent Acquisition in Audit Offices." Journal of Accounting Research (2024).


