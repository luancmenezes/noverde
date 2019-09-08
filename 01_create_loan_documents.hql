CREATE EXTERNAL TABLE loan_documents (
  loan_id INT,
  period INT,
  accepted_at TIMESTAMP,
  payday INT,
  interest_rate DOUBLE,
  installments ARRAY<MAP<INT, STRING>>,
  payments ARRAY<STRUCT<id: INT, payment_date: STRING, method: STRING, amount: DOUBLE>>,
  metrics STRUCT<latency: ARRAY<BOOLEAN>, over30: ARRAY<BOOLEAN>>
)
ROW FORMAT SERDE                                                   
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'    
WITH SERDEPROPERTIES (                                             
  'path'='/parquet')    
STORED AS INPUTFORMAT                                              
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'  
OUTPUTFORMAT                                                       
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat' 
LOCATION '/parquet';
