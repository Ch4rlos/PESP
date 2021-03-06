//
//  ViewController.swift
//  
//
//  Created by Developer on 2/19/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var detalleBandera: UIImageView!
    @IBOutlet weak var countryName: UIButton!
    
    var countryDetail : WelcomeElement?
    @IBOutlet weak var tableView: UITableView!
    var datos : [String:Any] = [:]
    var bandera : UIImage?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard countryDetail != nil else {return}

        let nombre = countryDetail?.name
        let dominio = countryDetail?.cioc
        let alfaCode = countryDetail?.alpha2Code
        let codigoMarcacion = countryDetail?.numericCode
        let capital = countryDetail?.capital
        let lenguajes = countryDetail?.languages
        let region = countryDetail?.region
        let subregion = countryDetail?.subregion
        let poblacion = countryDetail?.population
        let ubicacion = countryDetail?.latlng
        let nacionalidad = countryDetail?.demonym
        let area = countryDetail?.area
        let zonasHorarias = countryDetail?.timezones
        let fronteras = countryDetail?.borders
        let nombreNativo = countryDetail?.nativeName
        let códigoNumérico = countryDetail?.callingCodes
        let moneda = countryDetail?.currencies
        let traducciones = countryDetail?.translations
        
        countryName.setTitle(nombre, for: .normal)
        detalleBandera.image = bandera
        
        datos = ["Dominio":"\(dominio!)",
         "Codigo Alfa":"\(alfaCode!)",
         "Código Marcación":"\(codigoMarcacion!)",
         "Capital":"\(capital!)",
         "Lenguajes":"\(lenguajes!)",
         "Region":"\(region!)",
         "Subregion":"\(subregion!)",
         "Poblacion":"\(poblacion!)",
         "Ubicacion":"\(ubicacion!)",
         "Nacionalidad":"\(nacionalidad!)",
         "Área":"\(area!)",
         "Zonas Horarias":"\(zonasHorarias!)",
         "Fronteras":"\(fronteras!)",
         "Nombre Nativo":"\(nombreNativo!)",
         "Código Numérico":"\(códigoNumérico!)",
         "Moneda":"\(moneda!)",
         "Traducciones":"\(traducciones!)"]
        
    }
    
    @IBAction func countryMap(_ sender: Any) {
        self.performSegue(withIdentifier: "goToMap", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMap" {
            if let destinationVC = segue.destination as? MapViewController {
                destinationVC.longitud = (countryDetail?.latlng[1])!
                
                destinationVC.latitud = (countryDetail?.latlng[0])!
                
                
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detallePais", for: indexPath)
        
        let key = Array(self.datos.keys)[indexPath.row]
        
        let value = Array(self.datos.values)[indexPath.row]
     

        
        cell.textLabel?.text = key as! String
        cell.detailTextLabel?.text = value as! String

        
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
