import psycopg2

from hood.enviroment import env


# Check connect to Postgres
config_db = env.db("HOOD_DATABASE_URL")
conn = psycopg2.connect(
    "dbname='{NAME}' user='{USER}' host='{HOST}' port='{PORT}' password='{PASSWORD}' "
    "connect_timeout=5".format(**config_db)
)
conn.close()
