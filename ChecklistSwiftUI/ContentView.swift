//
//  ContentView.swift
//  ChecklistSwiftUI
//
//  Created by Sagun Raj Lage on 12/26/19.
//  Copyright © 2019 Sagun Raj Lage. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var checklistItems = [
        "Take vocal lessons",
        "Record hit single",
        "Learn every martial art",
        "Design costume",
        "Design crime-fighting vehicle",
        "Come up with superhero name",
        "Befriend space raccoon",
        "Save the world",
        "Star in blockbuster movie"
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklistItems, id: \.self) { item in
                    Text(item).onTapGesture {
                        self.checklistItems.remove(at: 0)
                    }
                }
                .onDelete(perform: deleteListItem)
                .onMove(perform: moveListItem)
            }
            .navigationBarTitle("Checklist")
            .navigationBarItems(trailing: EditButton())
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
