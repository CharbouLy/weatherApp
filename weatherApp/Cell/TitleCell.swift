import UIKit

class TitleCell: UITableViewCell {
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    func configure(data: String) {
        summaryLabel.text = data
    }
}
