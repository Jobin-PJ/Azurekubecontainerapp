from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/search', methods=['POST'])
def search():
    from_location = request.form['from']
    to_location = request.form['to']
    departure_date = request.form['departure']
    flights = [
        {"flight": "Flight 101", "price": "$300", "departure": departure_date, "from": from_location, "to": to_location},
        {"flight": "Flight 102", "price": "$350", "departure": departure_date, "from": from_location, "to": to_location},
        {"flight": "Flight 103", "price": "$400", "departure": departure_date, "from": from_location, "to": to_location},
    ]
    return render_template('results.html', flights=flights)

@app.route('/book/<flight>')
def book(flight):
    flight_info = flight.replace("+", " ")
    return render_template('booking.html', flight=flight_info)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)

