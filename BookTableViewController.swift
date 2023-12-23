import UIKit

class BookTableViewController: UITableViewController {
    
    var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookTableViewCell

        let book = books[indexPath.row]
//        var content = cell.defaultContentConfiguration()
//        content.text = book.title
//        content.secondaryText = book.description
//        cell.contentConfiguration = content
        cell.update(with: book)

        return cell
    }

    // MARK: - Navigation
    
    
    @IBAction func unwindToBookTable(segue: UIStoryboardSegue) {
//        performSegue(withIdentifier: "UnwindToBookTable", sender: self)
        guard segue.identifier == "UnwindToBookTable" else { return }
        
        guard let source = segue.source as? BookFormTableViewController,
            let book = source.book else {return}
        
         if let indexPath =
            tableView.indexPathForSelectedRow {
            books.remove(at: indexPath.row)
            books.insert(book, at: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
             print(segue.source)
            print("If statement executing")
             print(segue.identifier ?? "if")
            tableView.reloadData()
        } else {
            print(segue.source)
            print("Else statement executing")
            print(segue.identifier ?? "else")
            books.append(book)
            print(books.count)
            tableView.reloadData()
        }
        }
    
//    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
//        guard segue.identifier == "UnwindToBookTable" else { return }
//        
//        guard let source = segue.source as? BookFormTableViewController,
//            let book = source.book else {return}
//        
//        if let indexPath = tableView.indexPathForSelectedRow {
//            books.remove(at: indexPath.row)
//            books.insert(book, at: indexPath.row)
//            tableView.deselectRow(at: indexPath, animated: true)
//        } else {
//            books.append(book)
//        }
//    }
    /*
    @IBSegueAction func editBook(_ coder: NSCoder, sender: Any?) -> BookFormTableViewController? {
        
        /*
         if let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell) {
             // Editing Emoji
             let emojiToEdit = emojis[indexPath.row]
             return AddEditEmojiTableViewController(coder: coder,
                emoji: emojiToEdit)
         } else {
             // Adding Emoji
             return AddEditEmojiTableViewController(coder: coder,
                emoji: nil)
         }
         */
        
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else {
            return nil
        }
        //editing book
        let book = books[indexPath.row]
        
        return BookFormTableViewController(coder: coder, book: book)
    }
    */
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            books.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*
         guard segue.identifier == "UnwindToBookTable" else { return }
         
         guard let source = segue.source as? BookFormTableViewController,
         let book = source.book else {return}
         
         if let indexPath = tableView.indexPathForSelectedRow {
         books.remove(at: indexPath.row)
         books.insert(book, at: indexPath.row)
         tableView.deselectRow(at: indexPath, animated: true)
         } else {
         books.append(book)
         }
         }
         */
        guard segue.identifier == "editBook" else { return }
        
        guard let destination = segue.destination as? BookFormTableViewController else { return }
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
       // print(books[indexPath.row].title)

        destination.book = books[indexPath.row]
    }
    
    
}
