//
//  ThirdViewController.swift
//  WeatherToday
//
//  Created by 김천중 on 2022/06/16.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    var state: Int = 0
    var degree: String = ""
    var rain: String = ""
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        switch state {
        case 10:
            self.label1.text = "sunny"
        case 11:
            self.label1.text = "cloudy"
        case 12:
            self.label1.text = "rainy"
        case 13:
            self.label1.text = "snowy"
        default:
            self.label1.text = ""
        }
        
        label2.text = degree
        
        label3.text = rain
        
        let bimage: UIImageView = {
            let aImageView = UIImageView()
            aImageView.image = UIImage(named: self.label1.text!)
            return aImageView
        }()
        
        image.image = bimage.image
        // Do any additional setup after loading the view.
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
