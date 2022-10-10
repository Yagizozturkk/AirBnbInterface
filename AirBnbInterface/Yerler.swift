//
//  Yerler.swift
//  AirBnbInterface
//
//  Created by Yagizozturk on 9.10.2022.
//

import Foundation

class Yerler {
    var yerDetay : String?
    var yerAd : String?
    var yerResimAd : String?
    var yerFiyat : Int?
    var yerMusaitlikTarih : String?
    
    init(yerDetay: String, yerAd: String, yerResimAd: String, yerFiyat: Int, yerMusaitlikTarih: String) {
        self.yerDetay = yerDetay
        self.yerAd = yerAd
        self.yerResimAd = yerResimAd
        self.yerFiyat = yerFiyat
        self.yerMusaitlikTarih = yerMusaitlikTarih
    }
    
}
