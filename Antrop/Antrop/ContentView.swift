//
//  ContentView.swift
//  Antrop
//
//  Created by Alex Diker
// Malicous File Remover
// Malicious Group Remover

var AppName = "Antrop \n"
var version = 0.1

import SwiftUI

struct ContentView: View {
    @State private var outputText: String = ""
    var body: some View {
        

        Text("Antrop Scripts")
        
        Button("Alert Remote Login") {
            runScript()
        }
        
        Button("Checksum") {
            runScript2()
        }
        
        
        .padding()
    }

    func runScript() {
        // Locate the script in the app bundle
        guard let scriptURL = Bundle.main.url(forResource: "alert_remote_login", withExtension: "sh") else {
            print("Script not found!")
            return
        }

        // Initialize the process to run the script
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/bin/bash")
        process.arguments = [scriptURL.path]

        // Set up a pipe to capture the output
        let pipe = Pipe()
        process.standardOutput = pipe
        process.standardError = pipe

        do {
            try process.run()
            process.waitUntilExit()

            // Read and print the script's output
            let data = pipe.fileHandleForReading.readDataToEndOfFile()
            if let output = String(data: data, encoding: .utf8) {
                print("Script output: \(output)")
            }
        } catch {
            print("Failed to run script: \(error)")
        }
    }
    
    func runScript2() {
        // Locate the script in the app bundle
        guard let scriptURL = Bundle.main.url(forResource: "checksum", withExtension: "sh") else {
            print("Script not found!")
            return
        }

        // Initialize the process to run the script
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/bin/bash")
        process.arguments = [scriptURL.path]

        // Set up a pipe to capture the output
        let pipe = Pipe()
        process.standardOutput = pipe
        process.standardError = pipe

        do {
            try process.run()
            process.waitUntilExit()

            // Read and print the script's output
            let data = pipe.fileHandleForReading.readDataToEndOfFile()
            if let output = String(data: data, encoding: .utf8) {

                print("Script output: \(output)")

            }
        } catch {
            print("Failed to run script: \(error)")
        }
        
    }
    
    
    
}


#Preview {
    ContentView()
}
 
