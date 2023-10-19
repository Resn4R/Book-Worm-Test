//
//  ContentView.swift
//  BookWorm
//
//  Created by Vito Borghi on 19/10/2023.
//
import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>

    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "Unknown")
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}


