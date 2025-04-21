from flask import Flask, jsonify
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)

@app.route('/clients')
def get_clients():
    try:
        connection = mysql.connector.connect(
            host='mysql-db',
            user='root',
            password='root',
            database='testdb'
        )
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM clients")
        results = cursor.fetchall()
        return jsonify(results)

    except Error as e:
        print("Erreur MySQL :", e)  # Important pour voir le vrai message dans les logs
        return jsonify({"error": str(e)}), 500

    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

