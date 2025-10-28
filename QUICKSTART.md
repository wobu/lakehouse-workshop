# Apache Iceberg Quickstart

https://iceberg.apache.org/spark-quickstart/

```bash
git submodule init
git submodule update
docker compose up
```
Use
Jupyter: http://localhost:8888

Or local spark sql terminal

```bash
docker exec -it spark-iceberg spark-sql
```

```sql
CREATE TABLE demo.nyc.taxis
(
  vendor_id bigint,
  trip_id bigint,
  trip_distance float,
  fare_amount double,
  store_and_fwd_flag string
)
PARTITIONED BY (vendor_id);
```

```sql
SELECT * FROM demo.nyc.taxis;
```

```sql
INSERT INTO demo.nyc.taxis
VALUES (1, 1000371, 1.8, 15.32, 'N'), (2, 1000372, 2.5, 22.15, 'N'), (2, 1000373, 0.9, 9.01, 'N'), (1, 1000374, 8.4, 42.13, 'Y');
```

```sql
SELECT * FROM demo.nyc.taxis WHERE vendor_id = 2;
```

```sql
EXPLAIN SELECT * FROM demo.nyc.taxis WHERE vendor_id = 2;
```