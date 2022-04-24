//
//  PopulationTableViewCell.swift
//  MVP-API-Demo
//
//  Created by Lana Fernando S on 24/04/22.
//

import UIKit

class PopulationTableViewCell: UITableViewCell {

    @IBOutlet weak var idNationLabel: UILabel!
    @IBOutlet weak var nationLabel: UILabel!
    @IBOutlet weak var idYearLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var slugNationLabel: UILabel!
    
    var model: PopulationModel? {
        didSet {
            setData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func setData() {
        if let model = model {
            idNationLabel.text = model.id
            nationLabel.text = model.nation
            idYearLabel.text = "\(model.idYear ?? 0)"
            yearLabel.text = model.year
            populationLabel.text = "\(model.population ?? 0)"
            slugNationLabel.text = model.slugNation
        }
    }
}
