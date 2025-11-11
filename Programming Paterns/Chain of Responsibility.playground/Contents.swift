protocol AccountType {
    var successor: AccountType? { get }
    var balance: Int { get }
    
    func setSuccessor(next: AccountType)
    func pay(_ amount: Int)
    func canPay(_ amount: Int) -> Bool
}

class Account: AccountType {
    var successor: AccountType?
    var balance: Int
    var title: String
    
    init(balance: Int, title: String) {
        self.balance = balance
        self.title = title
    }
    func setSuccessor(next: AccountType) {
        self.successor = next
    }
    
    func pay(_ amount: Int) {
        if canPay(amount) {
            self.balance -= amount
            print("An item wortd \(amount) was purchase from account \(title)")
        } else if let successor = successor {
            successor.pay(amount)
        } else {
            print("Not enough money")
        }
    }
    
    func canPay(_ amount: Int) -> Bool {
        return self.balance >= amount
    }
}

let cash = Account(balance: 30000, title: "Cash")
let debtCard = Account(balance: 45000, title: "DebtCard")
let creditCard = Account(balance: 100000, title: "CreditCard")

cash.setSuccessor(next: debtCard)
debtCard.setSuccessor(next: creditCard)

cash.pay(60000)
cash.pay(10000)
cash.pay(40000)
cash.pay(2000000)

cash.balance
debtCard.balance
creditCard.balance
