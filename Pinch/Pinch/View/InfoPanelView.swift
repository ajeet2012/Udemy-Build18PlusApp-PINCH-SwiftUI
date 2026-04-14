//
//  InfoPanelView.swift
//  Pinch
//
//  Created by Ajeet Sharma on 11/04/26.
//

import SwiftUI

struct InfoPanelView: View {
    var scale: CGFloat
    var offset: CGSize
    
    @State private var isInfoPanelVisibleToggle: Bool = false
    
    var body: some View {
        HStack {
            // MARK: -  HOT SPOT
            
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
                .onLongPressGesture(minimumDuration: 1) {
                    withAnimation(.easeOut) {
                        isInfoPanelVisibleToggle.toggle()
                    }
                }
            
            Spacer()
            
            //MARK: -  INFO PANEL
            
            HStack(spacing: 1) {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                
                Spacer()
            }
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .frame(maxWidth: 420)
            .opacity(isInfoPanelVisibleToggle ? 1 : 0)
            
            Spacer()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    InfoPanelView(scale: 1, offset: .zero)
        .preferredColorScheme(.dark)
        .padding()
}
