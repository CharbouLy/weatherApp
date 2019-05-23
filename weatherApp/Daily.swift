import Foundation

struct Daily: Decodable {
    var summary: String?
    var data: [WeatherData]?
}
