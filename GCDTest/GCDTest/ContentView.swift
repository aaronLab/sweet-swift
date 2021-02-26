//
//  ContentView.swift
//  GCDTest
//
//  Created by Aaron Lee on 2021/02/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                
                DispatchQueue.main.async {
                    forLoop("main async 1")
                }
                
                DispatchQueue.main.async {
                    forLoop("main async 2")
                }
                
                DispatchQueue.global().async {
                    forLoop("global async 1")
                }

                DispatchQueue.global().async {
                    forLoop("global async 2")
                }
                
                let customQ1 = DispatchQueue(label: "custom1")
                let customQ2 = DispatchQueue(label: "custom2")
                
                customQ1.async {
                    forLoop("custom 1 async 1")
                }
                
                customQ2.async {
                    forLoop("custom 2 async 1")
                }
                
                customQ1.async {
                    forLoop("custom 1 async 2")
                }
                
                customQ2.async {
                    forLoop("custom 2 async 2")
                }
                
                DispatchQueue.global(qos: .userInteractive).async {
                  forLoop("userInteractive")
                }
                
                DispatchQueue.global(qos: .userInitiated).async {
                  forLoop("userInitiated")
                }
                
                DispatchQueue.global(qos: .utility).async {
                  forLoop("utility")
                }
                
                DispatchQueue.global(qos: .background).async {
                  forLoop("background")
                }
                
                DispatchQueue.global(qos: .userInteractive).async {
                    forLoop("Pre work")
                    
                    DispatchQueue.main.async {
                        forLoop("Change UI")
                    }
                }
                
                let myQueue = DispatchQueue(label: "myQueue")
                
                myQueue.async {
                    forLoop("myQueue1")
                }
                
                myQueue.async {
                    forLoop("myQueue2")
                }
                
                myQueue.async {
                    forLoop("myQueue3")
                }
                
            }
    }
    
    private func forLoop(_ task: String) {
        print(task)
        for i in 0...10 {
            print("\(task) \(i) \(Thread.isMainThread)")
        }
        print("=====end \(task)=====")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
