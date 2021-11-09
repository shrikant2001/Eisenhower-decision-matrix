//
//  ContentView.swift
//  E-matrix
//
//  Created by shrikant kamalakar jadhav on 02/11/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.title, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        
        let green = greenf()
        let blue = bluef()
        let yellow = yellowf()
        let red = redf()
        
        ZStack{
            Color.black
            
            
            VStack{
                HStack{
                    List(green,id : \.self){item in
                        Text(item.title ?? "no task")
                    }
                    List(blue,id : \.self){item in
                        Text(item.title ?? "no task")
                    }
                }
                HStack{
                    List(yellow,id : \.self){item in
                        Text(item.title ?? "no task")
                    }
                    List(red,id : \.self){item in
                        Text(item.title ?? "no task")
                    }
                }
            }
            
            
        }
    }
    
    func greenf() -> [Item]{
        let greenarr = items
        let greenarr2 = greenarr.filter{
            $0.type == 1
        }
        return greenarr2
    }
    func bluef() -> [Item]{
        let greenarr = items
        let greenarr2 = greenarr.filter{
            $0.type == 2
        }
        return greenarr2
    }
    func yellowf() -> [Item]{
        let greenarr = items
        let greenarr2 = greenarr.filter{
            $0.type == 3
        }
        return greenarr2
    }
    func redf() -> [Item]{
        let greenarr = items
        let greenarr2 = greenarr.filter{
            $0.type == 4
        }
        return greenarr2
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.title = "task"

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
