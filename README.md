# MariaDB Optimization Script

This is a Bash script designed to optimize all tables in all databases in a MariaDB instance. It helps to free up unused space by running the `OPTIMIZE TABLE` command on every table. This script also handles table names with special characters (e.g., hyphens).

## How It Works

The script:
1. Connects to the MariaDB server using provided credentials.
2. Iterates over all databases (excluding system databases).
3. Iterates over all tables in each database.
4. Runs the `OPTIMIZE TABLE` command on each table, which can help to:
   - Reorganize tables for better performance.
   - Reclaim unused space.
   - Improve I/O efficiency.

Note: For InnoDB tables, `OPTIMIZE TABLE` is translated into a table recreation, which can take time for large tables.

## Installation

1. Clone this repository:
    ```bash
    git clone https://github.com/FrankkC24/mariadb-optimization-script.git
    cd mariadb-optimization-script
    ```

2. Give execution permissions to the script:
    ```bash
    chmod +x optimize.sh
    ```

## Usage

1. Edit the script to add your MariaDB credentials:
    ```bash
    USER="USER"
    PASSWORD='PASS'
    HOST="localhost" # localhost or IP:PORT of your DB host
    ```

2. Run the script:
    ```bash
    ./optimize.sh
    ```

The script will iterate through all databases and tables, applying the `OPTIMIZE TABLE` command where applicable.

## Troubleshooting

- If you encounter errors related to special characters in passwords or table names, ensure that:
  - The password is surrounded by single quotes.
  - Table names are enclosed in backticks (`` ` ``).

