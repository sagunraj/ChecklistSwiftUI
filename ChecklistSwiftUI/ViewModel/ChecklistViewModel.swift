//
//  ChecklistViewModel.swift
//  ChecklistSwiftUI
//
//  Created by Sagun Raj Lage on 12/26/19.
//  Copyright © 2019 Sagun Raj Lage. All rights reserved.
//

import Foundation

class ChecklistViewModel: ObservableObject {
    
    init() {
        loadListItems()
    }
    
    @Published var checklistItems: [ChecklistItem] = []
    
    func checkUncheckItem(with itemID: UUID) {
        if let tappedIndex = self.checklistItems.firstIndex(where: {
            $0.id == itemID
        }) {
            self.checklistItems[tappedIndex].isChecked.toggle()
            self.saveListItems()
        }
    }
    
    func deleteListItem(at index: IndexSet) {
        checklistItems.remove(atOffsets: index)
        saveListItems()
    }
    
    func moveListItem(at index: IndexSet, destination: Int) {
        checklistItems.move(fromOffsets: index, toOffset: destination)
        saveListItems()
    }
    
    func saveListItems() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(checklistItems)
            try data.write(to: dataFilePath(), options: .atomic)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadListItems() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                checklistItems = try decoder.decode([ChecklistItem].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory,
                                             in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklist.plist")
    }
    
}
