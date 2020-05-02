import Vapor
import Routing

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req -> Future<View> in
        //return "It works!"
        
        struct PageData: Content {
            var shoes: [Shoe]
            var orders: [Order]
        }
        
        let shoeType = Shoe.query(on: req).all()
        let orders = Order.query(on: req).all()
        
        return flatMap(to: View.self, shoeType, orders) {
            shoeType, orders in
            let context = PageData(shoes: shoeType, orders: orders)
            return try req.view().render("home", context)
        }
        
    }
    
    router.post(Shoe.self, at: "add") { req, shoe -> Future<Response> in
        return shoe.save(on: req).map(to: Response.self){ shoe
            in
            return req.redirect(to: "/")
        }
    }
        
        router.get("shoes") { req -> Future<[Shoe]> in
            return Shoe.query(on: req).sort(\.name).all()
    }
        
        router.post(Order.self, at: "order") { req, order -> Future<Order>
            in
            var orderCopy = order
            orderCopy.date = Date()
            return orderCopy.save(on: req)
        }
    
}

    /*
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    router.get("hello", "vapor") { req -> String in
      return "Hello Vapor!"
    }
    
   // 1
   router.post(InfoData.self, at: "info") { req, data -> InfoResponse in
       // 2
       return InfoResponse(request: data)
   }
    
    // 1
    router.get("hello", String.parameter) { req -> String in
      //2
      let name = try req.parameters.next(String.self)
      // 3
      return "Hello, \(name)!"
    }
    

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}


struct InfoData: Content {
 let name: String
}

struct InfoResponse: Content {
  let request: InfoData
}
 
 
 
*/

