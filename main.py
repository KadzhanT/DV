# main.py
from db import run_query

def load_queries(file_path="queries.sql"):
    """Читает SQL-запросы из файла и возвращает список"""
    with open(file_path, "r", encoding="utf-8") as f:
        sql_text = f.read()
    # Разбиваем по ';' и убираем пустые строки
    queries = [q.strip() for q in sql_text.split(";") if q.strip()]
    return queries

if __name__ == "__main__":
    queries = load_queries("queries.sql")

    for i, query in enumerate(queries, start=1):
        try:
            df = run_query(query)
            print(f"\nРезультат {i}:")
            print(df)
        except Exception as e:
            print(f"\nОшибка при выполнении запроса {i}: {e}")
