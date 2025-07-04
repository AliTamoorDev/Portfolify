//
//  AddInfoView.swift
//  Portfolify
//
//  Created by Ali Tamoor on 23/03/2024.
//

import SwiftUI

struct AddCategoryInfoView: View {
    
    @StateObject var accountVM = AddInfoViewModel()
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
//        ScrollView {
            VStack {
                LazyVGrid(columns: columns, alignment: .center, spacing: 20, content: {
                    ForEach(Categories.allCases, id: \.self) { item in
                        NavigationLink {
                            CategoryDetailsListView(infoItem: accountVM.getDataForCategory(item))
                                .environmentObject(accountVM)
                            
                        } label: {
                            Text("\(item.rawValue)")
                                .frame(width: UIScreen.main.bounds.size.width/2.3 , height: 160)
                                .background {
                                    Color.primaryBrand
                                }
                                .font(.title3)
                                .foregroundColor(.white)
                                .fontWeight(.medium)
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(.white), lineWidth: 1)
                                )
                        }
                    }
                })
                .frame(maxHeight: .infinity)
                .padding(.horizontal, 15)
                .task {
                    for item in Categories.allCases {
                        accountVM.setTitle(item)
                    }
                }
                .onAppear {
                    accountVM.loadData()
                }
            }
            .backgroundGradient()
            .navigationTitle("Add Categories Data")
            .navigationBarTitleDisplayMode(.inline)

//        }
    }
}

#Preview {
    AddCategoryInfoView()
}
