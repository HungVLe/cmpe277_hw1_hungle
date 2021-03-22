//
//  VCListNotes.swift
//  Hw1_HungLe
//
//  Created by HUNG LE on 3/21/21.
//

import UIKit
import CoreData
class ListNotes: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    var listNotes = [MyNotes]()
    
    @IBOutlet weak var myview: UIView!
    
    @IBOutlet weak var tvNotesList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNotes()
        tvNotesList.delegate = self
        tvNotesList.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:Notes = tableView.dequeueReusableCell(withIdentifier: "CellNote", for:indexPath) as! Notes
        cell.SetNotes(note: listNotes[indexPath.row])
        cell.buDelete.tag = indexPath.row
        cell.buDelete.addTarget(self, action: #selector(buDeletePress(_:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func buDeletePress(_ sender:UIButton){
        
        print("index \(sender.tag)")
        context.delete(listNotes[sender.tag])
        loadNotes()
    }
    
    @objc func buEditPress(_ sender:UIButton){
        
        performSegue(withIdentifier: "EditOrAddSegway", sender: listNotes[sender.tag])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "EditOrAddSegway" {
            if let AddOREdit = segue.destination as? ViewController {
                if let mynote = sender as? MyNotes {
                    AddOREdit.EditNote = mynote
                }
            }
        }
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func buAdd(_ sender: Any) {
        
        performSegue(withIdentifier: "EditOrAddSegway", sender: nil)
    }
    func loadNotes(){
        
        let fetchRequest:NSFetchRequest<MyNotes> = MyNotes.fetchRequest()
        do{
            listNotes = try context.fetch(fetchRequest)
            tvNotesList.reloadData()
        }catch{
            print("cannot read from database")
        }
    }
    
    
}
