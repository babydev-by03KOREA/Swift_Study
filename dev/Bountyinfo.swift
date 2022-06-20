    
import UIKit

struct BountyInfo {
    let name: String
    let bounty: Int
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    // initializer
    init(name: String, bounty: Int){
        self.name = name
        self.bounty = bounty
    }
}
