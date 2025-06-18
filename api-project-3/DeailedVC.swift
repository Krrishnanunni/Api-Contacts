//
//  DeailedVC.swift
//  api-project-3
//
//  Created by iroid on 17/06/25.
//

import UIKit

class DeailedVC: UIViewController {

    @IBOutlet weak var Username     : UILabel!
    @IBOutlet weak var phone        : UILabel!
    @IBOutlet weak var email        : UILabel!
    @IBOutlet weak var website      : UILabel!
    @IBOutlet weak var street       : UILabel!
    @IBOutlet weak var suite        : UILabel!
    @IBOutlet weak var zipcode      : UILabel!
    @IBOutlet weak var city         : UILabel!
    
    
    
    var stringusername = ""
    var stringstreet   = ""
    var stringphone    = ""
    var stringemail    = ""
    var stringwebsite  = ""
    var stringsuite    = ""
    var stringzipcode  = ""
    var stringcity     = ""
    var stringname     = ""
    
    
    
    var passedLat       = ""
    var passedLong      = ""
    var passedStreet    = ""
    var passedCity      = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = stringname
        
        Username.text  = stringusername
        street.text    = stringstreet
        phone.text      = stringphone
        email.text      = stringemail
        website.text    = stringwebsite
        suite.text      = stringsuite
        zipcode.text    = stringzipcode
        city.text       = stringcity
                        
        
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func GetDirection(_ sender: Any) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let mapVC = sb.instantiateViewController(withIdentifier: "map") as! Map_ViewVC
        mapVC.passedLat     = passedLat
        mapVC.passedLong    = passedLong
        mapVC.passedStreet  = passedStreet
        mapVC.passedCity    = passedCity
        
        navigationController?.pushViewController(mapVC, animated: true)
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
