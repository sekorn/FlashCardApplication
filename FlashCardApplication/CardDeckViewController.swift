//
//  CardDeckViewController.swift
//  FlashCardApplication
//
//  Created by Scott Kornblatt on 10/6/16.
//  Copyright © 2016 Scott Kornblatt. All rights reserved.
//

import UIKit

class CardDeckViewController: UIViewController, UIPageViewControllerDelegate {

    var cardController: UIPageViewController?
    var card: Card?
    var cardData:[Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Configure the page view controller and add it as a child view controller.
        self.cardController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .vertical, options: nil)
        self.cardController!.delegate = self
        
        let startingViewController: CardViewController = self.modelController.viewControllerAtIndex(0, storyboard: self.storyboard!)!
        let viewControllers = [startingViewController]
        self.cardController!.setViewControllers(viewControllers, direction: .forward, animated: false, completion: {done in })
        
        self.cardController!.dataSource = self.modelController
        
        self.addChildViewController(self.cardController!)
        self.view.addSubview(self.cardController!.view)
        
        // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
        var pageViewRect = self.view.bounds
        if UIDevice.current.userInterfaceIdiom == .pad {
            pageViewRect = pageViewRect.insetBy(dx: 40.0, dy: 40.0)
        }
        self.cardController!.view.frame = pageViewRect
        
        self.cardController!.didMove(toParentViewController: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var modelController: CardModelController {
        // Return the model controller object, creating it if necessary.
        // In more complex implementations, the model controller may be passed to the view controller.
        
        if _modelController == nil {
            
            // set cardData array here
            for x in 1...20 {
                card = Card()
                card?.id = UUID()
                card?.question = "\(x) x 15"
                cardData.append(card!)
            }

            _modelController = CardModelController()
            _modelController?.cardData = self.cardData
            _modelController?.card = self.cardData[0]
        }
        return _modelController!
    }
    
    var _modelController: CardModelController? = nil
}
