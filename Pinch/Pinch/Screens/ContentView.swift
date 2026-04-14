//
//  ContentView.swift
//  Pinch
//
//  Created by Ajeet Sharma on 11/04/26.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    
    //MARK: - Function
    
    func resetImageState() {
        return withAnimation(.spring()) {
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    //MARK: - Content
    
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                Color.clear
                //MARK: - Page Image
                
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .scaleEffect(imageScale)
                //MARK: - 1. TAP GESTURE
                    .onTapGesture(count: 2) {
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 5
                            }
                        }
                        else {
                            resetImageState()
                        }
                    }
                //MARK: - 1. DRAGE GESTURE
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                print(value.translation)
                                withAnimation(.linear(duration: 1)){
                                    imageOffset = value.translation
                                }
                            }
                            .onEnded { _ in
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                                
                            }
                    )
                
                
                
            }// : ZSTACK
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            }
            .overlay (
                InfoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30)
                ,
                alignment: .top
            )
            .padding()
            
        }// : navigation
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
}
