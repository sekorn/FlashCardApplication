//
//  CardModelController.swift
//  FlashCardApplication
//
//  Created by Scott Kornblatt on 10/7/16.
//  Copyright © 2016 Scott Kornblatt. All rights reserved.
//

import UIKit

class CardModelController: NSObject, UIPageViewControllerDataSource {
    
    var cardData:[Card] = []
    var card: Card?
    
    override init() {
        super.init()
    }
    
    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> CardViewController? {
        // Return the data view controller for the given index.
        if (self.cardData.count == 0) || (index >= self.cardData.count) {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        let cardViewController = storyboard.instantiateViewController(withIdentifier: "CardViewController") as! CardViewController
        cardViewController.cardObject = self.cardData[index]
        return cardViewController
    }
    
    func indexOfViewController(_ viewController: CardViewController) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        let index = cardData.index { (card) -> Bool in
            if (card.id == viewController.cardObject!.id){
                return true
            }
            return false
        }!
        
        print(index)
        return index
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = self.indexOfViewController(viewController as! CardViewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        let vc = self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
        return vc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = self.indexOfViewController(viewController as! CardViewController)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.cardData.count {
            return nil
        }
        
        let vc = self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
        return vc
    }
}
