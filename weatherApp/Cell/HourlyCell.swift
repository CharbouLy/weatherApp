import UIKit

class HourlyCell: UITableViewCell {
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(data: WeatherData) {
        if let _time = data.time {
            hourLabel.text = String(format: "%02d", Calendar.current.component(.hour, from: _time))
        }
        
        if let image = data.icon {
            iconImageView.image = UIImage(named: image)
        }
        
        if let humidity = data.humidity {
            let _humidity = Int(round(humidity*100))
            if _humidity > 0 {
                humidityLabel.text = "\(_humidity)%"
            }
        }
        
        let temperature = String(Int(data.temperature?.rounded() ?? 0))
        temperatureLabel.text = "\(temperature)°C"
    }
}
