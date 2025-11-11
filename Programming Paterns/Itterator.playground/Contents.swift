class Track: Equatable {
    var title: String
    
    init(title: String) {
        self.title = title
    }
    static func == (lhs: Track, rhs: Track) -> Bool {
        lhs.title == rhs.title
    }
    
    func getTitle() -> String {
        return title
    }
}

protocol Iterator {
    associatedtype Item
    
    var container: [Item] { get }
    var counter: Int { get }
    var count: Int { get }
    var current: Item? { get }
    
    func add(_ item: Item)
    func remove(_ item: Item)
    func next()
    func previous()
    func rewind()
    func valid() -> Bool
}

class Playlist: Iterator {
    typealias Item = Track
    
    var container: [Item] = []
    var counter = 0
    var count: Int {
        return container.count
    }
    var current: Item? {
        return count > 0 ? container[counter] : nil
    }
    
    func add(_ item: Item) {
        container.append(item)
    }
    
    func remove(_ item: Item) {
        for (index,track) in container.enumerated() {
            if track == item {
                container.remove(at: index)
                break
            }
        }
    }
    
    func next() {
        if valid() {
            counter += 1
        } else {
            counter = 0
        }
    }
    
    func previous() {
        if counter > 0 {
            counter -= 1
        } else {
            counter = self.count - 1
        }
    }
    
    func rewind() {
        counter = 0
    }
    
    func valid() -> Bool {
        self.counter < self.count - 1
    }
}

let punk = Playlist()

let always = Track(title: "Always")
let atst = Track(title: "All the small things")
let rockShow = Track(title: "The rock show!")

punk.add(always)
punk.add(atst)
punk.add(rockShow)

punk.count
punk.current
punk.current?.getTitle()
punk.next()

punk.current
punk.current?.getTitle()

punk.next()
punk.current?.getTitle()
punk.next()
punk.current?.getTitle()

punk.previous()
punk.current?.getTitle()

punk.remove(always)
punk.count
