
import SwiftUI

struct ProfileCard: View {
    
    var name: String
    var cargo: String
    var empresa: String

    
    var body: some View {
        
        VStack (spacing: 16){
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(.blue)

            Text(name)
                .font(.title)
                .bold()

            Text("\(cargo) en \(empresa)")
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(24)
        .shadow(radius: 8)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ProfileCard(name: "Luis Guillermo", cargo: "Docente", empresa: "Universidad XYZ")
}
