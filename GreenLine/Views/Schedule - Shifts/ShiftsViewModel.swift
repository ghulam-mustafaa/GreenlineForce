//
//  ShiftsViewModel.swift
//  GreenLine
//
//  Created by EAPPLE on 13/09/2022.
//

import Foundation

struct Position: Hashable {
    var id: Int
    var name: String
}

class ShiftsViewModel {
    
    var location: Location?
    var shifts: [Shift] = []
    var positions: [Position] = []
    var postitionsForShift: [Int: [Shift]] = [:]
    
    func populatePositions() {
        self.positions = Array(Set(shifts.map({
            return Position(id: $0.positionId ?? -1, name: $0.positionName ?? "")
        })))
        self.positions.forEach({ position in
            let shifts = self.shifts.filter({
                $0.positionId == position.id
            })
            self.postitionsForShift[position.id] = shifts
        })
    }
}
