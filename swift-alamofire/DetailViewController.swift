import UIKit
import Alamofire

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var item1TitleLabel: UILabel!
    @IBOutlet weak var item1ValueLabel: UILabel!
    @IBOutlet weak var item2TitleLabel: UILabel!
    @IBOutlet weak var item2ValueLabel: UILabel!
    @IBOutlet weak var item3TitleLabel: UILabel!
    @IBOutlet weak var item3ValueLabel: UILabel!
    
    var data: Displayable?
    var listData: [Displayable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchInit()
        //fetchList()

    }
    
    private func fetchInit() {
        guard let data = data else { return }
        
        titleLabel.text = data.titleLabelText
        subtitleLabel.text = data.subtitleLabelText
        
        item1TitleLabel.text = data.item1.label
        item1ValueLabel.text = data.item1.value
        
        item2TitleLabel.text = data.item2.label
        item2ValueLabel.text = data.item2.value
        
        item3TitleLabel.text = data.item3.label
        item3ValueLabel.text = data.item3.value
    }
    
}

//extension DetailViewController {
//    // request data Alamofire
//    private func fetch<T: Decodable & Displayable>(_ list: [String], of: T.Type) {
//        var items: [T] = []
//        let fetchGroup = DispatchGroup()    // percabangan json
//
//        list.forEach { (url) in
//            fetchGroup.enter()
//            AF.request(url)
//                .validate()
//                .responseDecodable(of: T.self) {
//                    (response) in
//                    if let value = response.value {
//                        items.append(value)
//                    }
//                    fetchGroup.leave()
//                }
//        }
//        fetchGroup.notify(queue: .main) {
//            self.listData = items
//            // table untuk starship
//        }
//    }
//
//    func fetchList() {
////        guard let data = data else { return }
////
////        switch data {
////        case is Film:
////            fetch(data, of: Film.self)
////        default:
////            print("Unknown", String(describing: type(of: data)))
////        }
//        //case is Starship:
//        //break
//    }
//}
