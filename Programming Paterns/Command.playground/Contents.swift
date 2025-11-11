//сlient - отдает команду
//invoker - получает команду от клиента и передает команды исполнителям
//reciver - исполнитель
//comand - команда

protocol Command {// command
    func execute()
}

class Cooker { //reciver
    func prepareBorsch() {
        print("Cooking Borsch")
    }
}

class Waiter { // invoker
    func submit(_ command: Command) {
        command.execute()
    }
}

class Client { //client
    var waiter: Waiter?
    
    func order(command: Command) {
        guard let waiter = waiter else {
            print("Waiter is busy")
            return
        }
        waiter.submit(command)
    }
}
class PrepareBorsch: Command {
    let cooker = Cooker()
    
    func execute() {
        cooker.prepareBorsch()
    }
    
}

let client = Client()
let cooker = Cooker()
let waiter = Waiter()

client.waiter = waiter

client.order(command: PrepareBorsch())
