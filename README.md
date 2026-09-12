# Kauz-Quiz-SQL-Rebuild

The database schema for the "Kauz" quiz application — a MySQL script that (re)builds
the `Quiz` database from scratch and seeds it with sample data.

## What it contains

A single SQL script (`Quiz App.sql`) that:

- Drops and recreates the `Quiz` database.
- Creates the tables `users`, `groups` (topics/categories), `questions` and `answers`,
  with foreign keys linking answers to questions, and questions to a topic and an author.
- Inserts sample users, topics, questions and answers so the schema can be tried out
  immediately.

## Data model

- **users** — accounts (email, password, created_at).
- **groups** — topic categories a question belongs to (e.g. SQL, JavaScript, HTML).
- **questions** — a question, its topic (`fk_groupId`) and author (`fk_userId`).
- **answers** — answer options for a question, each flagged `is_correct`.

## Tech

- MySQL / SQL

## Usage

Run the script against a MySQL server:

```bash
mysql -u <user> -p < "Quiz App.sql"
```

> The seeded credentials are demo data only — replace them before using this in a real
> application.
