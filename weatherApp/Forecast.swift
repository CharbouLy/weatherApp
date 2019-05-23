import Foundation

struct Forecast: Decodable {
    var currently: WeatherData?
    var hourly: Hourly?
    var daily: Daily?
}
