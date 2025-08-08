TODO into .cheat

Connect to a database:
```
psql -U <username> -d <database> -h <host> -p <port>
```

Open a Transaction:
```SQL
BEGIN;
```

Rollback a Transaction:
```SQL
ROLLBACK;
```

Commit a Transaction:
```SQL
COMMIT;
```

Expand Display for better readability:
```
\x on
```

Rollback a Transaction:
```SQL
ROLLBACK;
```

List all tables in SCHEMA_NAME:
```SQL
\dt <table_name>.*
```

List al columns in table:
```SQL
\d <table_name>
```
