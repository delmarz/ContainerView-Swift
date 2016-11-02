//
//  ViewController.swift
//  Testing Container View
//
//  Created by Kryptonite on 10/28/16.
//  Copyright © 2016 Kryptonite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var container: ContainerViewController!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  // MARK: - IBAction
  
  @IBAction func segmentedControl(_ sender: AnyObject) {
    if sender.selectedSegmentIndex == 0 {
      container.segueIdentifierReceivedFromParents(segue: "first")
    } else {
      container.segueIdentifierReceivedFromParents(segue: "second")
    }
  }
  
  @IBAction func buttonPressed(_ sender: AnyObject) {
    let firstVC = container.childViewControllers[0] as! FirstViewController
    let textField = firstVC.textField.text!
    print("textfield output: \(textField)")
  }
  
  // MARK: - Segue

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "container" {
      container = segue.destination as! ContainerViewController
    }
  }
  

}

