//
//  PollutionMainPageViewController.swift
//  CityHeartBeat
//
//  Created by Kewalin Sakawattananon on 4/11/2559 BE.
//  Copyright © 2559 IBMSD. All rights reserved.
//

import UIKit
import GaugeKit
import INTUAnimationEngine

class PollutionMainPageViewController: UIViewController {

    @IBOutlet var gauge: Gauge!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        INTUAnimationEngine.animateWithDuration(2.0, delay: 0.5, easing: INTUEaseOutSine, animations: { (percent) -> Void in
            
            self.gauge.rate = percent * 40
            }, completion: nil);
    }
    
    override func viewDidDisappear(animated: Bool) {
        self.gauge.rate = 0
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
