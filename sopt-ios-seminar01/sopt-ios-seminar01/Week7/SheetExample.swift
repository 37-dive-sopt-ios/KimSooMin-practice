//
//  SheetExample.swift
//  sopt-ios-seminar01
//
//  Created by mandoo on 11/29/25.
//

import SwiftUI

struct SheetExample: View {
    @State private var showSheet = false

    var body: some View {
        VStack {
            Text("메인 화면")
                .font(.largeTitle)

            Button("시트 열기") {
                showSheet = true
            }
        }
        .sheet(isPresented: $showSheet) {
            SheetView(isPresented: $showSheet)
        }
    }
}

struct SheetView: View {
    @Binding var isPresented: Bool

    var body: some View {
        VStack(spacing: 20) {
            Text("시트 화면")
                .font(.largeTitle)

            Button("닫기") {
                isPresented = false
            }
        }
    }
}

#Preview {
    SheetExample()
}
