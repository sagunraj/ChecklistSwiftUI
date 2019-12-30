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
    
    @State var newChecklistItemViewIsVisible = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklistViewModel.checklistItems) { index in
                    RowView(checklistItem: self.$checklistViewModel.checklistItems[index])
                }
                .onDelete(perform: checklistViewModel.deleteListItem)
                .onMove(perform: checklistViewModel.moveListItem)
            }
            .navigationBarTitle("Checklist")
            .navigationBarItems(leading: Button(action: {
                self.newChecklistItemViewIsVisible = true
            }) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Add item")
                }
                },
                                trailing: EditButton()
            ).sheet(isPresented: $newChecklistItemViewIsVisible) {
                NewChecklistItemView(checklistViewModel: self.checklistViewModel)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
