# 📺 Netflix Data Analysis using SQL

This project focuses on analyzing a Netflix dataset using **PostgreSQL** to extract business insights and answer real-world questions using SQL queries. It demonstrates data exploration, cleaning, aggregation, and pattern discovery through SQL.

---

## 🔍 Project Objective

The goal is to understand content trends, user preferences, and content characteristics on Netflix through SQL queries. This includes identifying top-performing genres, popular actors, rating patterns, and content growth over time.

---

## 🧰 Tools & Technologies

* **Database:** PostgreSQL
* **Language:** SQL
* **IDE:** pgAdmin / DBeaver / VSCode (optional)
* **Dataset:** Netflix content dataset (CSV → loaded into SQL table)

---

## ❓ Business Questions Solved

Here are the 15 key questions answered in this project:

1. 📊 Count the number of **Movies vs TV Shows**
2. ⭐ Find the **most common rating** for each content type
3. 🎬 List all **movies released in a specific year** (e.g., 2020)
4. 🌍 Identify the **top 5 countries** with the most content
5. ⏱️ Find the **longest movie or TV show duration**
6. 🕔 Analyze content **added in the last 5 years**
7. 🎥 List content directed by **Rajiv Chilaka**
8. 📺 Identify **TV shows with more than 5 seasons**
9. 🧬 Count content items in each **genre**
10. 📅 Calculate the **average release year** by country
11. 🎞️ List all **documentary movies**
12. ❌ Find content **without a listed director**
13. 🧑‍🎤 Count how many movies **Salman Khan** appeared in (last 10 years)
14. 🏆 Find **top 10 actors** in Indian-produced movies
15. 🚫 Categorize content as **Good/Bad** based on keywords like *"kill"* or *"violence"*

---

## 📂 File Structure

* `NETFLIX__PROJECT.sql` – Contains all SQL queries for the 15 business problems
* `README.md` – Project overview and insights (this file)

---

## ✅ Key Learnings

* Writing **complex SQL queries** using `GROUP BY`, `JOIN`, `RANK()`, `CASE`, and window functions
* **Data cleaning** and handling `NULL` or inconsistent values
* Using **PostgreSQL functions** like `UNNEST()`, `STRING_TO_ARRAY()`, and `SPLIT_PART()`
* Performing **text-based categorization** using `ILIKE` and `CASE`

---

## 📌 How to Use

1. Load the dataset into PostgreSQL as a table called `Netflix`
2. Copy and execute the queries from `NETFLIX__PROJECT.sql`
3. Analyze and interpret the outputs to gain content insights

---

## 📈 Sample Output Insights

* India is among the top 5 countries contributing to Netflix content
* Documentaries are a major genre for movies
* Rajiv Chilaka has created many kid-friendly shows
* Content labeled with violent descriptions is a small subset of the total

---

## 🧠 Future Improvements

* Integrate with **Power BI/Tableau** for interactive dashboards
* Automate SQL query execution using Python or Airflow
* Expand dataset with **user ratings** or **watch time**

