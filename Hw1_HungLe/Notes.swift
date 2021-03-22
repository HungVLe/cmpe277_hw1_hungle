//
//  TVCNotes.swift
//  Hw1_HungLe
//
//  Created by HUNG LE on 3/21/21.
//

import UIKit
class Notes: UITableViewCell {
    
    @IBOutlet weak var buDelete: UIButton!
    
    @IBOutlet weak var laDate: UILabel!
    @IBOutlet weak var laDetails: UITextView!
    @IBOutlet weak var laTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func SetNotes(note:MyNotes){
        
        laTitle.text =  note.title
        laDetails.text = note.details
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MM/dd/yy h:mm a"
        let now = dateFormat.string(from: note.date_save!)
        laDate.text = now
        
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
