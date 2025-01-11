from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/search', methods=['POST'])
def search():
    from_location = request.form['from']
    to_location = request.form['to']
    departure_date = request.form['departure']
    results = f"Searching flights from {from_location} to {to_location} on {departure_date}"
    return render_template('index.html', results=results)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)

