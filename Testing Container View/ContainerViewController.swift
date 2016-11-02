//
//  ContainerViewController.swift
//  Testing Container View
//
//  Created by Kryptonite on 10/28/16.
//  Copyright © 2016 Kryptonite. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
  private var lastViewController: UIViewController!
  private var vc: UIViewController!
  private var segueIdentifier: String!
  @IBInspectable var showFirstViewController: String!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let identifier = showFirstViewController {
      segueIdentifierReceivedFromParents(segue: identifier)
    }
  }
  
  // MARK: - Method
  
  func segueIdentifierReceivedFromParents(segue: String) {
    segueIdentifier = segue
    performSegue(withIdentifier: segueIdentifier, sender: nil)
  }
  
  // MARK: - Segue
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == segueIdentifier {
      if lastViewController != nil {
        lastViewController.view.removeFromSuperview()
      }
      
      vc = segue.destination
      addChildViewController(vc)
      vc.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
      view.addSubview(vc.view)
      
      vc.didMove(toParentViewController: self)
      lastViewController = vc
    }
  }
  
}
