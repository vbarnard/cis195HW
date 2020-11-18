//
//  CTVC.swift
//  app4-Vanessa-Barnard
//
//  Created by Vanessa Barnard on 10/22/20.
//

import UIKit
import Firebase

class ViewController: UITableViewController, AddContactDelegate {
    
    let db = Firestore.firestore()
    
    
    @IBOutlet var table: UITableView!
    
    var parks : APIdata?
    
    func didCreate(_ contact: Contact) {
        dismiss(animated: true, completion: nil)
        table.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRefreshControl()
        let session = URLSession.shared
                let url = URL(string: "https://developer.nps.gov/api/v1/parks?&api_key=fmjTSnPS04Mydb47BqwcT1CtjGO8H1ahMeXHKQR3")!
                let task = session.dataTask(with: url, completionHandler: { data, response, error in

                    if error != nil {
                        return
                    }

                    self.db.collection("parks").document("data").setData(["json" : data!]) { err in
                        if let err = err {
                            print("Error writing document: \(err)")
                        } else {
                            print("Document successfully written!")
                        }
                    }

                    DispatchQueue.main.async {
                        self.table.reloadData()
                    }
                        
                    
                    
                })
        
                task.resume()
             
       DispatchQueue.main.async {
          self.refreshControl?.endRefreshing()
       }
        
    }
    
    func configureRefreshControl () {
       // Add the refresh control to your UIScrollView object.
       refreshControl = UIRefreshControl()
       refreshControl?.addTarget(self, action:
                                          #selector(handleRefreshControl),
                                          for: .valueChanged)
    }
        
    @objc func handleRefreshControl() {
        
        let docRef = db.collection("parks").document("data")

        docRef.getDocument { (document, error) in

            if let document = document, document.exists {
                let data = (document.data() as! [String : Data])["json"]!
                let parks = try? JSONDecoder().decode(APIdata.self, from: data)
                self.parks = parks
                DispatchQueue.main.async {
                          self.table.reloadData()
                       }
                
            } else {
                print("Document does not exist")
            }
        }
        
        //self.db.collection("parks").document("data").getDocument(completion: <#T##FIRDocumentSnapshotBlock##FIRDocumentSnapshotBlock##(DocumentSnapshot?, Error?) -> Void#>)

//        let session = URLSession.shared
//                let url = URL(string: "https://developer.nps.gov/api/v1/parks?&api_key=fmjTSnPS04Mydb47BqwcT1CtjGO8H1ahMeXHKQR3")!
//                let task = session.dataTask(with: url, completionHandler: { data, response, error in
//
//                    if error != nil {
//                        return
//                    }
//
//                    do {
//                        let json = try JSONDecoder().decode(APIdata.self, from: data! )
//                        self.parks = json
//                        //self.db.collection("parks").addDocument(data: ["data" : json])
//                        //print(json)
//                        DispatchQueue.main.async {
//                            self.table.reloadData()
//                        }
//
//
//                    } catch {
//                        print("Error during JSON serialization: \(error.localizedDescription)")
//                    }
//
//                })
//
//                task.resume()
//
//       DispatchQueue.main.async {
//          self.refreshControl?.endRefreshing()
//       }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parks?.data.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "1")! as! MyCell
        
        if parks?.data.count ?? 0 == 0 {
            return cell
        }
        cell.label1.text = parks!.data[indexPath.row].fullName
        
        cell.label2.text = parks!.data[indexPath.row].designation
        
        if parks!.data[indexPath.row].images.count != 0 {
            let imageUrlString = parks!.data[indexPath.row].images[0].url
            
            guard let imageUrl:URL = URL(string: imageUrlString) else {
                        return cell
                    }
            
            cell.img.loadImge(withUrl: imageUrl)
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currContact = parks!.data[indexPath.row]
        performSegue(withIdentifier: "specPark", sender: currContact)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        
        //dump(sender)
        
        if let contact = sender as? Contact {
            //print(contact)
            if (segue.identifier == "specPark") {
                dump(contact)
                let vc = segue.destination as! DVC
                vc.myDescription = contact.description
                vc.myDesignation = contact.designation
                vc.images = contact.images
                vc.fullName = contact.fullName
            }
        }
    }
    
    
}

extension UIImageView {
    func loadImge(withUrl url: URL) {
           DispatchQueue.global().async { [weak self] in
               if let imageData = try? Data(contentsOf: url) {
                   if let image = UIImage(data: imageData) {
                       DispatchQueue.main.async {
                        self?.image = image
                       }
                   }
               }
           }
       }
}
