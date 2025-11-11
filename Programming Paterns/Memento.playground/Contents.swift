
class Memento { // Хранитель
    private var content: String
    
    init(content: String) {
        self.content = content
    }
    
    func getContent() -> String {
        return self.content
    }
}

class Editor {
    var content = ""
    
    func typing(string: String) {
        self.content += string
    }
    
    func getContent() -> String {
        return self.content
    }
    
    func save() -> Memento {
        return Memento(content: self.getContent())
    }
    
    func retrive(memento: Memento) {
        self.content = memento.getContent()
    }
}

let note = Editor()
note.typing(string: "Уж небо осенью дышало\n")
let save1 = note.save()

note.typing(string: "Уж реже солнышко блистало\n")
let save2 = note.save()

note.retrive(memento: save2)
//print(note.getContent())

//note.retrive(memento: save2)

print(note.getContent())
