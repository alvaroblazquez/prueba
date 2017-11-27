//
//  ViewController.swift
//  prueba
//
//  Created by Alvaro Blazquez Montero on 17/11/17.
//  Copyright © 2017 Alvaro Blazquez Montero. All rights reserved.
//

import UIKit
import Moya
import JWT


class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*let url = URL(string: "http://php54.apache.localhost/listProduct.html")
        let request = URLRequest(url: url!)
        prepareActivityIndicator()
        
        //webView.scalesPageToFit = true
        webView.delegate = self
        webView.loadRequest(request)
        
        prepareMoya()*/

        let jwt = JWT.encode(claims: ["my": "payload"], algorithm: .hs256("secret".data(using: .utf8)!))
        print(jwt)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareActivityIndicator() {
        activityIndicator.center = self.view.center
        activityIndicator.color = .black
        activityIndicator.hidesWhenStopped = true
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("acaba de empezar")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        // Disable user selection
        webView.stringByEvaluatingJavaScript(from: "document.documentElement.style.webkitUserSelect='none'")
        // Disable callout
        webView.stringByEvaluatingJavaScript(from: "document.documentElement.style.webkitTouchCallout='none'")
        
        let js = "document.body.style.setProperty(\"-webkit-tap-highlight-color\", \"rgba(0,0,0,0)\");"
        
        webView.stringByEvaluatingJavaScript(from: js)
        
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print(request.url?.scheme ?? "no lo piya")
        return true
    }
    
    /// Prepare Moya calls
    ///
    /// - Parameter x: Es un parametro muy importante
    /// - Returns:     Devuelve algo
    func prepareMoya() {
        
        let endpointClosure = { (target: MyService) -> Endpoint<MyService> in
            return Endpoint<MyService>(url: target.baseURL.absoluteString, sampleResponseClosure: {.networkResponse(200, target.sampleData)}, method: target.method, task: target.task, httpHeaderFields: target.headers)
        }
        
        /*let failureEndpointClosure = { (target: MyService) -> Endpoint<MyService> in
            let sampleResponseClosure = { () -> (EndpointSampleResponse) in
                if shouldTimeout {
                    return .networkError(NSError())
                } else {
                    return .networkResponse(200, target.sampleData)
                }
            }
            return Endpoint<MyService>(url: URL(target), sampleResponseClosure: sampleResponseClosure, method: target.method, task: target.task, httpHeaderFields: target.headers)
        }
        
        let provider = MoyaProvider<MyService>()
        provider.request(.createUser(firstName: "James", lastName: "Potter")) { result in
            // do something with the result (read on for more details)
            print(result)
        }*/
        
        //let provider = MoyaProvider<MyService>(stubClosure: MoyaProvider.immediatelyStub(<#T##_#>))
        let provider = MoyaProvider<MyService>(stubClosure: MoyaProvider.immediatelyStub)
        
        
        provider.request(.zen) { result in
            switch result {
            case let .success(moyaResponse):
                //let data = moyaResponse.data // Data, your JSON response is probably in here!
                //let statusCode = moyaResponse.statusCode // Int - 200, 401, 500, etc
                do {
                    let statusCode = try moyaResponse.filterSuccessfulStatusCodes()
                    let data = try moyaResponse.mapJSON()
                    print(data)
                }
                catch {
                    // show an error to your user
                }
            // do something in your app
            case let .failure(error):
                print(error)
                break
                // TODO: handle the error == best. comment. ever.
            }
        }
    }


}

