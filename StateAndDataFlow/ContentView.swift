//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.01.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            ButtonView(timer: timer)
            Spacer()
            Button(action: deleteUser) {
                Text("LogOut")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .frame(width: 200, height: 60)
            .background(Color.blue)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 4)
            )
            Spacer()
        }
    }
    private func deleteUser() {
        userManager.name = ""
        userManager.isRegister.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button(action: timer.startTimer) {
            Text(timer.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}
