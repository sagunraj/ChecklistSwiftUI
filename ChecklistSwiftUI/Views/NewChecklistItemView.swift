//
//  NewChecklistItemView.swift
//  ChecklistSwiftUI
//
//  Created by Sagun Raj Lage on 12/26/19.
//  Copyright © 2019 Sagun Raj Lage. All rights reserved.
//

import SwiftUI

struct NewChecklistItemView: View {
    
    var checklistViewModel: ChecklistViewModel
    
    @State var newItemName = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Add new item")
            Form {
                TextField("Enter new item name here", text: $newItemName)
                Button(action: {
                    let newChecklistItem = ChecklistItem(name: self.newItemName)
                    self.checklistViewModel.checklistItems.append(newChecklistItem)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add new item")
                    }
                }.disabled(newItemName.count == 0)
            }
            Text("Swipe down to cancel.")
        }
    }
}

struct NewChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView(checklistViewModel: ChecklistViewModel())
    }
}
