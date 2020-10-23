//
//  CTVC.swift
//  app4-Vanessa-Barnard
//
//  Created by Vanessa Barnard on 10/22/20.
//

import UIKit

class CTVC: UITableViewController, AddContactDelegate {
    func didCreate(_ contact: Contact) {
        dismiss(animated: true, completion: nil)
        contactList.append(contact)
        contactList.sort {
            $0.lastName < $1.lastName
        }
        table.reloadData()
    }
    
    @IBOutlet var table: UITableView!
    
    var contactList = [Contact(firstName: "Vanessa", lastName: "Barnard", company: "UPenn", email: "vbarnard@seas.upenn.edu", phoneNumber: 5555555555, image: nil), Contact(firstName: "Jasmine", lastName: "Barnard", company: "UChicago", email: "jb@gmail.com", phoneNumber: 4444444444, image: nil)]
    
    
    @IBAction func add(_ sender: UIBarButtonItem) {
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "1")!
        cell.textLabel!.text = contactList[indexPath.row].firstName + " " + contactList[indexPath.row].lastName
        
        //(cell.viewWithTag(1) as! UITableViewCell).textLabel = contactList[indexPath.row].firstName + " " + contactList[indexPath.row].lastName
        
        cell.detailTextLabel?.text = contactList[indexPath.row].company

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let cell = tableView.cellForRow(at: indexPath)
        let currContact = contactList[indexPath.row]
        performSegue(withIdentifier: "DVC", sender: currContact)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        
        if (segue.identifier == "input") {
            let nc = segue.destination as! UINavigationController
            let vc = nc.topViewController as! ACVC
            vc.delegate = self
        }
        
        if let contact = sender as? Contact {
            if (segue.identifier == "DVC") {
                let vc = segue.destination as! DVC
                vc.firstName = contact.firstName
                vc.lastName = contact.lastName
                vc.company = contact.company
                vc.email = contact.email
                vc.phoneNumber = contact.phoneNumber
                vc.image = contact.image
            }
        
        }
    }

}
