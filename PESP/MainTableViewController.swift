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

    @IBOutlet var tablaPaises: UITableView!
   

    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        DispatchQueue.main.async {
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
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedProgram = paises![indexPath.section]
        
        // Create an instance of PlayerTableViewController and pass the variable
        let destinationVC = ViewController()
        destinationVC.countryDetail = selectedProgram
        
        // Let's assume that the segue name is called playerSegue
        // This will perform the segue and pre-load the variable for you to use
        destinationVC.performSegue(withIdentifier: "detallesPais", sender: self)
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
            SVGParser(xmlData: data).scaledImageWithSize(CGSize(width: 300, height: 300), completion: { image in
                if let img = image {
                    completionHandler(img)
                }
            })
        }
    }
    
    func parseSVG(_ path: String, completionHandler: @escaping (UIImage) -> Void) {
        
        DispatchQueue.main.async {
            SVGParser(contentsOfFile: path).scaledImageWithSize(CGSize(width: 300, height: 300), completion: { image in
                if let img = image {
                    completionHandler(img)
                }
            })
        }
    }
    
    func parseSVG(_ url: URL, completionHandler: @escaping (UIImage) -> Void) {
        
        DispatchQueue.main.async {
            SVGParser(contentsOfURL: url).scaledImageWithSize(CGSize(width: 300, height: 300), completion: { image in
                if let img = image {
                    completionHandler(img)
                }
            })
        }
    }

}
