//
//  ViewController.swift
//  
//
//  Created by Developer on 2/19/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    @IBOutlet weak var countryName: UILabel!
    var countryDetail : WelcomeElement?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard countryDetail != nil else {return}
        
        let name = countryDetail?.name
        let capital = countryDetail?.capital
        let area = countryDetail?.area
        let population = countryDetail?.population
        let borders = countryDetail?.borders
        let currencies = countryDetail?.currencies
        let cioc = countryDetail?.cioc
        let region = countryDetail?.region     

        countryName.text = name
        
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
