//
//  secondViewController.swift
//  CoreData Task
//
//  Created by Ashif J on 18/04/22.
//

import UIKit
import CoreData

class secondViewController: UIViewController {

    
    @IBOutlet weak var username1: UITextField!
    @IBOutlet weak var password2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    
    @IBAction func signup(_ sender: Any) {
        
        let app = UIApplication.shared.delegate as! AppDelegate

               let context = app.persistentContainer.viewContext

           let newUser = NSEntityDescription.insertNewObject(forEntityName: "Records", into: context) as NSManagedObject
                newUser.setValue(username1.text, forKey: "name")
                newUser.setValue(password2.text, forKey: "pass")

                do {
                    try context.save()
                    print("signup")
                    print("username",username1.text!)
                    print("paswword",password2.text!)
                } catch {
                    print("not saved")
                }
           let vc = self.storyboard?.instantiateViewController(withIdentifier: "thirdViewController") as! thirdViewController
            self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

