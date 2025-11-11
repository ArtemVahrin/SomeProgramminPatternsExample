struct Product {
    let title: String
    let price: Int
}

struct Position {
    var product: Product
    var count: Int
    
    var cost: Int {
        product.price * count
    }
}
protocol CatalogDelegate {
    func addPosition(of position: Position)
}

class Catalog {
    var products = [Product]()
    var delegate: CatalogDelegate?
    
    func addToCart(_ index: Int, count: Int) {
        if products.count > index {
            if let delegate = delegate {
                let position = Position(product: products[index], count: count)
                delegate.addPosition(of: position)
            }
        }
    }
}

class Cart: CatalogDelegate {
    private(set) var positions = [Position]()
    
    var cost: Int {
        var sum = 0
        for position in positions {
            sum += position.cost
        }
        return sum
    }
    
    func addPosition(of position: Position) {
        self.positions.append(position)
    }
}

var catalog = Catalog()
var cart = Cart()

catalog.delegate = cart

let cheese = Product(title: "Cheese", price: 400)
let ham = Product(title: "Ham", price: 550)

catalog.products = [cheese, ham]

catalog.addToCart(0, count: 2)
catalog.addToCart(1, count: 1)

cart.cost
cart.positions
