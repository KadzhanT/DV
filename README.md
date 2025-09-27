# SQL Query Runner
![alt text](Diagram.jpg)
Этот проект позволяет подключаться к базе данных PostgreSQL, выполнять SQL-запросы из файла и получать результаты в удобном виде с помощью **pandas**.

## Структура проекта

```
.
├── db.py          # Модуль подключения к БД и выполнения запросов
├── main.py        # Основная логика загрузки и выполнения SQL-запросов
├── queries.sql    # Файл с SQL-запросами
├── .env           # Переменные окружения (доступ к БД)
├── requirements.txt
└── README.md
```

## Установка

1. Клонировать репозиторий:

```bash
git clone <URL>
cd <папка_проекта>
```

2. Создать виртуальное окружение и активировать его:

```bash
python -m venv venv
venv\Scripts\activate   # Windows
source venv/bin/activate  # Linux/Mac
```

3. Установить зависимости:

```bash
pip install -r requirements.txt
```

## Настройка

Создайте файл `.env` в корне проекта и добавьте настройки подключения к базе данных:

```
DB_NAME=your_db_name
DB_USER=your_db_user
DB_PASS=your_db_password
DB_HOST=localhost
DB_PORT=5432
```

## Использование

1. Напишите свои SQL-запросы в файл `queries.sql`.
   Каждый запрос должен заканчиваться точкой с запятой `;`.

Пример `queries.sql`:

```sql
SELECT version();

SELECT order_status, COUNT(*) 
FROM olist_orders 
GROUP BY order_status;
```

2. Запустите скрипт:

```bash
python main.py
```

3. Результаты будут выведены в консоль в виде таблиц `pandas.DataFrame`.

## Зависимости

* Python 3.9+
* pandas
* SQLAlchemy
* psycopg2
* python-dotenv

Установить можно через:

```bash
pip install pandas sqlalchemy psycopg2-binary python-dotenv
```

---

✅ Теперь вы можете централизованно хранить SQL-запросы и запускать их одним скриптом.
