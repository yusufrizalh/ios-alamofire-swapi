import Foundation

// struktur model yg akan diakses oleh AF dari Swapi

struct Film: Decodable {    // Encodeable
    let id: Int
    let title: String
    let openingCrawl: String
    let director: String
    let producer: String
    let releaseDate: String
    let starships: [String] // percabangan
    
    enum CodingKeys: String, CodingKey {
        case id = "episode_id"
        case title
        case openingCrawl = "opening_crawl"
        case director
        case producer
        case releaseDate = "release_date"
        case starships
    }
}

// struktur apa saja yg akan ditampilkan
extension Film: Displayable {
    var titleLabelText: String {
        title
    }
    
    var subtitleLabelText: String {
        "EPISODE \(String(id))"
        //openingCrawl
    }
    
    var item1: (label: String, value: String) {
        ("DIRECTOR", director)
    }
    
    var item2: (label: String, value: String) {
        ("PRODUCER", producer)
    }
    
    var item3: (label: String, value: String) {
        ("RELEASE DATE", releaseDate)
    }
}
