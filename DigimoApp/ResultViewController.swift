//
//  ResultViewController.swift
//  DigimoApp
//
//  Created by 傅培禎 on 2021/2/3.
//

import UIKit

class ResultViewController: UIViewController {

    var point = 0
    
    //var scroe: Int?
    
    @IBOutlet weak var pointLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        pointLabel.text = String("總分：\(point)")

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
