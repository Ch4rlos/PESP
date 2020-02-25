//
//  MainTableViewController.swift
//  PESP
//
//  Created by Developer on 2/19/20.
//  Copyright © 2020 CarlosQuiroga. All rights reserved.
//

import UIKit
import SVGParser

class MainTableViewController: UITableViewController {
    var paises : Welcome?
    var datosPais : WelcomeElement?
    var imagenBandera : UIImage?
    var arrayPosition : Int = 0

    @IBOutlet var tablaPaises: UITableView!
   

    override func viewDidLoad() {
        super.viewDidLoad()
    //    tableView.register(UINib(nibName: "MainTableViewController", bundle: nil), forCellReuseIdentifier: "celdaPais")
        getNpsData()
        tablaPaises.reloadData()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        guard let listaPaises = self.paises?.count else {return 0}
        
        return listaPaises
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaPais", for: indexPath) as! TableViewCells
        
        if let country = self.paises{
            cell.nombrePais.text = country[indexPath.section].name
            if let urlFlag = country[indexPath.section].flag {
                
                if let url = URL(string: urlFlag) {
                    self.parseSVG(url) { image in
                        cell.banderaPais.image = image
                    }
                }
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let datosPais = self.paises?[indexPath.section] else {return}
        self.datosPais = datosPais
        let banderaURL = self.datosPais?.flag!
        
        if let url = URL(string: banderaURL!) {
            self.parseSVG(url) { image in
                
                self.imagenBandera = image
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.performSegue(withIdentifier: "detallesPais", sender: tableView.self )
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detallesPais" {
            if let destinationVC = segue.destination as? ViewController {
                destinationVC.countryDetail = self.datosPais
                let serialQueue = DispatchQueue(label: "com.test.mySerialQueue")
                serialQueue.sync {
                    destinationVC.bandera = self.imagenBandera
                }
                
            }
            
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func getNpsData(){
        ApiCalls.sharedInstance.getNpsData() { (result) in
            switch result {
            case .success(let response):
                self.paises = response
                DispatchQueue.main.async {
                    self.tablaPaises.reloadData()
                }
                
            case .failure(let error):
                let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func parseSVG(_ data: Data, completionHandler: @escaping (UIImage) -> Void) {
        
        DispatchQueue.main.async {
            SVGParser(xmlData: data).scaledImageWithSize(CGSize(width: 100, height: 100), completion: { image in
                if let img = image {
                    completionHandler(img)
                }
            })
        }
    }
    
    func parseSVG(_ path: String, completionHandler: @escaping (UIImage) -> Void) {
        
        DispatchQueue.main.async {
            SVGParser(contentsOfFile: path).scaledImageWithSize(CGSize(width: 100, height: 100), completion: { image in
                if let img = image {
                    completionHandler(img)
                }
            })
        }
    }
    
    func parseSVG(_ url: URL, completionHandler: @escaping (UIImage) -> Void) {
        
        DispatchQueue.main.async {
            SVGParser(contentsOfURL: url).scaledImageWithSize(CGSize(width: 100, height: 100), completion: { image in
                if let img = image {
                    completionHandler(img)
                }
            })
        }
    }

}
