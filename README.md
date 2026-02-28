# India-Vs-Pakistan-analysis

_Project Overview_
This project provides a deep-dive analysis of historical India vs Pakistan cricket matches. By leveraging the full data analytics stack, I uncovered critical insights regarding team dominance, the impact of venue geography on win rates, and the statistical significance of the toss.

This repository serves as a showcase of the complete data lifecycle: from raw data ingestion and cleaning to advanced SQL querying and interactive dashboarding.

_Key Objectives_
Performance Metrics: Calculate India’s win percentage segmented by year, venue, and tournament type.
Influence Factors: Statistically determine if winning the toss correlates with winning the match.
Interactive BI: Develop a user-friendly Power BI dashboard for stakeholders to filter data by era or location.
Process Automation: Use Python to handle repetitive data cleaning tasks and SQL for complex aggregations.

_Key Insights_
Volume: Analyzed 1,001 total matches.
Dominance: India holds a 53.15% win rate (532 wins).
Big Stage Presence: India’s performance peaks during ICC World Cup fixtures.
Fortress Venues: Significantly higher win rates recorded in Dubai & Karachi.
Toss Neutrality: The "Toss Win Advantage" sits at ~50%, suggesting that match-day strategy outweighs initial luck.

_Tools & Technologies_
| Data Storage & Querying | **MySQL**|
| Data Cleaning & Analysis | **Python (Pandas, NumPy)** |
| Visualization | **Power BI**, **Matplotlib**, **Seaborn** |
| Data Preparation | **Excel** |
| Automation & Reporting | **Jupyter Notebook**, **Power BI Service** |

_Project Structure_
Project_IndiaVsPakistan_Final
│
├── data/           # Raw and cleaned datasets (.csv, .xlsx)
├── notebooks/      # Jupyter notebooks for EDA and cleaning
├── sql/            # SQL scripts for transformations and KPIs
├── powerbi/        # .pbix files and dashboard screenshots
├── outputs/        # Exported charts and PDF reports
└── README.md       # Project documentation

_Data Workflow_
Extraction: Ingested raw match data from Excel into a MySQL relational database.
Cleaning: Handled missing values and standardized venue naming conventions (e.g., "Bombay" to "Mumbai") using Python.
Analysis
  SQL: Used Window Functions and CTEs to calculate running win totals.
  Python: Performed trend analysis and correlation checks.
Visualization: Designed an interactive Power BI report with cross-filtering capabilities.

_Power BI Dashboard_
KPI Scorecard: Real-time totals for Wins, Losses, and Win %.
Trend Analysis: Yearly performance line charts.
Geographic Map: Win distribution across global venues.
Toss Impact: A split-bar chart comparing "Toss Win vs. Match Win."

##  Sample SQL Query
```sql
SELECT c.Region, c.CustomerName, 
       SUM(o.Quantity * o.Price) AS TotalRevenue
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.Region, c.CustomerName
ORDER BY TotalRevenue DESC
LIMIT 5;
```

---

##  Sample Python Snippet
```python
import pandas as pd

df = pd.read_excel("IndiaVsPakistan.xlsx")
df['Win%'] = (df['India_Wins'] / df['Total_Matches']) * 100
print(df.groupby('Venue')['Win%'].mean().sort_values(ascending=False))
```

_How to Run_
Clone: git clone https://github.com/yourusername/IndiaVsPakistan_Analysis.git
Data: Load the .csv files from the /data folder into your MySQL instance.
Environment: Install requirements via pip install -r requirements.txt.
Explore: Open the Jupyter Notebooks to see the step-by-step transformation.





