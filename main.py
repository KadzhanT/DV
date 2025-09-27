import pandas as pd
from db import run_query

def load_queries(file_path="queries.sql"):
    
    with open(file_path, "r", encoding="utf-8") as f:
        sql_text = f.read()
   
    queries = [q.strip() for q in sql_text.split(";") if q.strip()]
    return queries

if __name__ == "__main__":
    queries = load_queries("queries.sql")

    for i, query in enumerate(queries, start=1):
        try:
            df = run_query(query)
            
            output_file = f"output_{i}.csv"
            df.to_csv(output_file, index=False, encoding="utf-8-sig")
            
            print(f"✅ Результат {i} сохранён в {output_file}")
        except Exception as e:
            print(f"❌ Ошибка при выполнении запроса {i}: {e}")
