# Day Trades Notebook

## Overview
This project analyzes day trading data in a Jupyter Notebook hosted on a Docker container. It imports a file with trade data called `trades.csv`, where the input data are in this format:

| account_id | symbol | side | qty | timestamp |
| ---- | ---- | ---- | ---- | ---- |
| 77658 | GOOG | sell | 493 | 2023-09-04 09:30:00 |
| 19191 | NVDA | sell | 216 | 2023-09-04 09:30:03 |

These source data are loaded into a table called `public.trades` on Postgres instance hosted on a Docker container when the container starts up. The Docker configuration also starts a Jupyter notebook, which queries the `public.trades` table name puts the source data into a DataFrame.

The Jupyter notebook analyzes the trading data and looks for the number of day-trades the occurred per account within a given time period. The program outputs a file with day trades in the `/work` directory.

## How to run
### Starting Docker
The program runs on Docker and can be started with a `docker compose up -d --build` command.
There are two containers: one for the Postgresql instance and another for Jupyter Notebooks, verify they are running with a `docker ps` command.

### Starting Jupyter Notebooks 
Once both containers are up, and they are healthy, open a browser and go to 'http://localhost:8888/'. This will launch the Jupyter notebook which contains the trading analysis. 

Navigate inside the `work/` directory and open the `trades_notebook.ipynb` file. Run each block of code within the notebook. The final statement contains a method call where you can input a `start_time` and an `end_time` for the date range to analyze day trades by account. Running the final code block will run the `find_day_trades()` and the `write_output_file()` method will create a `.csv` file with the count of day trades per account over the given time window. 