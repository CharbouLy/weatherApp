import Foundation

struct Hourly: Decodable {
    var summary: String?
    var data: [WeatherData]?
}
