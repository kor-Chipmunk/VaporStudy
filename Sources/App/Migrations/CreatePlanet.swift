import Fluent

struct CreatePlanet: Migration {
    // Prepares the database for storing Star models.
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("planets")
            .id()
            .field("name", .string)
            .create()
    }

    // Optionally reverts the changes made in the prepare method.
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("planets").delete()
    }
}
