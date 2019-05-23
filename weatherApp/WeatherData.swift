import Foundation

struct WeatherData: Decodable {
    var summary: String?
    var time: Date?
    var icon: String?
    var humidity: Double?
    var temperature: Double?
}
