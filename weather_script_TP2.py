from flask import Flask, jsonify, request
import os
import requests

app = Flask(__name__)

def get_weather(latitude, longitude):
    api_key = os.environ.get('API_KEY')
    url = f'http://api.openweathermap.org/data/2.5/weather?lat={latitude}&lon={longitude}&appid={api_key}'

    response = requests.get(url)
    if response.status_code == 200:
        data = response.json()
        weather = data['weather'][0]['description']
        return weather
    else:
        return "Error: Failed to retrieve weather data"
    

@app.route('/')
def weather_api():
    latitude = request.args.get('lat')
    longitude = request.args.get('lon')
    if latitude and longitude:
        weather = get_weather(latitude, longitude)
        return jsonify(weather=weather)
    else:
        return jsonify(error="Please provide latitude and longitude parameters"), 400


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80)
