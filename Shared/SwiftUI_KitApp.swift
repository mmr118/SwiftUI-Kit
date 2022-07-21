//
//  SwiftUI_KitApp.swift
//  SwiftUI Kit
//
//  Created by Jordan Singer on 7/10/20.
//

import SwiftUI

@main
struct SwiftUI_KitApp: App {

    @Environment(\.currentOSKind) var currentOS

    var body: some Scene {

        WindowGroup {

            ContentView()
                .applyTo(os: .macOS) { content in
                    content
                        .frame(minWidth: 100, idealWidth: 300, maxWidth: .infinity, minHeight: 100, idealHeight: 200, maxHeight: .infinity)
                }

        }

    }

}
