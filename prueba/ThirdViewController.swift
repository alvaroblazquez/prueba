//
//  ThirdViewController.swift
//  prueba
//
//  Created by Alvaro Blazquez Montero on 17/11/17.
//  Copyright © 2017 Alvaro Blazquez Montero. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var webView1: UIWebView!
    @IBOutlet weak var webView2: UIWebView!
    @IBOutlet weak var webView3: UIWebView!
    @IBOutlet weak var webView4: UIWebView!
    @IBOutlet weak var webView5: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://d2mxwq0yq0jq8b.cloudfront.net/catalog/big/amix-nutrition-predator-protein-4kg.jpg")
        let request = URLRequest(url: url!)
        webView1.loadRequest(request)
        webView2.loadRequest(request)
        webView3.loadRequest(request)
        webView4.loadRequest(request)
        webView5.loadRequest(request)
        
        webView1.scrollView.isScrollEnabled = false
        webView2.scrollView.isScrollEnabled = false
        webView3.scrollView.isScrollEnabled = false
        webView4.scrollView.isScrollEnabled = false
        webView5.scrollView.isScrollEnabled = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
