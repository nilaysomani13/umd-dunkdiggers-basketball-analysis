🏀 **DunkDiggers - UMD Basketball Analysis**
📌 Project Overview
DunkDiggers has developed a relational database model for UMD basketball statistics, capturing key relationships between players, matches, and performance statistics. Our goal is to provide team managers, players, and support staff with a user-friendly platform to support informed decision-making, strategic planning, and effective game preparedness.

🔍 Data Source
We utilize official basketball statistics from the UMD Terps Basketball Stats:
📌 UMD Men's Basketball Stats (2023-24) - https://umterps.com/sports/mens-basketball/stats/2023-24

⚡ Project Features
This project includes structured SQL queries for fetching insights, helping the team achieve mission objectives.

🔹 Execute the following queries from the Views.sql file` for analysis:

1️⃣ Top 5 Offensive Players – Identifies the most effective scorers based on recent stats.
2️⃣ Top 5 Defensive Players – Evaluates the best defenders to ensure a balanced lineup.
3️⃣ Team Performance: Wins vs. Losses – Compares aggregated team statistics for better strategic planning.
4️⃣ Player Performance vs. Different Opponents – Analyzes player performance against various teams to optimize strategy and training.

🛠 Prerequisites
Ensure you have an SQL-compatible platform

🏗 Database Structure
Our database captures essential entities related to UMD Basketball, including games, players, results, and performance metrics.

📋 Key Tables & Descriptions:
📌 Game – Stores details such as game date, time, venue, referees, and attendance.
📌 Team – Identifies UMD basketball teams (Men's/Women's teams).
📌 Result – Records opponent name, match scores, and Win/Loss outcome.
📌 Player – Contains player demographics (Jersey Number, Name, Height, Weight, Team Affiliation, etc.).
📌 PlayerStats – Tracks individual performance metrics (minutes played, attempts, successful conversions, 3-point accuracy, offensive & defensive statistics, etc.).
📌 SeasonStats – Aggregates season-long player performance data.
📌 Staff – Captures coaching and support staff details (Head Coach, Physio, Manager, etc.).

🔄 Project Implementation
🛠 Steps to Use the Database:
Run the SQL Scripts (Tables.sql) to create tables and establish relationships.
Insert Data into tables using predefined queries (INSERT.sql).
Execute Analytical Queries from DML.sql to fetch insights.
📊 Insights & Strategic Impact
🎯 How Our Queries Help the Team?
✅ Performance Evaluation – Identifying top-performing players for strategic lineup selection.
✅ Strategy Optimization – Understanding team strengths & weaknesses to enhance training programs.
✅ Opponent Analysis – Comparing team performance against different competitors.
✅ Game Readiness – Helping managers and coaches make data-driven decisions for future games.

📜 License
This project is open-source and available under the MIT License.
