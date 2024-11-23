import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        if let user = authViewModel.currentUser{
                List{
                    Section{
                        HStack (spacing: 16){
                            Text(user.initials)
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                                .font(.title)
                                .frame(width: 70, height: 70)
                                .background(Color(.lightGray))
                                .clipShape(Circle())
                            
                            
                            VStack (alignment: .leading, spacing: 4){
                                Text(user.fullName)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                
                                Text(user.email)
                                    .font(.footnote)
                            }
                        }
                    }
                    
                    
                    Section("Accounts"){
                        Button{
                            authViewModel.signOut()
                            
                        } label: {
                            Label{
                                Text("Sign Out")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.black)
                                
                            } icon: {
                                Image(systemName: "arrow.left.circle.fill")
                                    .foregroundStyle(.red)
                            }
                            
                        }
                        
                        Button{
                            Task{
                                await authViewModel.deleteAccount()
                            }
                        } label: {
                            Label{
                                Text("Delete Account")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.black)
                                
                            } icon: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundStyle(.red)
                            }
                            
                        }
                    }
                }
        }
        //no current user found
        else{
            ProgressView("Please wait...")
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}
