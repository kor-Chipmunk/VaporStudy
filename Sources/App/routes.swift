import Vapor

struct Greeting: Content {
    var hello: String
}

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    app.post("greeting") { req -> HTTPStatus in
        let greeting = try req.content.decode(Greeting.self)
        print(greeting.hello) // "world"
        return HTTPStatus.ok
    }
    
    app.get("galaxies") { req in
        Galaxy.query(on: req.db).with(\.$stars).all()
    }
    
    app.post("galaxies") { req -> EventLoopFuture<Galaxy> in
        let galaxy = try req.content.decode(Galaxy.self)
        return galaxy.create(on: req.db)
            .map { galaxy }
    }
    
    app.post("stars") { req -> EventLoopFuture<Star> in
        let star = try req.content.decode(Star.self)
        return star.create(on: req.db)
            .map { star }
    }
}
