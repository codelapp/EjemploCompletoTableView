import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagenCelda: UIImageView!
    @IBOutlet weak var nombreCelda: UILabel!
    @IBOutlet weak var tiempoCelda: UILabel!
    @IBOutlet weak var ingredientesCelda: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
