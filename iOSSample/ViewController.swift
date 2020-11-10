//
//  ViewController.swift
//  iOSSample
//
//  Created by Bill on 11/10/20.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    lazy var workContext: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }

        let context = appDelegate.persistentContainer.newBackgroundContext()
        context.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        return context
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func handleInsertEvents(_ sender: Any) {
        workContext.perform {
            self.workContext.batchInsertEvent()
        }
    }
    @IBAction func handleInsertSessions(_ sender: Any) {
        workContext.perform {
            self.workContext.batchInsertSession()
        }
    }
}

