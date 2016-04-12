//
//  Emer2ndPageViewController.swift
//  CityHeartBeat
//
//  Created by Kewalin Sakawattananon on 4/11/2559 BE.
//  Copyright © 2559 IBMSD. All rights reserved.
//

import UIKit
import GaugeKit
import INTUAnimationEngine

class Emer2ndPageViewController: UIViewController {
    @IBOutlet var redGauge: Gauge!
    @IBOutlet var orangeGauge: Gauge!
    @IBOutlet var yellowGauge: Gauge!
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        INTUAnimationEngine.animateWithDuration(2.0, delay: 0.5, easing: INTUEaseOutSine, animations: { (percent) -> Void in
            
            self.redGauge.rate = percent * 20
            self.orangeGauge.rate = percent * 40
            self.yellowGauge.rate = percent * 40
            }, completion: nil);
    }
    
    override func viewDidDisappear(animated: Bool) {
        self.redGauge.rate = 0
        self.orangeGauge.rate = 0
        self.yellowGauge.rate = 0
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
