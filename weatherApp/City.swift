import Foundation
import CoreLocation

class City {
    var name: String
    var coordinates: CLLocationCoordinate2D
    
    init(name: String, coordinates : CLLocationCoordinate2D){
        self.name = name
        self.coordinates = coordinates
    }
}
