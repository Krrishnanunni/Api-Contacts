//
//  HomeVC.swift
//  api-project-3
//
//  Created by iroid on 17/06/25.
//

import UIKit

class HomeVC: UIViewController ,UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsondata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        let dict = self.jsondata[indexPath.row] as! NSDictionary
        cell.namee.text = dict["name"] as? String
//        cell.bttn.tag = indexPath.row
//        cell.bttn.addTarget(self, action: #selector(bttnTapped), for: .touchUpInside)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let SB = UIStoryboard(name: "Main", bundle: nil)
                let detailedVC = SB.instantiateViewController(withIdentifier: "DeailedVC") as! DeailedVC
        let MapviewVC = SB.instantiateViewController(withIdentifier: "map") as! Map_ViewVC
                let dict = self.jsondata[indexPath.row] as! NSDictionary
        detailedVC.stringusername = (dict["username"] as? String)!
        detailedVC.stringphone   = (dict["phone"] as? String)!
        detailedVC.stringemail   = (dict["email"] as? String)!
        detailedVC.stringwebsite = (dict["website"] as? String)!
        detailedVC.stringname = (dict["name"] as? String)!
        self.address = dict["address"] as? NSDictionary
        
        detailedVC.stringstreet = (self.address!["street"] as? String)!
        
        detailedVC.passedStreet = (self.address!["street"] as? String)!
        
        detailedVC.stringsuite   = (self.address!["suite"] as? String)!
        detailedVC.stringzipcode = (self.address!["zipcode"] as? String)!
        detailedVC.stringcity    = (self.address!["city"] as? String)!
        
        detailedVC.passedCity    = (self.address!["city"] as? String)!
        self.geo = self.address!["geo"] as? NSDictionary
        print(self.geo,"\\\\\\\\\\\\\\\\\\\\\\\\\\")
        detailedVC.passedLat = (self.geo!["lat"] as? String)!
        detailedVC.passedLong = (self.geo!["lng"] as? String)!
        
        
        
        
        
        
        
        
        
        navigationController?.pushViewController(detailedVC, animated: true)
        

    }
    
//    @objc func bttnTapped(){
//        let SB = UIStoryboard(name: "Main", bundle: nil)
//        let detailedVC = SB.instantiateViewController(withIdentifier: <#T##String#>) as! DeailedVC
//        let dict = self.jsondata[indexPath.row] as! NSDictionary
//        detailedVC.Username.text = dict["name"] as? String
//
//
//
//    }

    
    var address:NSDictionary?
    var geo:NSDictionary?
    @IBOutlet weak var mytableview: UITableView!
    var jsondata = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Contacts"
        
        let urlstring = URL(string: "https://jsonplaceholder.typicode.com/users")
        let UrlReq = URLRequest(url: urlstring!)
        let task = URLSession.shared .dataTask(with: UrlReq){
            (data,request,error)in
            if let mydata = data {
                print("my data ---------->",mydata)
                do{
                    self.jsondata = try
                    JSONSerialization.jsonObject(with: mydata, options: []) as! NSArray
                    
                    do{
                        DispatchQueue.main.async {
                            self.mytableview.reloadData()
                            
                            
                        }
                    }
                }catch{
                    print("error -------> ",error.localizedDescription)
                }
            }
        }
        task.resume()
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
