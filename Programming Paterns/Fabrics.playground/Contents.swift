//Factory(Фабрика) - создвавать сложные объекты более простым способом

enum ClothesType {
    case head
    case shoes
    case pants
}

protocol Clothes {
    var title: String { get }
    var type: ClothesType { get }
    var color: String { get }
    
    func PutOn() // В протколе ничего не реализуем тольок требуем реализовать в объекте подписанном на протокол
}

class Hat: Clothes {
    var title: String = "Hat"
    var type: ClothesType = .head
    var color: String = "Black"
    
    func PutOn() {
        print("The \(title) is \(color)")
    }
}

class Shoes: Clothes {
    var title: String = "Shoes"
    var type: ClothesType = .shoes
    var color: String = "Gray"
    
    func PutOn() {
        print("The \(title) is \(color)")
    }
}

class Jeans: Clothes {
    var title: String = "Jeans"
    var type: ClothesType = .pants
    var color: String = "Blue"
    
    func PutOn() {
        print("The \(title) is \(color)")
    }
    
    
}

class ClothesFactory {
    
    static let shared = ClothesFactory()
    private init() {}
    
    func createClothes(type: ClothesType) -> Clothes {
        
        switch type {
        case .head:
            return Hat()
        case .shoes:
            return Shoes()
        case .pants:
            return Jeans()
        }
    }
}

let hat1 = ClothesFactory.shared.createClothes(type: .head)
let shoes = ClothesFactory.shared.createClothes(type: .shoes)
let hat2 = ClothesFactory.shared.createClothes(type: .head)
let jeans = ClothesFactory.shared.createClothes(type: .pants)

var clothes = [hat1, shoes, hat2, jeans]

for clothes in clothes {
    clothes.PutOn()
}
