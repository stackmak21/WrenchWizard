//
//  ActivityIndicator.swift
//  WrenchWizard
//
//  Created by Paris Makris on 28/4/24.
//

import SwiftUI

struct ActivityIndicator: View {

    let color: Color
    @Binding var progress: CGFloat
    
    init(
        color: Color = Color.primary,
        progress: Binding<CGFloat> = .constant(.infinity)
    ) {
        self.color = color
        self._progress = progress
    }
    
    var body: some View {
        if progress >= 1.0 {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: color))
        } else {
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
        }
    }
    
}

#Preview {
    ActivityIndicator()
}
