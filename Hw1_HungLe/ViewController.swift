//
//  ViewController.swift
//  Hw1_HungLe
//
//  Created by HUNG LE on 3/21/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtTitle: UITextField!
    
    @IBOutlet weak var txtDes: UITextView!
    
    var EditNote:MyNotes?
    override func viewDidLoad() {
        super.viewDidLoad()
        if  let note = EditNote  {
            txtTitle.text = note.title
            txtDes.text = note.details
        }
        
    }
    
    @IBAction func buSave(_ sender: Any) {
        var newNote:MyNotes?
        if  let note = EditNote  {
            newNote = note
        }else{
            newNote = MyNotes(context: context)
        }
        newNote?.title = txtTitle.text
        newNote?.details =  txtDes.text
        newNote?.date_save = NSDate() as Date
        ad.saveContext()
        txtTitle.text = ""
        txtDes.text = ""
    }
    
    
    @IBAction func buBack(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
}


