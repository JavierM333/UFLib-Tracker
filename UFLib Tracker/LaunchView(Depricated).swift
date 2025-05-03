//
//  LaunchView.swift
//  UFLib Tracker
//
//  Created by Javieralejandro Martinez on 4/27/25.
//

import SwiftUI

struct LaunchView: View {
    @State private var fadeIn = false
    @State private var navigate = false

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Image("GatorLogo")
                    .resizable()
                    .frame(width: geometry.size.width * 0.547, height: geometry.size.height * 0.168)
                    .aspectRatio(contentMode: .fit)
                Text("UFLib Tracker")
                    .font(.custom("Anybody", size: 36).weight(.bold))
                Spacer()
                Spacer()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .opacity(fadeIn ? 1 : 0)
            .onAppear {
                withAnimation(.easeIn(duration: 1.5)) {
                    fadeIn = true
                }
            }
        }
    }
}

#Preview {
    LaunchView()
}
