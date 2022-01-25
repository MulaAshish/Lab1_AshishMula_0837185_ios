//
//  Game.swift
//  TicTacToe-template
//
//  Created by Ashish reddy mula on 24/01/22.
//  Copyright © 2022 mohammadkiani. All rights reserved.
//

import Foundation
import CoreData
@objc (Game)
class Game :NSManagedObject{
    @NSManaged var cross:NSNumber!
    @NSManaged var nought:NSNumber!
    @NSManaged var status:[Double]!
    
}
