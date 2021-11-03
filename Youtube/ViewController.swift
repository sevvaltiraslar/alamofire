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
    var icerikler: [Ders] = []
    var sTitle = [String]()
    var sComment = [String]()
    var chosenTitle = ""
    var chosenComment = ""
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
        let cell = UITableViewCell()
        cell.textLabel?.text = icerikler[indexPath.row].baslik
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenTitle = icerikler[indexPath.row].baslik
        chosenComment = icerikler[indexPath.row].icerik
        performSegue(withIdentifier: "toExplain", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toExplain"{
            let destinationVC = segue.destination as! ExplainViewController
            destinationVC.selectedTitle = chosenTitle
            destinationVC.selectedComment = chosenComment
        }

}

}
