//
//  CardDeckTableViewController.swift
//  FlashCardApplication
//
//  Created by Scott Kornblatt on 10/5/16.
//  Copyright © 2016 Scott Kornblatt. All rights reserved.
//

import UIKit

class CardDeckTableViewController: UITableViewController {

    var deck: CardDeck?
    var isScrolling: Bool?
    var indexpath:IndexPath?
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        deck = CardDeck()
        isScrolling = false
        
        //var path = IndexPath(row: 10, section: 0)
        //tableView.scrollToRow(at: path, at: .bottom, animated: true)
        
        //tableView.setContentOffset(tableView.contentOffset, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return deck!.cards.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Card") as! CardTableViewCell
        cell.useCard()
        cell.questionLabel.text = deck?.cards[indexPath.row].question
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height - 20
    }
    
    func SwipeCard(gesture: UISwipeGestureRecognizer) {
        
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
        if (isScrolling)! {
            let trans = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
            var tableViewScrollPos: UITableViewScrollPosition?
            
            if (trans.y > 0) {
                // scroll up
                counter -= 1
                tableViewScrollPos = UITableViewScrollPosition.bottom
            } else {
                // scroll down
                counter += 1
                tableViewScrollPos = UITableViewScrollPosition.top
            }
            
            indexpath = IndexPath(row: counter, section: 0)
            tableView.scrollToRow(at: indexpath!, at: tableViewScrollPos!, animated: true)
            tableView.setContentOffset(tableView.contentOffset, animated: false)
            isScrolling = false
        }
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isScrolling = true
        
        let translation = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
        
        if translation.y > 0 {
            tableView.scrollToNearestSelectedRow(at: .bottom, animated: true)
        } else {
            tableView.scrollToNearestSelectedRow(at: .top, animated: true)
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
