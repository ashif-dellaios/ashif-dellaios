//
//  ViewController.swift
//  CoreData Task
//
//  Created by Ashif J on 18/04/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        let app = UIApplication.shared.delegate as! AppDelegate
        
        let context = app.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Records")
        request.predicate = NSPredicate(format: "name = %@", "" + username.text!)
        
        let results:NSArray = try! context.fetch(request) as NSArray
        if(results.count != 0){
            let res = results[0] as! NSManagedObject
            if password.text == res.value(forKey: "pass") as? String {
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "thirdViewController") as? thirdViewController
                self.navigationController?.pushViewController(vc!, animated: true)
            } else {
                let alert = UIAlertController(title:nil, message: "incorrect password", preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)                    }
            
            //for res in results {
            
        }else{
            let alert = UIAlertController(title:nil, message: "incorrect username and password", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
}



