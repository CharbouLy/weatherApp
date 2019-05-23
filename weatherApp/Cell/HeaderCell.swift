import UIKit

class HeaderCell: UITableViewCell {
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!
    
    func configure(data: WeatherData) {
        let temperature = String(Int(data.temperature?.rounded() ?? 0))
        temperatureLabel.text = "\(temperature)°C"
        summaryLabel.text = data.summary
        if let image = data.icon {
            iconImageView.image = UIImage(named: image)
        }
    }
}
