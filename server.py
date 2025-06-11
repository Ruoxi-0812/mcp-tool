from flask import Flask, request, jsonify
import requests

app = Flask(__name__)

#url of the client
CLIENT_URL = "http://localhost:5001/query"

@app.route('/mcp__bing_search', methods=['POST'])
def mcp_bing_search():
    #get sql query from request
    sql = request.json.get("query", "")  

    try:
        #forward sql query to the client
        resp = requests.post(CLIENT_URL, json={"query": sql})
        results = resp.json()
    except Exception as e:
        return jsonify({"error": str(e)}), 500

    return jsonify({
        "type": "search_results",
        "query": sql,
        "results": results
    })

#run the server
if __name__ == '__main__':
    app.run(port=5050)
