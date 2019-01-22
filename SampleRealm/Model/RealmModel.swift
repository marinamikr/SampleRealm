//
//  RealmModel.swift
//  SampleRealm
//
//  Created by 橋詰明宗 on 2019/01/22.
//  Copyright © 2019年 橋詰明宗. All rights reserved.
//

import Foundation
import RealmSwift

class RealmModel: Object {
    @objc dynamic var date: String!
    @objc dynamic var text: String!
    @objc dynamic var image: NSData!

}
