from flask import Flask, request, jsonify
import requests
from cryptography.hazmat.primitives.asymmetric import padding
from cryptography.hazmat.primitives import hashes, serialization
import base64

app = Flask(__name__)

#load server's public key
with open("public_key.pem", "rb") as key_file:
    public_key = serialization.load_pem_public_key(key_file.read())

#url of the client
CLIENT_URL = "http://localhost:5001/query"

@app.route('/mcp__bing_search', methods=['POST'])
def mcp_bing_search():
    #get sql query from request
    raw_query = request.json.get("query", "")

    #encrypt the query with public key
    encrypted = public_key.encrypt(
        raw_query.encode("utf-8"),
        padding.OAEP(
            mgf=padding.MGF1(algorithm=hashes.SHA256()),
            algorithm=hashes.SHA256(),
            label=None
        )
    )
    encrypted_b64 = base64.b64encode(encrypted).decode("utf-8")

    print("Encrypted query:", base64.b64encode(encrypted).decode()) 

    try:
        resp = requests.post(CLIENT_URL, json={"encrypted_query": encrypted_b64})
        results = resp.json()
    except Exception as e:
        return jsonify({"error": str(e)}), 500

    return jsonify({
        "type": "search_results",
        "query": raw_query,
        "results": results
    })

#run the server
if __name__ == '__main__':
    app.run(port=5050)
