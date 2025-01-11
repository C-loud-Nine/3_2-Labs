//
//  ContentView.swift
//  JSONParsing
//
//  Created by kaniz fatema on 27/11/24.
//



//import SwiftUI
//
//struct ContentView: View {
//    private var people: [Person] = Person.allPeople
//    
//    var body: some View {
//        
//        NavigationView {
//            List{
//                ForEach(people, id: \.firstName) { person in Text ("\(person.firstName) ")}
//                
//            }
//        }
//    }
//}

import SwiftUI

struct ContentView: View {
    private var people: [Person] = Person.allPeople
    
    var body: some View {
        
        NavigationView {
            List {
                
                ForEach(people, id: \.firstName) { person in
                    
                    NavigationLink(
                        destination: PersonDetailView(person: person)
                    ) {
                        
                        Text("\(person.firstName)")
                    }
                }
            }
            
            .navigationTitle("List")
        }
    }
}

// view
struct PersonDetailView: View {
    var person: Person
    
    var body: some View {
       
        ScrollView {
            VStack(spacing: 20) {
            
                Text("Name: \(person.firstName) \(person.surname)")
                    
                    
                
                Text("Age: \(person.age)")
                
             
                Text("Gender: \(person.gender)")
                
                
                Text("Address: \(person.address.streetAddress), \(person.address.city), \(person.address.state), \(person.address.postalCode)")
                
                
                ForEach(person.phoneNumbers, id: \.number) { phone in
                    Text("\(phone.type.capitalized): \(phone.number)")
                }
            }
            .padding()
        }
        .navigationTitle("\(person.firstName) Details")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// import SwiftUI
//
// struct ContentView: View {
//     @StateObject private var viewModel = ArticleViewModel() // Initialize ViewModel
//
//     var body: some View {
//         NavigationView {
//             VStack {
//                 if viewModel.isLoading {
//                     ProgressView("Loading Articles...")
//                 } else if let errorMessage = viewModel.errorMessage {
//                     Text("Error: \(errorMessage)")
//                         .foregroundColor(.red)
//                         .padding()
//                 } else {
//                     List(viewModel.articles) { article in
//                         NavigationLink(destination: ArticleDetailView(article: article)) {
//                             ArticleRowView(article: article)
//                         }
//                     }
//                     .listStyle(PlainListStyle())
//                 }
//             }
//             .navigationTitle("Tesla News")
//             .onAppear {
//                 viewModel.fetchArticles()
//             }
//         }
//     }
// }
//
// struct ArticleRowView: View {
//     let article: Article
//
//     var body: some View {
//         HStack {
//             if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
//                 AsyncImage(url: url) { image in
//                     image.resizable()
//                         .aspectRatio(contentMode: .fill)
//                         .frame(width: 60, height: 60)
//                         .cornerRadius(8)
//                 } placeholder: {
//                     ProgressView()
//                         .frame(width: 60, height: 60)
//                 }
//             } else {
//                 Rectangle()
//                     .fill(Color.gray)
//                     .frame(width: 60, height: 60)
//                     .cornerRadius(8)
//             }
//
//             VStack(alignment: .leading) {
//                 Text(article.title)
//                     .font(.headline)
//                     .lineLimit(2)
//
//                 Text(article.source.name)
//                     .font(.subheadline)
//                     .foregroundColor(.gray)
//             }
//         }
//     }
// }
//
// struct ArticleDetailView: View {
//     let article: Article
//
//     var body: some View {
//         ScrollView {
//             VStack(alignment: .leading) {
//                 if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
//                     AsyncImage(url: url) { image in
//                         image.resizable()
//                             .aspectRatio(contentMode: .fit)
//                             .frame(maxWidth: .infinity)
//                     } placeholder: {
//                         ProgressView()
//                             .frame(maxWidth: .infinity, maxHeight: 200)
//                     }
//                 }
//
//                 Text(article.title)
//                     .font(.title)
//                     .padding(.top)
//
//                 Text("By \(article.author ?? "Unknown Author")")
//                     .font(.subheadline)
//                     .foregroundColor(.gray)
//
//                 Text(article.description ?? "No description available.")
//                     .padding(.top)
//
//                 if let url = URL(string: article.url) {
//                     Link("Read more", destination: url)
//                         .padding(.top)
//                         .font(.headline)
//                         .foregroundColor(.blue)
//                 }
//             }
//             .padding()
//         }
//         .navigationTitle(article.source.name)
//     }
// }
//
//
//#Preview{ContentView()}
