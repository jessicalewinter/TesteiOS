//
//  UITableViewCell+automaticDequeue.swift
//  InvestmentApp
//
//  Created by Jessica Lewinter on 09/06/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

extension UITableView: Dequeuable {
    typealias CellType = UITableViewCell
    
    func dequeueReusableCell<T: CellType>() -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifer) as? T else {
            fatalError("Trying to dequeue cell of different type from reuseIdentifier")
        }
        return cell
    }
    
    func dequeueReusableCell<T: CellType>(for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifer, for: indexPath) as? T else {
            fatalError("Trying to dequeue cell of different type from reuseIdentifier")
        }
        return cell
    }
    
}
