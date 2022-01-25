#Lade Bibliotheken
import sqlite3 as sq
from sqlite3 import Error
import pandas as pd
import numpy as np
import requests

#Verbinden von GDrive, laden von Daten
from google.colab import drive 
drive.mount("/content/gdrive", force_remount=True)

#Verbindung zu SQLite
def create_connection_memory():
  conn = None;
  try:
    #Verbindungsaufbau
    conn = sq.connect(':memory:')
    return conn
    print(sqlite3.version)
  except Error as e:
    print("Fehler #1 beim Verbinden zu SQLite", e)

#Lokale Definition der SQLite Verbindung
def create_connection_local(local_path):
  conn = None;
  try:
    #Establishing the connection
    conn = sq.connect(local_path+'/Studium/source_covid19.db')
    return conn
    print(sqlite3.version)
  except Error as e:
    print("Fehler #2 beim Verbinden zu SQLite", e) 
conn = create_connection_memory()

cur = conn.cursor()
print("Verbindung erfolgreich zu SQLite")

# Create all tables
sql_create_source_data = requests.get('https://raw.githubusercontent.com/MarisaRies/covir/main/sql/db_create_statements.sql').text
cur.executescript(sql_create_source_data)
conn.commit()
print("DB erfolgreich erstellt")

#CSV Daten und Pfade
file_path = '...'

conn.commit()

print("Datenbank bereit")
