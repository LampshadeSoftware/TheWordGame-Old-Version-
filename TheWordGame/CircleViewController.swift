//
//  CircleViewController.swift
//  TheWordGame
//
//  Created by Cowboy Lynk on 4/13/15.
//  Copyright (c) 2015 Lampshade Software. All rights reserved.
//

import UIKit

class CircleViewController: UIViewController {

    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func circleTapped(sender:UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    

}
