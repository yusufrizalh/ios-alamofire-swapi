import Foundation

struct Starship: Decodable {
    var name, model, manufacturer, costInCredits: String
    var length, maxAtmospheringSpeed, crew, passengers: String
    var cargoCapacity, consumables, hyperdriveRating, mglt: String
    var starshipClass: String
    var films: [String]
    
    enum CodingKeys: String, CodingKey {
        case name, model, manufacturer
        case costInCredits = "cost_in_credits"
        case length
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case crew, passengers
        case cargoCapacity = "cargo_capacity"
        case consumables
        case hyperdriveRating = "hyperdrive_rating"
        case mglt = "MGLT"
        case starshipClass = "starship_class"
        case films
    }
}

extension Starship: Displayable {
    var titleLabelText: String {
        name
    }
    
    var subtitleLabelText: String {
        model
    }
    
    var item1: (label: String, value: String) {
        ("MANUFACTURER", manufacturer)
    }
    
    var item2: (label: String, value: String) {
        ("CLASS", starshipClass)
    }
    
    var item3: (label: String, value: String) {
        ("HYPERDRIVE RATING", hyperdriveRating)
    }
    
    var listItems: [String] {
        films
    }
    
}
