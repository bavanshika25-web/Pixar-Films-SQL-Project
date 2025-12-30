🎬 Pixar Films SQL Analytics Project

📌 Project Overview
This project analyzes 28 Pixar films (1995–2024) using SQL-based analytics to evaluate:

* Financial performance (budget, revenue, ROI)
* Critical reception (IMDb, Rotten Tomatoes, Metacritic)
* Audience sentiment (CinemaScore)
* Creative contributions (directors, genres, awards)

The project demonstrates how structured SQL queries can uncover actionable insights for business intelligence in media and entertainment.

---

📂 Dataset and Schema

The dataset is organized into 5 relational tables inside the pixar\_db schema:

| Table            | Description                                                 |
| ---------------- | ----------------------------------------------------------- |
| box\_office      | Production budget & worldwide revenue                       |
| public\_response | Ratings from IMDb, Rotten Tomatoes, Metacritic, CinemaScore |
| pixar\_people    | Directors, producers, writers                               |
| genres           | Film categories & classifications                           |
| academy          | Academy Award nominations & wins                            |

Entity Relationship Diagram (ERD):
(Paste Pixar Project ERD.png here)

---

🎯 Business Questions

1. Which films generated the highest ROI and why?
2. Do critically acclaimed films always achieve commercial success?
3. How do sequels compare to original films in profitability and ratings?
4. What role do audience ratings play in predicting revenue?
5. How do Academy Awards correlate with financial performance?

---

🛠️ SQL Query Levels

* Basic → SELECT, filtering, sorting
* Intermediate → Aggregations, GROUP BY, HAVING
* Advanced → Multi-table joins, subqueries, ROI calculations, correlation analysis

---

📊 Analytics Scope

* Descriptive Analytics → Summarizing Pixar’s financials and ratings
* Diagnostic Analytics → Sequels vs originals, budget vs ROI trends
* Predictive Analytics (Exploratory) → Estimating ROI from historical patterns
* Prescriptive Analytics (Strategic) → Recommendations for budget and content strategy

---

🔑 Key Insights

* Pixar films earned 17.04B in worldwide revenue with an average ROI of 292 percent.
* Sequels outperform originals in revenue but score lower on average ratings.
* Directors like Pete Docter and Andrew Stanton consistently deliver both financial and critical success.
* 17 Academy Awards from 40 nominations, concentrated in Best Animated Feature and Original Song.
* Audience approval (CinemaScore A+) strongly correlates with box office ROI.

---

📘 Deliverables

| File                                    | Description                               |
| --------------------------------------- | ----------------------------------------- |
| Pixar\_SQL\_Analytics\_Report.pdf       | Full professional business analyst report |
| Pixar-Films-Final-Analytics-Project.sql | SQL queries used in the project           |
| Pixar Project ERD.png                   | Entity Relationship Diagram               |
| /screenshots/                           | Query outputs and visual evidence         |

---

✅ Conclusion and Recommendations

* Balanced Strategy → Combine sequels (high revenue) with original films (critical acclaim).
* Budget Optimization → Mid-range budgets show strongest ROI performance.
* Data-Driven Forecasting → Audience and critic score patterns can predict revenue potential.
* Awards Positioning → Focus campaigns on historically successful directors and genres.

This project highlights how SQL-driven analytics provide actionable insights for media strategy, bridging creativity and business outcomes.

---


