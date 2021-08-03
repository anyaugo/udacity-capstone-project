from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return 'Hello from Chibundu App version 1.0!'

app.runn(host='0.0.0.0', port=81)