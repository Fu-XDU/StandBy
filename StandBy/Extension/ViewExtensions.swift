//
//  ViewExtensions.swift
//  StandBy
//
//  Created by 付铭 on 2024/7/22.
//

import SwiftUI

extension View {
    func prefersPersistentSystemOverlaysHidden() -> some View {
        if #available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *) {
            return self.persistentSystemOverlays(.hidden)
        } else {
            // TODO: 
            return self
        }
    }
    
    func prefersContentTransition() -> some View {
        if #available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *) {
            return self.contentTransition(.numericText(countsDown: true))
        } else {
            // TODO:
            return self
        }
    }
    
    func prefersForegroundColor(_ color: Color) -> some View {
        if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) {
            return self.foregroundStyle(color)
        } else {
            return self.foregroundColor(color)
        }
    }
}
