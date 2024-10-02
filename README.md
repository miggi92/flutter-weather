# Weather App

> A flutter weather app. 

![CI] ![CD]

## Features

* Displays the current weather for a given location.
* Automatically retrieves the user's location or allows manual entry of a city.
* Shows a weather forecast for the next few days.
* Provides a user-friendly and visually appealing interface.

## Screenshots

![Home Screen]
![Home Screen Mobile]

## Usage

1. Clone the repository: `git clone https://github.com/your-username/weather-app.git`
2. Navigate to the project directory: `cd weather-app`
3. Install the dependencies:   
 `flutter pub get`
4. Create a `.env` file in the root directory and add your OpenWeatherMap API key:
    ```
    API_KEY=your_api_key
    ```
5. Run the app: `flutter run`

## Dependencies

* `http`: For network communication with the OpenWeatherMap API.
* `geolocator`: For location services.
* `flutter_dotenv`: For loading environment variables.

## API

This app uses the OpenWeatherMap API. You will need an API key to use the app. You can get a free API key from the [OpenWeatherMap website](https://openweathermap.org/).

## License

[MIT License](./LICENSE)

## Sponsors

![Sponsors](https://github.com/miggi92/static/blob/master/sponsors.svg)


<!-- Links -->
[CI]: https://img.shields.io/github/actions/workflow/status/miggi92/flutter-weather/ci.yml?style=for-the-badge
[CD]: https://img.shields.io/github/actions/workflow/status/miggi92/flutter-weather/cd.yml?style=for-the-badge
[Home Screen]: ./assets/home_screen.png
[Home Screen Mobile]: ./assets/home_screen_mobile.png

