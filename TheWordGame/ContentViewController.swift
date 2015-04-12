//
//  ContentViewController.swift
//  UIPageViewController
//
//  Created by Cowboy Lynk on 4/10/15.
//  Copyright (c) 2015 Lampshade Software. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView! //declares examples
    @IBOutlet weak var backgroundView: UIImageView! //declares backgroud
    @IBOutlet weak var textView: UITextView! //declares explaination
    
    var pageIndex: Int!
    var textText: String!
    var imageFile: String!
    var backgroundFile: String!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.imageView.image = UIImage(named: self.imageFile)
        self.backgroundView.image = UIImage(named: self.backgroundFile)
        self.textView.text = self.textText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
