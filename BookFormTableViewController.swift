//
//  BookFormTableViewController.swift
//  FavoriteBooks
//
//  Created by Andrew Higbee on 10/16/23.
//

import UIKit

class BookFormTableViewController: UITableViewController {

    var book: Book?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var lengthTextField: UITextField!
    
    init?(coder: NSCoder, book: Book?) {
        self.book = book
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        self.book = nil
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView(with: book)
        if let book = book {
            titleTextField.text = book.title
            authorTextField.text = book.author
            genreTextField.text = book.genre
            lengthTextField.text = book.length
            title = "Edit Book"
        } else {
            title = "Add Book"
//            #if DEBUG
//            titleTextField.text = "Something"
//            authorTextField.text = "Author"
//            #endif
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func updateView(with book: Book?) {
        guard let thisBook = book else { return }
//        
//        titleTextField.text = thisBook.title
//        authorTextField.text = thisBook.author
//        genreTextField.text = thisBook.genre
//        lengthTextField.text = thisBook.length
    }
    
    @IBAction func saveButtonPress(_ sender: UIButton) {
        guard let title = titleTextField.text,
            let author = authorTextField.text,
            let genre = genreTextField.text,
            let length = lengthTextField.text else { return }
        
        book = Book(title: title, author: author, genre: genre, length: length)
            performSegue(withIdentifier: "UnwindToBookTable", sender: sender)
    }
    
//    @IBAction func unwindToBookTable(segue: UIStoryboardSegue) {
//        performSegue(withIdentifier: "UnwindToBookTable", sender: self)
//    }
    
//    override func prepare(for segue: UIStoryboardSegue,
//       sender: Any?) {
//        
//        guard segue.identifier == "UnwindToBookTable" else { return }
//        
//        let title = titleTextField.text!
//        let author = authorTextField.text ?? ""
//        let genre = genreTextField.text ?? ""
//        let length = lengthTextField.text ?? ""
//        book = Book(title: title, author: author, genre: genre, length: length)
//    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
