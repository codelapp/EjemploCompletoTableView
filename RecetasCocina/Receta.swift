import Foundation
import UIKit

class Receta {
    var nombre: String!
    var imagen: UIImage!
    var tiempo: Int!
    var ingredientes: [String]!
    var pasos: [String]!
    var favorita: Bool = false
    
    init(nombre: String, imagen: UIImage, tiempo: Int, ingredientes: [String], pasos: [String]) {
        self.nombre = nombre
        self.imagen = imagen
        self.tiempo = tiempo
        self.ingredientes = ingredientes
        self.pasos = pasos
    }
}
