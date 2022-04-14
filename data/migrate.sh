# migrate new db model changes
sudo rm criticare.db
touch criticare.db
cat tables.sql | sqlite3 criticare.db

