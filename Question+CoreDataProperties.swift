//
//  Question+CoreDataProperties.swift
//  talksy
//
//  Created by Caio Santos on 05/04/25.
//
//

import Foundation
import CoreData


extension Question {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Question> {
        return NSFetchRequest<Question>(entityName: "Question")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var translation: String?
    @NSManaged public var sentence: String?
    @NSManaged public var user_answer: Data?
    @NSManaged public var feedback: Int16
    @NSManaged public var pronunciation: Data?

}

extension Question : Identifiable {

}
