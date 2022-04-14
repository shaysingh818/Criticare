import sqlite3

# connect to sqlite database
def get_db(file_path: str):
	db = sqlite3.connect("file_path.db")
	return db
