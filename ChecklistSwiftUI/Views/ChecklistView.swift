//
//  ContentView.swift
//  ChecklistSwiftUI
//
//  Created by Sagun Raj Lage on 12/26/19.
//  Copyright © 2019 Sagun Raj Lage. All rights reserved.
//

import SwiftUI

struct ChecklistView: View {
    
    @ObservedObject var checklistViewModel = ChecklistViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklistViewModel.checklistItems) { checklistItem in
                    HStack {
                        Text(checklistItem.name)
                        Spacer()
                        Text(checklistItem.isChecked ? "✅" : "🔲")
                    }
                        .background(Color.white) // makes the whole row clickable
                        .onTapGesture {
                            self.checklistViewModel.checkUncheckItem(with: checklistItem.id)
                    }
                }
                .onDelete(perform: checklistViewModel.deleteListItem)
                .onMove(perform: checklistViewModel.moveListItem)
            }
            .navigationBarTitle("Checklist")
            .navigationBarItems(trailing: EditButton())
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
