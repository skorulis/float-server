import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    let loreController = LoreController()
    
    router.get("lore",String.parameter, use:loreController.getLore)
    router.get("lore",use: loreController.index)
    router.put("lore",String.parameter, use: loreController.updateLore)
    
    let hateoasController = HATEOASController()
    router.get("", use: hateoasController.index)
    
    
}
