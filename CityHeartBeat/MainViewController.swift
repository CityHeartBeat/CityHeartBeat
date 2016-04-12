//
//  ViewController.swift
//  CityHeartBeat
//
//  Created by Kewalin Sakawattananon on 4/5/2559 BE.
//  Copyright © 2559 IBMSD. All rights reserved.
//

import UIKit
import GaugeKit
import INTUAnimationEngine

class MainViewController: UIViewController, PageViewControllerDelegate {
    @IBOutlet weak var transPageControl: UIPageControl!
    @IBOutlet weak var transContainerView: UIView!
    @IBOutlet weak var emerPageControl: UIPageControl!
    @IBOutlet weak var emerContainerView: UIView!
    @IBOutlet weak var pollutionPageControl: UIPageControl!
    @IBOutlet weak var pollutionContainerView: UIView!

    
    var transportPageViewController: PageViewController? {
        didSet {
            transportPageViewController?.pageDelegate = self
        }
        
        
        
    }
    var emergencyPageViewController: PageViewController? {
        didSet {
            emergencyPageViewController?.pageDelegate = self
        }
    }
    var pollutionPageViewController: PageViewController? {
        didSet {
            pollutionPageViewController?.pageDelegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
        
    }
    
    override func viewDidAppear(animated: Bool) {
        transPageControl.addTarget(self, action: "didChangeTransPageControlValue", forControlEvents: .ValueChanged)
        emerPageControl.addTarget(self, action: "didChangeEmerPageControlValue", forControlEvents: .ValueChanged)
        pollutionPageControl.addTarget(self, action: "didChangePollutionPageControlValue", forControlEvents: .ValueChanged)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "transSegue"{
            if let transPageViewController = segue.destinationViewController as? PageViewController {
                print("prepare segue1")
                
                self.transportPageViewController = transPageViewController
                self.transportPageViewController!.style = 1
            }
        }
        else if segue.identifier == "emerSegue" {
            if let emerPageViewController = segue.destinationViewController as? PageViewController {
                print("prepare segue2")
                self.emergencyPageViewController = emerPageViewController
                self.emergencyPageViewController!.style = 2
            }
        }
        else if segue.identifier == "pollutionSegue" {
            if let pollutionPageViewController = segue.destinationViewController as? PageViewController {
                print("prepare segue3")
                self.pollutionPageViewController = pollutionPageViewController
                self.pollutionPageViewController!.style = 3
            }
        }
    }
    
    /**
     Fired when the user taps on the pageControl to change its current page.
     */
    func didChangeTransPageControlValue() {
        print("didChangeTransPageControlValue")
        transportPageViewController?.scrollToViewController(index: transPageControl.currentPage)
    }
    func didChangeEmerPageControlValue() {
        print("didChangeEmerPageControlValue")
        emergencyPageViewController?.scrollToViewController(index: emerPageControl.currentPage)
    }
    func didChangePollutionPageControlValue() {
        print("didChangeEmerPageControlValue")
        pollutionPageViewController?.scrollToViewController(index: pollutionPageControl.currentPage)
    }
    func pageViewController(pageViewController: PageViewController,
        didUpdatePageCount count: Int) {
            print("count \(count)")
            if pageViewController == self.transportPageViewController{
                print("transPageControl.numberOfPages")
                transPageControl.numberOfPages = count
            }
            else if pageViewController == self.emergencyPageViewController{
                print("emerPageControl.numberOfPages")
                emerPageControl.numberOfPages = count
            }
            else if pageViewController == self.pollutionPageViewController{
                print("pollutionPageControl.numberOfPages")
                pollutionPageControl.numberOfPages = count
            }
    }
    func pageViewController(pageViewController: PageViewController,
        didUpdatePageIndex index: Int) {
            print("index \(index)")
            if pageViewController == self.transportPageViewController{
                print("transPageControl.currentPage")
                transPageControl.currentPage = index
            }
            else if pageViewController == self.emergencyPageViewController{
                print("emerPageControl.currentPage")
                emerPageControl.currentPage = index
            }
            else if pageViewController == self.pollutionPageViewController{
                print("pollutionPageControl.currentPage")
                pollutionPageControl.currentPage = index
            }
    }
    

}

