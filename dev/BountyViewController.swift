
import UIKit

class BountyViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    // MVVM
    
    // Model
    // - BountyInfo > Create BountyInfo
    
    // View
    // - ListCell > Info from ViewModel > ViewUpdate
    
    // ViewModel
    // - BountyViewModel > Create BountyViewModel > Create ViewLayer method
    

    let viewModel = BountyViewModel()
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // DetailViewController Data send
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                let bountyInfo = viewModel.bountyInfo(at: index)
                vc?.viewModel.update(model: bountyInfo)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // UICollectionViewDataSource > how many DataSource Show up? > How to represent a cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfBountyInfoList
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else {
            return UICollectionViewCell()
        }
        let BountyInfo = viewModel.bountyInfo(at: indexPath.item)
                cell.update(info: BountyInfo)
        cell.update(info: BountyInfo)
        return cell
    }

    // UICollectionViewDelegate > Response when a cell is clicked
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("-->\(indexPath.item)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
    }
    
    // give size information
   
    
    // UICollectionViewDelegateFlowLayout > Calculate cell size
    // To show a consistent design across devices
    
    
    // 테이블 뷰 셀 몇개?
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return viewModel.numberOfBountyInfoList
//    }
//
//    // 테이블 뷰 어떻게 보여줄까?
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as? ListCell else{
//            return UITableViewCell()
//        }
//
//            let BountyInfo = viewModel.bountyInfo(at: indexPath.row)
//        cell.update(info: BountyInfo)
//            return cell
//    }
//
//    // UiTableViewDelegate
//    // 클릭하면 어떤 반응을 보여줄까?
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("-->\(indexPath.row)")
//        performSegue(withIdentifier: "showDetail", sender: indexPath.row) // send -> row
//    }
//
}
    
class ListCell: UITableViewCell{
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info:BountyInfo){
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "~\(info.bounty)₩부터"
    }
}

class BountyViewModel{
    let BountyInfoList: [BountyInfo] = [
        BountyInfo(name: "Busan", bounty: 60000),
        BountyInfo(name: "Jeju", bounty: 120000),
        BountyInfo(name: "Ulsan", bounty: 70000),
        BountyInfo(name: "Gwangju", bounty: 60000),
        BountyInfo(name: "Yangyang", bounty: 80000),
        BountyInfo(name: "Daegu", bounty: 100000),
        BountyInfo(name: "Sacheon", bounty: 60000),
        BountyInfo(name: "Pohang", bounty: 90000),
    ]
    
    var sortedList:[BountyInfo] {
        let sortedList = BountyInfoList.sorted { prev, next in
            return prev.bounty > next.bounty
        }
        return sortedList
    }
    
    var numberOfBountyInfoList: Int {
        return BountyInfoList.count
    }
    
    func bountyInfo(at index: Int) -> BountyInfo{
        return sortedList[index]
    }
}

class GridCell: UICollectionViewCell{
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info:BountyInfo){
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "~\(info.bounty)₩부터"
    }
}
