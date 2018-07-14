//
//  ViewController.swift
//  CoreDataSaveNumber
//
//  Created by dohien on 7/13/18.
//  Copyright © 2018 hiền hihi. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            if let entity = try AppDelegate.context.fetch(Entity.fetchRequest()) as? [Entity] {
                if let lastEntity = entity.last {
                    nameTextField.text  = String(lastEntity.age)
                    print(lastEntity.age)
                    
                }
            }
        } catch  {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func saveButton(_ sender: UIButton) {
        if nameTextField.text != "" {
            let entity = Entity(context: AppDelegate.context)
            entity.age = Int16(nameTextField.text ?? "") ?? 0
            AppDelegate.saveContext()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
