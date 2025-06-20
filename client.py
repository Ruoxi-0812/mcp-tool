from flask import Flask, request, jsonify
import pymysql
import sqlparse
from cryptography.hazmat.primitives.asymmetric import padding
from cryptography.hazmat.primitives import hashes, serialization
import base64

app = Flask(__name__)

db_config = {
    "host": "localhost",
    "user": "root",
    "password": "Wrx050812@",
    "database": "bing_local"
}

#load private key
with open("private_key.pem", "rb") as key_file:
    private_key = serialization.load_pem_private_key(key_file.read(), password=None)

#check whether the statement is safe
def is_safe_sql(sql):
    parsed = sqlparse.parse(sql)
    for stmt in parsed:
        if stmt.get_type() != 'SELECT':
            return False
    return True

@app.route("/query", methods=["POST"])
def query_movies():

    #加密
    encrypted_b64 = request.json.get("encrypted_query", "")
    try:
        encrypted = base64.b64decode(encrypted_b64)
        plaintext = private_key.decrypt(
            encrypted,
            padding.OAEP(
                mgf=padding.MGF1(algorithm=hashes.SHA256()),
                algorithm=hashes.SHA256(),
                label=None
            ))
        sql = plaintext.decode("utf-8")

        print("Decrypted:", sql)
        
    except Exception as e:
        return jsonify({"error": "Decryption failed", "details": str(e)}), 400

    #防注入
    if not is_safe_sql(sql):
        return jsonify({"error": "Only SELECT statements are allowed."}), 400
        
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
