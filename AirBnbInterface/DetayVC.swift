//
//  DetayVC.swift
//  AirBnbInterface
//
//  Created by Yagizozturk on 9.10.2022.
//

import UIKit

class DetayVC: UIViewController {
    @IBOutlet weak var yerResimIV: UIImageView!
    @IBOutlet weak var yerMusaitlikTarih: UILabel!
    @IBOutlet weak var yerKonumDetay: UILabel!
    @IBOutlet weak var yerFiyat: UILabel!
    @IBOutlet weak var yerKonum: UILabel!

    var yer : Yerler?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = true
        if let y = yer {
            yerResimIV.image = UIImage(named: y.yerResimAd!)
            yerMusaitlikTarih.text = y.yerMusaitlikTarih
            yerKonum.text = y.yerAd
            yerKonumDetay.text = y.yerDetay
            yerFiyat.text = "\(y.yerFiyat!) ₺"
        }
    }
}
