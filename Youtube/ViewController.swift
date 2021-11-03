//
//  ViewController.swift
//  Youtube
//
//  Created by SEVVAL on 28.10.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var tableView: UITableView!
    var titleArray: [[String: Any]] = [[String: Any]]()
    var icerikler: [Ders] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        AF.request("https://apps.furkansandal.com/youtuber_app_v1/show_json.php")
          .validate()
          .responseDecodable(of: YoutuberModel.self) { (response) in
            guard let icerik = response.value else { return }
              self.icerikler = icerik.data
              self.tableView.reloadData()
          }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icerikler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! tittleCell
        if self.titleArray.count > 0 {
            let eachTitle = self.titleArray[indexPath.row]
            cell.tittleLabel.text = (eachTitle["baslik"] as? String) ?? ""
            cell.imageView?.image = (eachTitle["image"] as! UIImage)
        }*/
        let cell = UITableViewCell()
        cell.textLabel?.text = icerikler[indexPath.row].baslik
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = icerikler[indexPath.row]
        
    }


}

