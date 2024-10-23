import UIKit


extension UserDefaults {
    
    func save<T: Codable>(_ object: T, forKey key: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object) {
            set(encoded, forKey: key)
        }
    }

    func load<T: Codable>(forKey key: String, as type: T.Type) -> T? {
        if let data = data(forKey: key) {
            let decoder = JSONDecoder()
            return try? decoder.decode(type, from: data)
        }
        return nil
    }
    
}

