//
//  ViewController.swift
//  BatchInsertAndUniqueConstraints
//
//  Created by Bill on 10/6/20.
//

import Cocoa

class ViewController: NSViewController {
    lazy var workContext: NSManagedObjectContext = {
        guard let appDelegate = NSApp.delegate as? AppDelegate else {
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

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
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
    @IBAction func handleTruncate(_ sender: Any) {
        workContext.persistentStoreCoordinator!.persistentStores.forEach {
            guard let location = $0.url else {
                return
            }
            try! self.workContext.persistentStoreCoordinator!.destroyPersistentStore(at: location, ofType: $0.type)
        }
    }
}

