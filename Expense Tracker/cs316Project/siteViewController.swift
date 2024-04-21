//
//  siteViewController.swift
//  cs316Project
//
//  Created by Dolcy Sareen on 2024-04-01.
//

import WebKit

class siteViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {


    @IBOutlet var siteView: WKWebView!
    @IBOutlet var siteView1: WKWebView!
    @IBOutlet var siteView2: WKWebView!
       

    override func viewDidLoad() {
        super.viewDidLoad()
        loadAddress()
        loadAddress1()
        loadAddress2()
    }
    func loadAddress() {
        let myURL = URL(string:"https://youtu.be/4sT2B2SRypo?si=ZfBfv-DFkMNrD6LH")
        let request = URLRequest(url: myURL!)
        siteView.load(request)
    }
    func loadAddress1() {
        let myURL = URL(string:"https://youtu.be/HQzoZfc3GwQ?feature=shared")
        let request = URLRequest(url: myURL!)
        siteView1.load(request)
    }
    
    func loadAddress2() {
        let myURL = URL(string:"https://youtu.be/-M1iMS9WM6U?feature=shared")
        let request = URLRequest(url: myURL!)
        siteView2.load(request)
    }
}
extension UIActivityIndicatorView {
    func scaleIndicator(factor: CGFloat) {
        transform = CGAffineTransform(scaleX: factor, y: factor)
    }
}
