//
//  AbsencesViewModel.swift
//  GreenLine
//
//  Created by EAPPLE on 02/10/2022.
//

import Foundation

class AbsencesViewModel {
    
    var absenceQuota: AbsenceQuota?
    var repository = AbsencesRepository()
    var absences: [Absence] = []
    
    
    var typeId: Int?
    var comment = ""
    var fromDate = ""
    var toDate = ""
    
    
    func getAbsenceQuota(success: @escaping () -> Void, failure: @escaping failureCompletionHandler) {
        repository.getAbsenceQuota(withCompletion: {
            (result) in
            switch result {
                case .success(let quota):
                    self.absenceQuota = quota
                    success()
                case .failure(let error):
                    failure(error)
            }
        })
    }
    
    func requestAbsence(success: @escaping () -> Void, failure: @escaping failureCompletionHandler) {
        guard let type = typeId else {
            failure(GreenlineError(message: "Please select absence type"))
            return
        }
        repository.requestAbsence(type: type, fromDate: fromDate, toDate: toDate, comment: comment, withCompletion: {
            (result) in
            switch result {
                case .success(_):
                    success()
                case .failure(let error):
                    failure(error)
            }
        })
    }
    
    func getAbsences(fromDate: String, toDate: String, success: @escaping () -> Void, failure: @escaping failureCompletionHandler) {
        repository.getAbsences(fromDate: fromDate, toDate: toDate, withCompletion: {
            (result) in
            switch result {
                case .success(let absences):
                    self.absences = absences
                    success()
                case .failure(let error):
                    failure(error)
            }
        })
    }
}
    
