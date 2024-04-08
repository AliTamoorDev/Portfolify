//
//  CategoryDetailsListView.swift
//  Portfolify
//
//  Created by Ali Tamoor on 26/03/2024.
//

import SwiftUI

struct CategoryDetailsListView: View {
    
    @State var isPresented = false
    @ObservedObject var infoItem: AddCategoryDetailsModel
    @EnvironmentObject var accountVM: AddInfoViewModel
    
    var body: some View {
        ZStack {
            VStack {
                List() {
                    ForEach($infoItem.data, id: \.self) { $currentItem in
                        NavigationLink(destination: EditInfoListView(data: $currentItem, mainCategoryArr: infoItem)) {
                            Text(currentItem.title)
                        }
                        .foregroundColor(.primaryBrandBG)
                    }
                    .onDelete(perform: { indexSet in
                        infoItem.data.remove(atOffsets: indexSet)
                        accountVM.saveData()
                    })
                    .listRowBackground(Color.test)
                }
                .scrollContentBackground(.hidden)
                .backgroundGradient()

            }
            
            if infoItem.data.isEmpty {
                EmptyStateDetails(imageName: "empty-details", message: "No Details Added Yet!")
            }
        }
        .navigationTitle(infoItem.categoryTitle)
        .toolbar {
            Button("Add") {
                isPresented = true
            }
        }
        .sheet(isPresented: $isPresented){
            AddInfoSheetView(item: infoItem)
            .presentationDetents([.medium])
            .presentationDragIndicator(.visible)
        }
    }
}

struct AddInfoSheetView: View {
    
    @StateObject var data = AddInfoSubModel()
    @ObservedObject var item: AddCategoryDetailsModel
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var accountVM: AddInfoViewModel
    
    var body: some View {
        VStack {
            Text(item.categoryTitle)
                .padding()
                .foregroundColor(.white)
                .font(.title)
                .bold()
                .cornerRadius(12)
            
            
            CustomTextField(fieldTxt: $data.title, imageName: "light.ribbon", text: "Enter Title")
            
            CustomTextField(fieldTxt: $data.details, imageName: "info.bubble", text: "Enter \(item.categoryTitle) Details")
            
            Button {
                item.data.append(data)
                presentationMode.wrappedValue.dismiss()
                accountVM.saveData()
            } label: {
                Text("Done")
            }
            .buttonStyle(.borderedProminent)
            .tint(Color.primaryBrand)
        }
        .frame(maxHeight: .infinity)
        .backgroundGradient()
    }
}
//#Preview {
////InfoListView(infoItem: AddInfoModel())
//    AddInfoSheetView(title: "", data: "", mainCategoryArr: AddInfoModel())
//}
