import UIKit
import Alamofire

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
        
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var item1TitleLabel: UILabel!
    @IBOutlet weak var item1ValueLabel: UILabel!
    @IBOutlet weak var item2TitleLabel: UILabel!
    @IBOutlet weak var item2ValueLabel: UILabel!
    @IBOutlet weak var item3TitleLabel: UILabel!
    @IBOutlet weak var item3ValueLabel: UILabel!
    @IBOutlet weak var listItems: UILabel!
    
    var data: Displayable?
    var listData: [Displayable] = []
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchInit()
        fetchList()
        tableView.dataSource = self
    }
    
    private func fetchInit() {
        guard let display = data else { return }
        
        titleLabel.text = display.titleLabelText
        subtitleLabel.text = display.subtitleLabelText
        
        item1TitleLabel.text = display.item1.label
        item1ValueLabel.text = display.item1.value
        
        item2TitleLabel.text = display.item2.label
        item2ValueLabel.text = display.item2.value
        
        item3TitleLabel.text = display.item3.label
        item3ValueLabel.text = display.item3.value
    }
    
}

extension DetailViewController {
    // request data Alamofire
    private func fetch<T: Decodable & Displayable>(_ list: [String], of: T.Type) {
        var items: [T] = [] // array kosong
        let fetchGroup = DispatchGroup()    // percabangan json

        list.forEach { (url) in
            fetchGroup.enter()
            AF.request(url)
                .validate()
                .responseDecodable(of: T.self) {
                    (response) in
                    if let value = response.value {
                        items.append(value)
                    }
                    fetchGroup.leave()
                }
        }
        fetchGroup.notify(queue: .main) {
            self.listData = items
            // table untuk starship
            self.tableView.reloadData()
        }
    }

    func fetchList() {
        guard let data = data else { return }

        switch data {
        case is Film:
            fetch(data.listItems, of: Starship.self)
        case is Starship:
            fetch(data.listItems, of: Film.self)
        default:
            print("Unknown", String(describing: type(of: data)))
        }
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = listData[indexPath.row].titleLabelText
        return cell
    }
    
    
}
