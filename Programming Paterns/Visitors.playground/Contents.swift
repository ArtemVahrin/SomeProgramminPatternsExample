
protocol Attraction {
    func visitResult(_ age: Int? )
}

protocol Visitor {
    func visitHamam(_ hamam: Hamam)
    func visitWaterSlide(_ waterSlide: WaterSlide)
    func visitSwimmingPool(_ swimmingPool: SwimmingPool)
}

class SwimmingPool: Attraction {
    func visitResult(_ age: Int?) {
        print("You could swim in pool")
    }
}

class Hamam: Attraction {
    var temp: Int
    
    init(temp: Int = 55) {
        self.temp = temp
    }
    
    func visitResult(_ age: Int?) {
        print("You could visit Hamam. Current temperature: \(temp)°C")
    }
}

class WaterSlide: Attraction {
    let minAge: Int
    let height: Int
    
    init(minAge: Int, height: Int) {
        self.minAge = minAge
        self.height = height
    }
    
    func visitResult(_ age: Int?) {
        guard let age = age, age >= minAge else {
            print("You are too young for this attraction")
            return
        }
        print("You could slide. Height of the water slide is \(height) m")
    }
}

class Client: Visitor {
    var age: Int
    
    init(age: Int) {
        self.age = age
    }
    
    func visitHamam(_ hamam: Hamam) {
        hamam.visitResult(age)
    }
    
    func visitWaterSlide(_ waterSlide: WaterSlide) {
        waterSlide.visitResult(age)
    }
    
    func visitSwimmingPool(_ swimmingPool: SwimmingPool) {
        swimmingPool.visitResult(age)
    }
}

let slide = WaterSlide(minAge: 14, height: 25)
let litleSlide = WaterSlide(minAge: 5, height: 7)
let pool = SwimmingPool()
let hamam = Hamam(temp: 63)

let client = Client(age: 9)

client.visitHamam(hamam)
client.visitSwimmingPool(pool)
client.visitWaterSlide(litleSlide)
client.visitWaterSlide(slide)
