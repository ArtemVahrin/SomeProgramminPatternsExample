import Foundation
protocol ChatRoomMediator { // протокол посредника
    func sendMessage(_ message: String, from user: User )
}

class ChatRoom: ChatRoomMediator {
    func sendMessage(_ message: String, from user: User) {
        let date = Date()
        let sender = user.getName()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy hh:mm:ss"
        let dataStr = formatter.string(from: date)
        print("\(dataStr)\n\(sender): \(message)")
        
    }
}

class User {
    let name: String
    var mediator: ChatRoomMediator?
    
    init(name: String) {
        self.name = name
    }
    func getName() -> String {
        return self.name
    }
    func sendMessage(_ message: String) {
        guard let mediator = mediator else {
            print("You are left from chat")
            return
        }
        mediator.sendMessage(message, from: self)
    }
}

let chat = ChatRoom()
let vasya = User(name: "vasya")
let vova = User(name: "Vova")

vasya.mediator = chat
vova.mediator = chat

vasya.sendMessage("Hello")
vova.sendMessage("Hi")
