import UIKit

class DailyCell: UITableViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var temperatureMinLabel: UILabel!
    @IBOutlet weak var temperatureMaxLabel: UILabel!
    
    func configure(data: WeatherData) {
        if let _day = data.time {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            let dayInWeek = dateFormatter.string(from: _day)
            dayLabel.text = dayInWeek
        }
        
        if let image = data.icon {
            iconImageView.image = UIImage(named: image)
        }
        
        let temperatureMin = String(Int(data.temperatureMin?.rounded() ?? 0))
        temperatureMinLabel.text = "\(temperatureMin)°C"
        
        let temperatureMax = String(Int(data.temperatureMax?.rounded() ?? 0))
        temperatureMaxLabel.text = "\(temperatureMax)°C"
    }
}
