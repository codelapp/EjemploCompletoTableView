import UIKit

class DetalleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var imagenReceta: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var receta: Receta!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.75)
        self.imagenReceta.image = self.receta.imagen
        
        // Celdas autoajustables
        //self.tableView.estimatedRowHeight = 44.0
        //self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return self.receta.ingredientes.count
        case 2:
            return self.receta.pasos.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        
        switch section {
        case 0:
            title = "Información"
        case 1:
            title = "Ingredientes"
        case 2:
            title = "Pasos"
        default:
            break
        }
        
        return title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detalleRecetaCelda", for: indexPath) as! RecetaDetalleTableViewCell
        cell.backgroundColor = UIColor.clear
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.claveLabel.text = "Nombre:"
                cell.valorLabel.text = self.receta.nombre
            case 1:
                cell.claveLabel.text = "Tiempo:"
                cell.valorLabel.text = "\(self.receta.tiempo!) min"
            case 2:
                cell.claveLabel.text = "Favorita:"
                if self.receta.favorita {
                    cell.valorLabel.text = "Si"
                } else {
                    cell.valorLabel.text = "No"
                }
            default:
                break
            }
        case 1:
            if indexPath.row == 0 {
                cell.claveLabel.text = "Ingredientes:"
            } else {
                cell.claveLabel.text = ""
            }
            cell.valorLabel.text = self.receta.ingredientes[indexPath.row]
        case 2:
            if indexPath.row == 0 {
                cell.claveLabel.text = "Pasos:"
            } else {
                cell.claveLabel.text = ""
            }
            cell.valorLabel.text = self.receta.pasos[indexPath.row]
        default:
            break
        }
        
        return cell
    }

}
