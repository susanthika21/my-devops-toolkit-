from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def home():
    return {
        "project": "Project #3 - Dockerization",
        "status": "Running smoothly inside a container!",
        "tech_stack": "Python & Flask"
    }

if __name__ == '__main__':
    # Listen on all available network interfaces on port 5000
    app.run(host='0.0.0.0', port=5000)
