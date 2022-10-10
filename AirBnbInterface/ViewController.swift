//
//  ViewController.swift
//  AirBnbInterface
//
//  Created by Yagizozturk on 9.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yerlerTV: UITableView!
    @IBOutlet weak var buttonArama: UIButton!
    @IBOutlet weak var buttonArkaplan: UIButton!
    @IBOutlet weak var arkaplan: UIView!

    var yerlerListe = [Yerler]()
    var uiColor : UIColor = UIColor(displayP3Red: 246.0, green: 246.0, blue: 251.0, alpha: 0.0)

    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        arkaplan.backgroundColor = uiColor

        self.navigationController?.isNavigationBarHidden = true

        let gorunus = UITabBarAppearance()

        changeColor(itemGorunus: gorunus.stackedLayoutAppearance)
        changeColor(itemGorunus: gorunus.inlineLayoutAppearance)
        changeColor(itemGorunus: gorunus.compactInlineLayoutAppearance)

        tabBarController?.tabBar.backgroundColor = uiColor
        tabBarController?.tabBar.standardAppearance = gorunus
        tabBarController?.tabBar.scrollEdgeAppearance = gorunus

        let y1 = Yerler(yerDetay: "Yiğitözü", yerAd: "Araklı, Trabzon", yerResimAd: "bungalov1", yerFiyat: 2500,yerMusaitlikTarih: "15-16 Ekim")
        let y2 = Yerler(yerDetay: "Kırkpınar", yerAd: "Sapanca, Kocaeli", yerResimAd: "bungalov2", yerFiyat: 1500,yerMusaitlikTarih: "21-24 Ekim")
        let y3 = Yerler(yerDetay: "Sarısu Saklıgöl", yerAd: "Sarısu, Sakarya", yerResimAd: "bungalov3", yerFiyat: 2200,yerMusaitlikTarih: "15-16 Ekim")
        let y4 = Yerler(yerDetay: "Kaçkar Dağı", yerAd: "Çamlıhemşin, Rize", yerResimAd: "dagevi", yerFiyat: 4500,yerMusaitlikTarih: "15-16 Ekim")
        let y5 = Yerler(yerDetay: "Uludağ", yerAd: "Bursa, Uludağ ", yerResimAd: "dagevi2", yerFiyat: 5500,yerMusaitlikTarih: "15-16 Ekim")
        let y6 = Yerler(yerDetay: "Karaca", yerAd: "Doğubayazıt, Ağrı", yerResimAd: "dagevi3", yerFiyat: 6600,yerMusaitlikTarih: "15-16 Ekim")

        yerlerListe.append(y1)
        yerlerListe.append(y2)
        yerlerListe.append(y3)
        yerlerListe.append(y4)
        yerlerListe.append(y5)
        yerlerListe.append(y6)

        yerlerTV.delegate = self
        yerlerTV.dataSource = self

        yerlerTV.separatorColor = uiColor

        buttonArama.layer.shadowColor = UIColor.systemGray2.cgColor
        buttonArama.layer.shadowOffset = CGSize(width: 6.0, height: 6.0)
        buttonArama.layer.shadowOpacity = 1.0
        buttonArama.layer.shadowRadius = 4.0
        buttonArama.layer.masksToBounds = false
        buttonArama.layer.cornerRadius = 7.0
        buttonArama.layer.cornerRadius = 13

        buttonArama?.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
            let buttonText : NSString = "Nereye?\nHerhangi bir yer Herhangi bir h... Misafir ekleyin"

            let newlineRange : NSRange = buttonText.range(of: "\n")

            var substring1 = ""
            var substring2 = ""

            if(newlineRange.location != NSNotFound) {
                substring1 = buttonText.substring(to: newlineRange.location)
                substring2 = buttonText.substring(from: newlineRange.location)
            }
            let font1: UIFont = UIFont(name: "Helvetica", size: 18.0)!
            let attributes1 = [NSMutableAttributedString.Key.font: font1]
            let attrString1 = NSMutableAttributedString(string: substring1, attributes: attributes1)

            let font2: UIFont = UIFont(name: "Helvetica", size: 10.0)!
            let attributes2 = [NSMutableAttributedString.Key.font: font2]
            let attrString2 = NSMutableAttributedString(string: substring2, attributes: attributes2)
            attrString1.append(attrString2)

            buttonArama?.setAttributedTitle(attrString1, for: [])

    }

    func changeColor(itemGorunus: UITabBarItemAppearance) {
        itemGorunus.selected.iconColor = UIColor.systemPink
        itemGorunus.selected.titleTextAttributes = [.foregroundColor: UIColor.systemPink]

        itemGorunus.normal.iconColor = UIColor.systemGray
        itemGorunus.normal.titleTextAttributes = [.foregroundColor: UIColor.systemGray]
    }
}

extension ViewController : UITableViewDelegate , UITableViewDataSource, HucreProtocol {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yerlerListe.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yer = yerlerListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "yerHucre") as! YerlerTableViewCell

        cell.yerResim.image = UIImage(named: yer.yerResimAd!)
        cell.yerKonum.text = yer.yerAd
        cell.yerKonumDetay.text = yer.yerDetay
        cell.yerMusaitlikTarih.text = yer.yerMusaitlikTarih
        cell.yerFiyat.text = "\(yer.yerFiyat!) ₺"
        cell.backgroundColor = uiColor
        cell.hucreArkaplan.layer.cornerRadius = 10

        cell.hucreProtocol = self
        cell.indexPath = indexPath

        return cell
    }
    func buttonTiklandi(indexPath: IndexPath) {
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yer = yerlerListe[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "toDetay", sender: yer)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let yer = sender as? Yerler {
                let gidilecekVC = segue.destination as! DetayVC
                gidilecekVC.yer = yer
            }
        }
    }

}



