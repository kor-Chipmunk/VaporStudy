// UUID 를 쓰려면 Foundation 을 import 해야 함
import Foundation
import Vapor
import Fluent

final class Galaxy: Model, Content {
    // Name of the table or collection.
    static let schema = "galaxies"

    // Unique identifier for this Galaxy.
    @ID(key: .id)
    var id: UUID?

    // The Galaxy's name.
    @Field(key: "name")
    var name: String
    
    @Children(for: \.$galaxy)
    var stars: [Star]

    // Creates a new, empty Galaxy.
    // Fluent 가 이 모델을 쓰기 위해서 반드시 빈 생성자를 만들어야 함.
    init() { }

    // Creates a new Galaxy with all properties set.
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
}
