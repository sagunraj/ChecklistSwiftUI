//
//  ContentView.swift
//  ChecklistSwiftUI
//
//  Created by Sagun Raj Lage on 12/26/19.
//  Copyright © 2019 Sagun Raj Lage. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var checklistItems: [ChecklistItem] = [
        ChecklistItem(name: "Walk the dog"),
        ChecklistItem(name: "Brush my teeth"),
        ChecklistItem(name: "Learn iOS development", isChecked: true),
        ChecklistItem(name: "Soccer practice"),
        ChecklistItem(name: "Eat ice cream", isChecked: true)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklistItems) { checklistItem in
                    HStack {
                        Text(checklistItem.name)
                        Spacer()
                        Text(checklistItem.isChecked ? "✅" : "🔲")
                    }
                    .background(Color.white) // makes the whole row clickable
                    .onTapGesture {
                        self.checkUncheckItem(with: checklistItem.id)
                    }
                }
                .onDelete(perform: deleteListItem)
                .onMove(perform: moveListItem)
            }
            .navigationBarTitle("Checklist")
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    private func checkUncheckItem(with itemID: UUID) {
        if let tappedIndex = self.checklistItems.firstIndex(where: {
            $0.id == itemID
        }) {
            self.checklistItems[tappedIndex].isChecked.toggle()
        }
    }
    
    private func deleteListItem(at index: IndexSet) {
        checklistItems.remove(atOffsets: index)
    }
    
    private func moveListItem(at index: IndexSet, destination: Int) {
        checklistItems.move(fromOffsets: index, toOffset: destination)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
