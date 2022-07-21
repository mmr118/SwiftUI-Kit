//
//  PreviewHelpers.swift
//  Receipts
//
//  Created by Monica Rondón on 4/13/22.
//

import SwiftUI

public extension View {
    
    /// Show the time the preview was last updated in the device name
    @inlinable func previewUpdateDate(_ title: String? = nil) -> some View {
        var displayName = Date().formatted(date: .omitted, time: .standard)
        if let title = title {
            displayName += " \(title)"
        }
        return previewDisplayName(displayName)
    }

}
    
 /*
    /// `PreviewProvider` utility bottom toolbar-keyboard for text input in Xcode previews.
    /// - Parameters:
    ///   - text: The text to display and edit in the search field.
    ///   - placement: The preferred placement of the search field within the containing view hierarchy.
    ///   - prompt: A Text representing the prompt of the search field which provides users with guidance on what to search for.
    ///   - isPreview: A boolean indicating if the view is being rendered for Xcode preview; default value is `false`
    /// - Returns: A `self` adding search funtionality and a utility bottom toolbar for search input.
    /// - Note: The `View` should conforme to `SearchableTextPreview` and pass `isPreview`
    public func searchable(text: Binding<String>, placement: SearchFieldPlacement = .automatic, prompt: Text? = nil, isPreview: Bool) -> some View {
        self
            .searchable(text: text, placement: placement, prompt: prompt)
            .if(isPreview) { view in
                view
                    .toolbar {
                        previewSearchBottomBar(text: text)
                    }
                
            }
        
    }
    
    // MARK: Internal
    /// Creates toolbar content used for text input in a search bar.
    /// - Parameter text: The search field text.
    /// - Returns: A toolbar that includes all lowercase letters, a space button & a delete button.
    @ToolbarContentBuilder internal func previewSearchBottomBar(text: Binding<String>) -> some ToolbarContent {
        
        lettersGroup(text: text)
        actionMenu(text: text)
        
    }
    
    @ToolbarContentBuilder private func lettersGroup(text: Binding<String>) -> some ToolbarContent {
        
        
        ToolbarItemGroup(placement: .bottomBar) {
            
            // Letter buttons
            ForEach(String.lettersArray, id: \.self) { letter in
                
                Text(letter)
                    .border(Color.blue, width: 1.0)
                    .onTapGesture {
                        text.wrappedValue += letter
                    }
                
                Spacer()
                
            }
            
        }
        
    }
    
    @ToolbarContentBuilder private func actionMenu(text: Binding<String>) -> some ToolbarContent {
        
        ToolbarItem(placement: .bottomBar) {
            
            Menu {
                
                // Space button
                Button(.minus_square_fill) {
                    text.wrappedValue += .space
                }
                
                // Delete button
                Button(.delete_left_fill) {
                    if !text.wrappedValue.isEmpty {
                        text.wrappedValue.removeLast()
                    }
                }
                
                
                Divider()
                
                
                // Replace with random word
                Button(.shuffle) {
                    text.wrappedValue = .randomWord()
                }
                
                // Add random word
                Button(.plus) {
                    text.wrappedValue += " \(String.randomWord())"
                }
                
                Divider()
                
                // digits
                ForEach(String.digitsArray, id: \.self) { digitStr in
                    
                    Button(digitStr) {
                        text.wrappedValue += digitStr
                    }
                    
                }

                
                
            } label: {
                Label("", symbol: .ellipsis_circle)
            }
            
        }
        
    }
    
}
*/
