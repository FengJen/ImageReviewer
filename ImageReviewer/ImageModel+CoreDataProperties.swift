//
//  ImageModel+CoreDataProperties.swift
//  ImageReviewer
//
//  Created by 謝豐任 on 2017/4/7.
//  Copyright © 2017年 伍智瑋. All rights reserved.
//

import Foundation
import CoreData


extension ImageModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageModel> {
        return NSFetchRequest<ImageModel>(entityName: "ImageModel");
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var image: NSData?

}
