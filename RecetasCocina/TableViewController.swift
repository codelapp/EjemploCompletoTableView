import UIKit

class TableViewController: UITableViewController {

    var recetas: [Receta] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var receta = Receta(nombre: "Pizza", imagen: #imageLiteral(resourceName: "receta"), tiempo: 20, ingredientes: ["pan", "Cebolla"], pasos: ["paso 1", "paso 2"])
        
        self.recetas.append(receta)
        
        receta = Receta(nombre: "Tortilla", imagen: #imageLiteral(resourceName: "receta"), tiempo: 20, ingredientes: ["patatas", "Cebolla"], pasos: ["paso 1", "paso 2"])
        self.recetas.append(receta)
        
        receta = Receta(nombre: "Hamburguesa con queso", imagen: #imageLiteral(resourceName: "receta"), tiempo: 20, ingredientes: ["patatas", "Cebolla"], pasos: ["paso 1", "paso 2"])
        self.recetas.append(receta)
        
        receta = Receta(nombre: "Cocido", imagen: #imageLiteral(resourceName: "receta"), tiempo: 20, ingredientes: ["garbanzos", "chorizo"], pasos: ["paso 1", "paso 2"])
        self.recetas.append(receta)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recetas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let receta = self.recetas[indexPath.row]
        cell.imagenCelda.image = receta.imagen
        cell.nombreCelda.text = receta.nombre
        cell.tiempoCelda.text = "\(receta.tiempo!) min"
        cell.ingredientesCelda.text = "Ingredientes: \(receta.ingredientes.count)"
        //cell.imagenCelda.layer.cornerRadius = 30.0
        //cell.imagenCelda.clipsToBounds = true
        if receta.favorita {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let receta = self.recetas[indexPath.row]
        let alerta = UIAlertController(title: receta.nombre, message: "Valora este plato", preferredStyle: .alert)
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alerta.addAction(cancelar)
        
        var favoritaTituloAction = "Favorito"
        var favoritoActionEstilo = UIAlertActionStyle.default
        if receta.favorita {
            favoritaTituloAction = "No favorito"
            favoritoActionEstilo = UIAlertActionStyle.destructive
        }
        
        let favorita = UIAlertAction(title: favoritaTituloAction, style: favoritoActionEstilo) { (action) in
            let receta = self.recetas[indexPath.row]
            receta.favorita = !receta.favorita
            self.tableView.reloadData()
        }
        alerta.addAction(favorita)
        self.present(alerta, animated: true, completion: nil)
    }
 */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.recetas.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // Compartir
        let compartirAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            let compartirTexto = "Fantástica receta de \(self.recetas[indexPath.row].nombre!)"
            let activityController = UIActivityViewController(activityItems: [compartirTexto, self.recetas[indexPath.row].imagen!], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
        
        compartirAction.backgroundColor = UIColor(red: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        
        // Borrar
        let borrarAction = UITableViewRowAction(style: .default, title: "Borrar") { (action, indexPath) in
            self.recetas.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        borrarAction.backgroundColor = UIColor(red: 203.0/255.0, green: 41.0/255.0, blue: 23.0/255.0, alpha: 1.0)
        
        return [compartirAction, borrarAction]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mostrarDetalleReceta" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let recetaSelecionada = self.recetas[indexPath.row]
                let destinationViewController = segue.destination as! DetalleViewController
                destinationViewController.receta = recetaSelecionada
            }
        }
    }
    
    /*
    // Solo valido en en IOS 11 o superior (colocar imagen en la accion de borrar)
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action =  UIContextualAction(style: .normal, title: "Borrar", handler: { (action,view,completionHandler ) in
            self.recetas.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        })
        action.image = UIImage(named: "delete.png")
        action.backgroundColor = .red
        let confrigation = UISwipeActionsConfiguration(actions: [action])
        
        return confrigation
    }
    */
}
