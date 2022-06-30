//
//  ViewController.swift
//  WeatherToday
//
//  Created by 김천중 on 2022/06/16.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    
    let cellIdentifier: String = "customcell"
    var countries: [Countries] = []
    var button: [UIButton] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomTableViewCell
        
        cell.textLabel?.text = self.countries[indexPath.row].korean_name
        button.append(cell.detailButton)
        
        
        
        let image: UIImageView = {
            let aImageView = UIImageView()
            aImageView.image = UIImage(named: "flag_"+self.countries[indexPath.row].asset_name)
            return aImageView
        }()
        
        cell.imageView?.image = image.image
    
        return cell
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
            return
        }
        
        do {
            self.countries = try jsonDecoder.decode([Countries].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
            
        }
        
        self.tableView.reloadData()
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let nextViewController: SecondViewController = segue.destination as? SecondViewController else {
            return
        }
        
        guard let check: UIButton = sender as? UIButton else {
            return
        }
        
        var a: Int = 0
        
        for i in button {
            if check == i {
                nextViewController.countryName = self.countries[a].asset_name
            }
            a += 1
        }


        
    }


}

