

import UIKit

extension UITableViewController {
    
    func showAlert(title: String,
                   message: String,
                   actionButtonTitle: String,
                   cancelButtonTitle: String,
                   placeholder: String,
                   completion : @escaping (String)->() ) {
        
        let alert = UIAlertController(title: "\(title)", message: "\(message)", preferredStyle: .alert)
        
        alert.addTextField { mytextfield in
            mytextfield.placeholder = placeholder
        }
        
        let actionButton = UIAlertAction(title: "\(actionButtonTitle)", style: .default) { action in
            completion(alert.textFields?[0].text ?? "" )
            
        }
        
        let cancelButton = UIAlertAction(title: "\(cancelButtonTitle)", style: .cancel, handler: nil)
        
        alert.addAction(actionButton)
        alert.addAction(cancelButton)
        present(alert, animated: true, completion: nil)
    }
}
