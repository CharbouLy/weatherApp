import UIKit

class ExtraCell: UITableViewCell {
    
    @IBOutlet weak var humidityTitleLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedTitleLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var pressureTitleLabel: UILabel!
    @IBOutlet weak var PressureLabel: UILabel!
    @IBOutlet weak var UVIndexTitleLabel: UILabel!
    @IBOutlet weak var UVIndexLabel: UILabel!
    
    func configure(data: WeatherData) {
        
        if let humidity = data.humidity {
            let _humidity = Int(round(humidity*100))
            if _humidity > 0 {
                humidityTitleLabel.text = "Humidity"
                humidityLabel.text = "\(_humidity)%"
            }
        }
        
        if let winSpeed = data.windSpeed {
            let _winSpeed = Int(round(winSpeed))
            windSpeedTitleLabel.text = "Wind Speed"
            windSpeedLabel.text = "\(_winSpeed)km/h"
        }
        
        if let pressure = data.pressure {
            let _pressure = Int(round(pressure))
            pressureTitleLabel.text = "Pressure"
            PressureLabel.text = "\(_pressure) hPa"
        }
        
        if let UVIndex = data.uvIndex {
            UVIndexTitleLabel.text = "UV Index"
            UVIndexLabel.text = "\(UVIndex)"
        }
    }
}
