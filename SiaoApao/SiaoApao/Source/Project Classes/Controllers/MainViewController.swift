//
//  MainViewController.swift
//  SiaoApao
//
//  Created by Abdiel Soto on 9/6/16.
//  Copyright © 2016 Raúl López. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var flowController: SAFlowController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.flowController = SAFlowController(controller: self)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        self.flowController!.showMenu()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
