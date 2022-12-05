//
//  Lab4App.swift
//  Lab4
//
//  Created by Vika Granadzer on 03.12.2022.
//

import SwiftUI

@main
struct Lab4App: App {
    var listPreview = ListV()
    var helperPreview = Helper()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView(list: listPreview, helper: helperPreview)
            }
        }
    }
}
