import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
    
    let loreController = LoreController()
    
    router.get("lore",String.parameter, use:loreController.getLore)
    router.get("lore",use: loreController.index)
    
    let hateoasController = HATEOASController()
    router.get("", use: hateoasController.index)
    
    
}
