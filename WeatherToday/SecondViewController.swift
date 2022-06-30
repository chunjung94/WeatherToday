//
//  SecondViewController.swift
//  WeatherToday
//
//  Created by 김천중 on 2022/06/16.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let cellIdentifier: String = "cell"
    var countryName: String = String()
    var weather: [Weather] = []
    var weatherNow: Int = Int()
    var weatherNowtoString: String = String()
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = self.weather[indexPath.row].city_name
        cell.detailTextLabel?.text = self.weather[indexPath.row].celsiusAndFahrenheit + "," + self.weather[indexPath.row].rainfallExplain
        
        weatherNow = weather[indexPath.row].state
        
        switch weatherNow {
        case 10:
            weatherNowtoString = "sunny"
        case 11:
            weatherNowtoString = "cloudy"
        case 12:
            weatherNowtoString = "rainy"
        case 13:
            weatherNowtoString = "snowy"
        default:
            weatherNowtoString = ""
        }
        
        let image: UIImageView = {
            let aImageView = UIImageView()
            aImageView.image = UIImage(named: weatherNowtoString)
            aImageView.translatesAutoresizingMaskIntoConstraints = false
            return aImageView
        }()
        
        cell.imageView?.image = image.image
        
        
        return cell
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let country: String = countryName
        
        let jsondecoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: country) else {
            return
        }
        
        do {
            self.weather = try jsondecoder.decode([Weather].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData()
    }

        // Do any additional setup after loading the view.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let nextViewController: ThirdViewController = segue.destination as? ThirdViewController else {
            return
        }
        
        let index = tableView.indexPathForSelectedRow
        
        nextViewController.state = weather[index![1]].state
        nextViewController.degree = weather[index![1]].celsiusAndFahrenheit
        nextViewController.rain = weather[index![1]].rainfallExplain
        
        
        
    }
    
   
    
    
    
    
    
}
