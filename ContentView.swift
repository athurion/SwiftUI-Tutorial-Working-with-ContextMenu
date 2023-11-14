//
//  ContentView.swift
//  SwiftUI Tutorial: Working with ContextMenu
//
//  Created by Alvin Sosangyo on 11/14/23.
//


import SwiftUI

struct ContentView: View {
    
    @State private var weaponList = ["Sword", "Dagger", "Spear", "Axe", "Mace", "Staff", "Wand", "Bow", "Crossbow"]
    
    var body: some View {
        List {
            ForEach(weaponList, id: \.self) { index in
                Text(index)
                    .contextMenu {
                        menuButton(label: "Delete", systemImage: "trash.fill") {
                            deleteItem(index)
                        }
                        
                        menuButton(label: "Duplicate", systemImage: "doc.on.doc.fill") {
                            duplicateItem(index)
                        }
                        
                        menuButton(label: "Print", systemImage: "printer.fill") {
                            print(index)
                        }
                    }
            }
        }
    }
    
    @ViewBuilder
    private func menuButton(
        label: String,
        systemImage: String,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            Label(label, systemImage: systemImage)
        }
    }
    
    private func deleteItem(_ item: String) {
        withAnimation {
            weaponList.removeAll(where: { $0 == item })
        }
    }
    
    private func duplicateItem(_ item: String) {
        withAnimation {
            weaponList.append(item)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


