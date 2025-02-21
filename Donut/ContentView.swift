//
//  ContentView.swift
//  Donut
//
//  Created by Alex Grad <alex@grad.dev> (https://grad.dev) on 21.02.2025.
//

import SwiftUI

struct ContentView: View {
  private let date = Date()

  var body: some View {
    TimelineView(.animation) { _ in
      Rectangle()
        .fill(.black)
        .colorEffect(
          ShaderLibrary.default.don(
            .boundingRect,
            .float(date.timeIntervalSinceNow)
          )
        )
        .aspectRatio(1, contentMode: .fit)
    }
    .frame(width: 400, height: 400)
    .padding(128)
    .background(.black)
  }
}

#Preview {
  ContentView()
}
