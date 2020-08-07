//
//  FixedAspectRatioShape.swift
//  SetGame
//
//  Created by Roland Schmitz on 07.08.20.
//

import SwiftUI

public struct FixedAspectRatioShape: Shape {
    let pathFactory: (CGRect) -> Path
    let aspectRatio: CGFloat?
    
    public init<SomeShape: Shape>(_ shape: SomeShape, aspectRatio: CGFloat?) {
        self.pathFactory = shape.path(in:)
        self.aspectRatio = aspectRatio
    }
    
    public func path(in rect: CGRect) -> Path {
        guard let aspectRatio = aspectRatio else { return pathFactory(rect) }
        let rectAspectRatio = rect.width / rect.height
        var newRect = rect
        if rectAspectRatio > aspectRatio {
            newRect.size.width = rect.height * aspectRatio
            newRect.origin.x += (rect.width - newRect.width) / 2
        } else {
            newRect.size.height = rect.width / aspectRatio
            newRect.origin.y += (rect.height - newRect.height) / 2
        }
        
        return pathFactory(newRect)
    }
}

extension Shape {
    func aspectRatio(_ value: CGFloat?) -> some Shape {
        FixedAspectRatioShape(self, aspectRatio: value)
    }
}
