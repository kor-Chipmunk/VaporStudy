import Foundation
import Vapor
import Fluent

final class Planet: Model {
    static let schema = "planets"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    @Timestamp(key: "deleted_at", on: .delete)
    var deletedAt: Date?
    
    
    init() {}
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
}
