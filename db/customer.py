import psycopg2
import random
import names

# Connect to the PostgreSQL database
conn = psycopg2.connect(
    host="localhost",
    database="hotel_test",
    user="postgres",
    password="1234"
)
cur = conn.cursor()

# List of continents and countries
continents = {
    'Asia': ['Vietnam', 'China', 'Japan', 'India', 'Thailand'],
    'Europe': ['France', 'Germany', 'Italy', 'Spain', 'United Kingdom'],
    'North America': ['United States', 'Canada', 'Mexico'],
    'South America': ['Brazil', 'Argentina', 'Colombia', 'Peru', 'Chile'],
    'Africa': ['Nigeria', 'South Africa', 'Egypt', 'Morocco', 'Kenya'],
    'Australia': ['Australia', 'New Zealand']
}

# List of cities
cities = ['Hanoi', 'Ho Chi Minh City', 'Da Nang', 'Hai Phong', 'Can Tho']

# Generate and insert data into the customers table
for _ in range(10000):
    continent = random.choice(list(continents.keys()))
    country = random.choice(continents[continent])
    first_name = names.get_first_name()
    last_name = names.get_last_name()
    email = f"{first_name.lower()}.{last_name.lower()}@example.com"
    phone = f"+84{random.randint(100000000, 999999999)}"
    city = random.choice(cities) if country == 'Vietnam' else ''

    sql = """
        INSERT INTO customers (first_name, last_name, email, phone, city)
        VALUES (%s, %s, %s, %s, %s)
    """
    cur.execute(sql, (first_name, last_name, email, phone, city))

conn.commit()
cur.close()
conn.close()