
import UIKit

class DetailViewController: UIViewController {

    // MVVM
    
    // Model
    // - BountyInfo > Create BountyInfo
    
    // View
    // - imgView, nameLabel, bountyLabel > views를 viewModel
    
    // View Model
    // - DetailViewModel
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
//    var name: String?
//    var bounty: Int?
    
//    var bountyInfo: BountyInfo?
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        if let bountyInfo = viewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "~\(bountyInfo.bounty)₩부터"
        }
//        if let bountyInfo = self.bountyInfo {
//            imgView.image = bountyInfo.image
//            nameLabel.text = bountyInfo.name
//            bountyLabel.text = "~\(bountyInfo.bounty)₩부터"
//        }
        
//        if let name =  self.name, let bounty = self.bounty{
//        let img = UIImage(named: "\(name).jpg")
//        imgView.image = img
//        nameLabel.text = name
//        bountyLabel.text = "~\(bounty)₩부터"
//        }
    }
    
    @IBAction func close(_ sender: Any) {
    dismiss(animated: true, completion: nil)
        //After disappeared Action
    }
    
}

class DetailViewModel{
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?){
        bountyInfo = model
    }
}
