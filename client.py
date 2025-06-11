from flask import Flask, request, jsonify
import pymysql

app = Flask(__name__)

db_config = {
    "host": "localhost",
    "user": "root",
    "password": "Wrx050812@",
    "database": "bing_local"
}

@app.route("/query", methods=["POST"])
def query_movies():
    #get sql query from request
    sql = request.json.get("query", "")  

    #connect to mysql and execute query
    connection = pymysql.connect(**db_config)
    with connection.cursor() as cursor:
        cursor.execute(sql)
        results = cursor.fetchall()

    #get column names
    columns = [col[0] for col in cursor.description]
    data = [dict(zip(columns, row)) for row in results]

    return jsonify(data)

#run the server
if __name__ == '__main__':
    app.run(port=5001)
