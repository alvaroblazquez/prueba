//
//  SecondViewController.swift
//  prueba
//
//  Created by Alvaro Blazquez Montero on 17/11/17.
//  Copyright © 2017 Alvaro Blazquez Montero. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIWebViewDelegate  {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //let html = "<a href=\"www.google.es\">Google</a>"
        let html = "<html><body><p><a href=\"myapp://next\">Next Window</a></p><p><a href=\"myapp://back\">Back Window</a></p></body></html>"
        //webView.delegate = self
        webView.loadHTMLString(html, baseURL: nil)
        // Do any additional setup after loading the view.
        
        //let url = URL(string: "https://www.nutritienda.com")
        //let request = URLRequest(url: url!)
        
        //webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print(request.url?.scheme ?? "no lo piya")
        let scheme = request.url?.scheme ?? "no lo piya"
        if scheme=="myapp" {
            let absoluteUrl = request.url?.absoluteString ?? ""
            let action = absoluteUrl.replacingOccurrences(of: scheme + "://", with: "")
            if action == "back" {
                navigationController?.popViewController(animated: true)
            } else {
                performSegue(withIdentifier: "next", sender: nil)
            }
            
        }
        return true
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
