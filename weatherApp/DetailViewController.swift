import UIKit

class DetailViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var city: City?
    var forecast: Forecast?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = city?.name {
            self.title = "Kingdom \(name)"
        }
        fetchForecast()
        tableView.dataSource = self
    }
    
    private func fetchForecast() {
            RequestManager.getForecast(coordinates: self.city?.coordinates, success: { data in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                self.forecast = try? decoder.decode(Forecast.self, from: data)
                self.tableView.reloadData()
            }) { error in
                print(error)
            }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0:
            return 1
        case 1:
            return 25
        case 2:
            return (forecast?.daily?.data?.count ?? 0) + 1
        case 3:
            return 2
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let _cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
            if let weatherData = forecast?.currently {
                _cell.configure(data: weatherData)
                return _cell
            }
        case 1:
            if(indexPath.row == 0) {
                let _cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as! TitleCell
                if let titleData = forecast?.hourly?.summary {
                    _cell.configure(data: titleData)
                    return _cell
                }
            } else {
                let _cell = tableView.dequeueReusableCell(withIdentifier: "HourlyCell", for: indexPath) as! HourlyCell
                if let hourlyData = forecast?.hourly?.data?[indexPath.row - 1] {
                    _cell.configure(data: hourlyData)
                    return _cell
                }
            }
        case 2:
            if(indexPath.row == 0) {
                let _cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as! TitleCell
                if let titleData = forecast?.daily?.summary {
                    _cell.configure(data: titleData)
                    return _cell
                }
            } else {
                let _cell = tableView.dequeueReusableCell(withIdentifier: "DailyCell", for: indexPath) as! DailyCell
                if let dailyData = forecast?.daily?.data?[indexPath.row - 1] {
                    _cell.configure(data: dailyData)
                    return _cell
                }
            }
        case 3:
            if(indexPath.row == 0) {
                let _cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as! TitleCell
                _cell.configure(data: "Extra informations")
                return _cell
            } else {
                let _cell = tableView.dequeueReusableCell(withIdentifier: "ExtraCell", for: indexPath) as! ExtraCell
                if let weatherData = forecast?.currently {
                    _cell.configure(data: weatherData)
                    return _cell
                }
            }
        default:
            break
        }
        return UITableViewCell()
    }
}

