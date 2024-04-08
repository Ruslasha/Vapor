import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async throws in
        try await req.view.render("index", ["title": "Hello Vapor!"])
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    app.get("movie", "action") { req async -> String in
        "Action!"
    }

    app.get("movie") { req async in
        [Movie(title: "Vatman", year: 1999), Movie(title: "Superman", year: 2020)]
    }

    app.post("movies") { req async throws in
        let movie = try req.content.decode(Movie.self)
        return movie
    }

    try app.register(collection: TodoController())
}
