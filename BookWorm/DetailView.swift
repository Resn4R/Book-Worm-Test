//
//  DetailView.swift
//  BookWorm
//
//  Created by Vito Borghi on 23/10/2023.
//

import SwiftUI

struct DetailView: View {
    @Environment (\.dismiss) var dismissView
    let book: Book
    @Environment(\.managedObjectContext) var moc
    
    @State private var showDeleteAlert = false
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "Fantasy")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author ?? "Unknown Author")
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review ?? "No review")
                .padding()
            
            RatingView(rating: .constant((Int(book.rating))))
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showDeleteAlert.toggle()
                } label: {
                    Image(systemName: "trash")
                }
            }
        }
        .alert("Are you sure?", isPresented: $showDeleteAlert) {
            Button("Delete", role: .destructive) {
                moc.delete(book)
                try? moc.save()
                
                dismissView()
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Do you want to delete this book? This action cannot be undone.")
        }
        
    }
}


//#Preview {
//    DetailView()
//}
