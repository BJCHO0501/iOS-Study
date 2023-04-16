import Foundation

struct ServiceResponse: Encodable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
    
    func makeEntity() -> TodoEntity {
        return .init(
            userId: self.userId,
            id: self.id,
            title: self.title,
            completed: self.completed
        )
    }
}

struct TodoEntity {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
