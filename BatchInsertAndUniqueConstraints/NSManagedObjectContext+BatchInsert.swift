//
//  NSManagedObjectContext+BatchInsert.swift
//  BatchInsertAndUniqueConstraints
//
//  Created by Bill on 10/6/20.
//

import CoreData

extension Array where Element == [String:Any] {
    static var randomEvents: Self {
        return [
            ["eventID":1, "name": UUID().uuidString],
            ["eventID":2, "name": UUID().uuidString],
            ["eventID":3, "name": UUID().uuidString],
            ["eventID":4, "name": UUID().uuidString]
        ]
    }

    static var randomSessions: Self {
        return [
            ["eventID":1, "sessionID":123, "name": UUID().uuidString],
            ["eventID":1, "sessionID":124, "name": UUID().uuidString],
            ["eventID":3, "sessionID":125, "name": UUID().uuidString],
            ["eventID":3, "sessionID":126, "name": UUID().uuidString]
        ]
    }
}

extension NSManagedObjectContext {
    func batchInsertEvent() {
        let request = NSBatchInsertRequest(entityName: "Event", objects: .randomEvents)
        do {
            let status = try execute(request) as! NSBatchInsertResult
            dump(status.result)
        } catch {
            dump(error)
        }
    }

    func batchInsertSession() {
        let request = NSBatchInsertRequest(entityName: "EventSession", objects: .randomSessions)
        do {
            let status = try execute(request) as! NSBatchInsertResult
            dump(status.result)
        } catch {
            dump(error)
        }
    }
}
