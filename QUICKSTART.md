# Demo Quickstart

Based on: https://iceberg.apache.org/spark-quickstart/

```bash
git submodule init
git submodule update
docker compose up
```

## Services
- [Catalog](http://localhost:8181/)
- [Storage](http://localhost:9001/)
- [Jupyter](http://localhost:8888/)


## Demo

Use either:
- Jupyter: http://localhost:8888/notebooks/devcamp/demo.ipynb
- Or via local spark sql terminal

```bash
docker exec -it spark-iceberg spark-sql
```

```sql
CREATE SCHEMA IF NOT EXISTS demo.nyc;
```

```sql
CREATE TABLE demo.nyc.taxis (
    VendorID              bigint,
    tpep_pickup_datetime  timestamp,
    tpep_dropoff_datetime timestamp,
    passenger_count       double,
    trip_distance         double,
    RatecodeID            double,
    store_and_fwd_flag    string,
    PULocationID          bigint,
    DOLocationID          bigint,
    payment_type          bigint,
    fare_amount           double,
    extra                 double,
    mta_tax               double,
    tip_amount            double,
    tolls_amount          double,
    improvement_surcharge double,
    total_amount          double,
    congestion_surcharge  double,
    airport_fee           double
)
TBLPROPERTIES ('format-version'=3, 'write.parquet.compression-codec'='zstd');
```

```sql
SELECT * FROM demo.nyc.taxis;
```

```sql
CREATE TEMPORARY VIEW nyc_taxis_yello_tripdata
USING org.apache.spark.sql.parquet
OPTIONS (
  path "/home/iceberg/data/yellow_tripdata_2022-01.parquet"
);

INSERT INTO demo.nyc.taxis SELECT * FROM nyc_taxis_yello_tripdata;
```

```sql
SELECT Count(*) FROM demo.nyc.taxis;
```