import Foundation

protocol Observer {
    func getNew(video: String)
}

protocol Subject {
    func add(observer: Observer)
    func remove(observer: Observer)
    func notifications(of video: String)
}

class Youtuber: Subject {
    var observers = NSMutableSet()
    var video = "" {
        didSet {
            notifications(of: video)
        }
    }
    
    func add(observer: any Observer) {
        observers.add(observer)
    }
    
    func remove(observer: any Observer) {
        observers.remove(observer)
    }
    
    func notifications(of video: String) {
        for observer in observers {
            (observer as! Observer).getNew(video: video)
        }
    }
}

class Folower: NSObject, Observer {
    var nickName: String
    
    init(nickName: String) {
        self.nickName = nickName
    }
    func getNew(video: String) {
        print("User \(nickName) accept notification of \(video)")
    }
}

class Google: NSObject, Observer {
    func getNew(video: String) {
        print("\(video) downloading")
    }
}

var vasya = Folower(nickName: "Vasiliy")
var fedya = Folower(nickName: "Fedyann")
var google = Google()

var vova = Youtuber()
vova.add(observer: vasya)
vova.add(observer: fedya)
vova.add(observer: google)

vova.video = "pattern observer"

vova.remove(observer: fedya)

vova.video = "123123123"
