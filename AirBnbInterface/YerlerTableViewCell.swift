//
//  YerlerTableViewCell.swift
//  AirBnbInterface
//
//  Created by Yagizozturk on 9.10.2022.
//

import UIKit

protocol HucreProtocol {
    func buttonTiklandi(indexPath : IndexPath)
}

class YerlerTableViewCell: UITableViewCell {
    @IBOutlet weak var hucreArkaplan: UIView!
    @IBOutlet weak var yerResim: UIImageView!
    @IBOutlet weak var yerKonum: UILabel!
    @IBOutlet weak var yerKonumDetay: UILabel!
    @IBOutlet weak var yerMusaitlikTarih: UILabel!
    @IBOutlet weak var yerFiyat: UILabel!
    @IBOutlet weak var geceLabel: UILabel!

    var hucreProtocol: HucreProtocol?
    var indexPath : IndexPath?


    override func awakeFromNib() {
        super.awakeFromNib()
        hucreArkaplan.backgroundColor = UIColor(displayP3Red: 246.0, green: 246.0, blue: 251.0, alpha: 0.0)
        yerResim.layer.cornerRadius = 12
        yerFiyat.font = UIFont.boldSystemFont(ofSize: 15.0)
        geceLabel.text = "gece"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
