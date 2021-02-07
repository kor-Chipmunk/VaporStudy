import Vapor
import Fluent
import FluentMySQLDriver

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    setFileMiddleware(app)
    setUpDatabases(app)
    setMigrations(app)
    // register routes
    try routes(app)
}

fileprivate func setFileMiddleware(_ app: Application) {
    let fileMiddleware = FileMiddleware(
        publicDirectory: app.directory.publicDirectory
    )
    app.middleware.use(fileMiddleware)
}


fileprivate func setUpDatabases(_ app: Application) {
    setUpMySQL(app)
}

fileprivate func setUpMySQL(_ app: Application) {
    app.databases.use(
        .mysql(
            hostname: "localhost",
            username: "root",
            password: "",
            database: "vapor",
            tlsConfiguration: .forClient(certificateVerification: .none)
    ), as: .mysql)
}

fileprivate func setMigrations(_ app: Application) {
    // Fluent 가 Extension 으로 migraitons 넣어둠
    app.migrations.add(CreateGalaxy())
    app.migrations.add(CreateStar())
    app.migrations.add(CreatePlanet())
}
