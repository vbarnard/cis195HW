import UIKit

@available(iOS 13.0, *)
class NewsfeedTableViewController: UITableViewController {
    
    var newsItems = [NewsItem]()
    
    var image1 = UIImage(named: "star-filled")
    var image2 = UIImage(named: "star-hollow")
    
    
    // MARK: IBAction
    @IBAction func didSelectAdd(_ sender: UIBarButtonItem) {
        let ac = UIAlertController(title: "Enter Title", message: nil, preferredStyle: .alert)
        ac.addTextField()

        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
            let newNews = NewsItem(title: ac.textFields![0].text!, favorited: false)
            self.newsItems.insert(newNews, at: 0)
            self.tableView.reloadData()
            print(self.newsItems)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) {_ in
            self.resignFirstResponder()
        }

        ac.addAction(submitAction)
        ac.addAction(cancelAction)

        present(ac, animated: true)
        
        // TODO: Present an alert view with a text field. When "Done" is pressed, a new NewsItem should be created and inserted at the START of your array of items, and the table view data should be reloaded
    }

    // MARK: - Basic table view methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "1")!
        (cell.viewWithTag(1) as! UILabel).text = newsItems[indexPath.row].title
        if newsItems[indexPath.row].favorited {
            (cell.viewWithTag(2) as! UIImageView).image = image1
        } else {
            (cell.viewWithTag(2) as! UIImageView).image = image2
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
    // MARK: - Handle user interaction
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        if newsItems[indexPath.row].favorited {
            (cell!.viewWithTag(2) as! UIImageView).image = image2
            newsItems[indexPath.row].favorited.toggle()
        } else {
            (cell!.viewWithTag(2) as! UIImageView).image = image1
            newsItems[indexPath.row].favorited.toggle()
        }
    }
    
    
    // MARK: - Swipe to delete functionality
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
                newsItems.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }

}

