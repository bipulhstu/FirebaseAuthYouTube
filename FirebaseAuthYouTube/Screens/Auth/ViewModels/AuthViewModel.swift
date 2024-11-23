import Foundation
import FirebaseAuth
import FirebaseFirestore

@MainActor
final class AuthViewModel: ObservableObject{
    
    @Published var userSession: FirebaseAuth.User? //User from Firebase
    @Published var currentUser: User? //our User
    @Published var isError: Bool = false
    
    private let auth = Auth.auth()
    private let firestore = Firestore.firestore()
    
    init(){
        Task{
            await loadCurrentUser()
        }
    }
    
    func loadCurrentUser() async {
        if let user = auth.currentUser{
            userSession = user
            await fetchUser(by: user.uid)
        }
    }
    
    func login(email: String, password: String) async{
        do{
            let authResult = try await auth.signIn(withEmail: email, password: password)
            userSession = authResult.user
            await fetchUser(by: authResult.user.uid)
            
        } catch{
            isError = true
        }
    }
    
    
    func createUser(email: String, fullName: String, password: String) async {
        do{
            let authResult = try await auth.createUser(withEmail: email,password: password)
            await storeUserInFirestore(uid: authResult.user.uid, email: email, fullName: fullName)
            
        } catch {
            isError = true
        }
    }
    
    
    func storeUserInFirestore(uid: String, email: String, fullName: String) async {
        let user = User(uid: uid, email: email, fullName: fullName)
        do{
            try firestore.collection("users").document(uid).setData(from: user)
        }catch {
            isError = true
        }
    }
    
    func fetchUser(by uid: String) async{
        do{
            let userData = try await firestore.collection("users").document(uid).getDocument()
            currentUser =  try userData.data(as: User.self)
            
        }catch{
            isError = true
        }
    }
    
    func signOut(){
        do{
            userSession = nil
            currentUser = nil
            try auth.signOut()
        } catch{
            isError = true
        }
    }
    
    func deleteAccount() async{
        do{
            userSession = nil
            currentUser = nil
            deleteUserFromFirestore(by: auth.currentUser?.uid ?? "") //delete user data from firestore
           try await auth.currentUser?.delete() //delete user auth
        } catch{
            isError = true
        }
    }
    
    private func deleteUserFromFirestore(by uid: String){
        firestore.collection("users").document(uid).delete()
        
    }
    
}
