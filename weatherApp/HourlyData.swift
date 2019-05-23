import Foundation

struct HourlyData: Decodable {
    var summary: String
    var time: Int
    var icon: String
    var humidity: Double
    var temperature: Double
}
