import SwiftUI

struct PersonDetailView: View {
    let person: Person

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Name: \(person.firstName) \(person.surname)")
                .font(.title)
                .fontWeight(.bold)

            Text("Gender: \(person.gender)")
            Text("Age: \(person.age)")

            VStack(alignment: .leading) {
                Text("Address:")
                    .font(.headline)
                Text("\(person.address.streetAddress)")
                Text("\(person.address.city), \(person.address.state) \(person.address.postalCode)")
            }

            VStack(alignment: .leading) {
                Text("Phone Numbers:")
                    .font(.headline)
                ForEach(person.phoneNumbers, id: \.number) { phone in
                    Text("\(phone.type.capitalized): \(phone.number)")
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Details", displayMode: .inline)
    }
}
