//
//  InfoView.swift
//  Lab4
//
//  Created by Vika Granadzer on 05.12.2022.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack{
            VStack{
                Text("Інформація")
                    .font(.system(size: 30, weight: .black, design: .serif))
            }
            .padding(10)
            .padding([.bottom], 20)
            VStack{
                ScrollView(){
                    Text("2022 рік\n\nКиївський національний університет імені Тараса Шевченка\n\nЛабораторну роботу виконала Гранадзер Вікторія, 2 курс, група К-28\n\nВаріант 9\n\nСписок містить таку інформацію: Назва програмного засобу, анотація, вид, версія, автор, умови використання, де записано дистрибутив\nСписок візуалізовано, можливе додання, видалення, редагування елементів списку, також сереалізація/десереалізація")
                        .padding([.trailing, .leading],10)
                }
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
