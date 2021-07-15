import UIKit
import Alamofire

class MainViewController: UITableViewController {
    var items: [Displayable] = []
    var films: [Film] = []
    var selectedItem: Displayable?

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFilms()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.titleLabelText
        cell.detailTextLabel?.text = item.subtitleLabelText
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedItem = items[indexPath.row]
        return indexPath
    }
    
    // segue untuk berpindah ke detail
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? DetailViewController else { return }
        destVC.data = selectedItem
    }

}

// method untuk ambil data json dari swapi.dev
extension MainViewController {
    func fetchFilms() {
        // mengimplementasikan Alamofire
        AF.request("https://swapi.dev/api/films")
            .validate()
            .responseDecodable(of: Films.self) { (response) in
                // cek berhasil atau gagal
                /*
                 if (berhasil) ....
                 else (gagal) ....
                */
                guard let films = response.value else { return }
                self.items = films.all
                // print(films.all[1].title)
                self.tableView.reloadData()
            }
    }
}
