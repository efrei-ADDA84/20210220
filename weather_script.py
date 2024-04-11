import os
import requests

def get_weather():
    latitude = os.environ.get('LAT')
    longitude = os.environ.get('LONG')
    api_key = os.environ.get('API_KEY')
    url = f'http://api.openweathermap.org/data/2.5/weather?lat={latitude}&lon={longitude}&appid={api_key}'

    response = requests.get(url)
    data = response.json()

    if response.status_code == 200:
        weather = data['weather'][0]['description']
        return weather
    else:
        return "Error: Failed to retrieve weather data"

def main():
    weather = get_weather()
    print(weather)

if __name__ == "__main__":
    main()
