import Foundation
import Alamofire
import CoreLocation

struct RequestManager {
    static func getForecast(coordinates: CLLocationCoordinate2D?, success: @escaping (Data)->(), failure: @escaping (Error)->()) {
        if let _lat = coordinates?.latitude, let _long = coordinates?.longitude {
            let coordFormat = "\(_lat),\(_long)"
            Alamofire.request("https://api.darksky.net/forecast/f77d9c751795faf5903fbc26b0063554/\(coordFormat)?units=si").responseData { (dataResponse) in
                switch dataResponse.result {
                case .success(let value):
                    success(value)
                    break
                case .failure(let error):
                    failure(error)
                    break
                }
            }
        }
    }
}
