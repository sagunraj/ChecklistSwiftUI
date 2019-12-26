//
//  ChecklistViewModel.swift
//  ChecklistSwiftUI
//
//  Created by Sagun Raj Lage on 12/26/19.
//  Copyright © 2019 Sagun Raj Lage. All rights reserved.
//

import Foundation

class ChecklistViewModel: ObservableObject {
    
    @Published var checklistItems: [ChecklistItem] = [
        ChecklistItem(name: "Walk the dog"),
        ChecklistItem(name: "Brush my teeth"),
        ChecklistItem(name: "Learn iOS development", isChecked: true),
        ChecklistItem(name: "Soccer practice"),
        ChecklistItem(name: "Eat ice cream", isChecked: true)
    ]
    
    func checkUncheckItem(with itemID: UUID) {
        if let tappedIndex = self.checklistItems.firstIndex(where: {
            $0.id == itemID
        }) {
            self.checklistItems[tappedIndex].isChecked.toggle()
        }
    }
    
    func deleteListItem(at index: IndexSet) {
        checklistItems.remove(atOffsets: index)
    }
    
    func moveListItem(at index: IndexSet, destination: Int) {
        checklistItems.move(fromOffsets: index, toOffset: destination)
    }
    
}
