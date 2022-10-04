//
//  ScheduleViewModel.swift
//  GreenLine
//
//  Created by EAPPLE on 12/09/2022.
//

import Foundation

struct Location: Hashable {
    var id: Int
    var name: String
}

class ScheduleViewModel {
    
    var shifts: [Shift] = []
    var locations: [Location] = []
    var searchedLocations: [Location] = []
    var shiftsForLocation: [Int: [Shift]] = [:]
    private var repository = ScheduleRepository()
    
    func getAllShifts(date: String, success: @escaping () -> Void, failure: @escaping failureCompletionHandler) {
        repository.getAllShifts(from: date, toDate: date, pageNo: 1, searchText: "", withCompletion: { (result) in
            switch result {
                case .success(let shifts):
                    self.shifts = shifts
                    self.locations = Array(Set(shifts.map({
                        return Location(id: $0.locationId ?? -1, name: $0.locationName ?? "")
                    })))
                    self.searchedLocations = self.locations
                    self.locations.forEach({ location in
                        let shifts = self.shifts.filter({
                            $0.locationId == location.id
                        })
                        self.shiftsForLocation[location.id] = shifts
                    })
                    success()
                case .failure(let error):
                    failure(error)
            }
        })
    }
}
