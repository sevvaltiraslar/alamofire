//
//  ExplainViewController.swift
//  Youtube
//
//  Created by SEVVAL on 3.11.2021.
//

import UIKit
import Alamofire

class ExplainViewController: UIViewController {

    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var commentText: UITextView!
    var selectedTitle = ""
    var selectedComment = ""
    var icerikler: [Ders] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        AF.request("https://apps.furkansandal.com/youtuber_app_v1/show_json.php")
          .validate()
          .responseDecodable(of: YoutuberModel.self) { (response) in
            guard let icerik = response.value else { return }
              self.icerikler = icerik.data
              
    }
    
    }
    
    @objc func getData() {
        
    }
    
}
