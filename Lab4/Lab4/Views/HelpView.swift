//
//  HelpView.swift
//  Lab4
//
//  Created by Vika Granadzer on 03.12.2022.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        VStack{
            VStack{
                Text("Інструкція до використання")
                    .font(.system(size: 30, weight: .black, design: .serif))
            }
            .padding(10)
            .padding([.bottom], 20)
            VStack{
                ScrollView(){
                    Text("Add - додати новий обʼєкт до списку через окрему форму. Задля збереження обʼєкту потрібно натиснути кнопку Save\n\nInfo - отримати інформацію про лабораторну роботу(варіант, виконавець, короткий опис\n\nПошук:\nМожливий за імʼям програми, автором та версією програми\nЗадля сортування треба обрати критерій у picker, що навпроти надпису Sort by, і далі вводити дані, що шукаються, у поле search\nЯкщо критерій пошуку не вибрано, тобто у picker стоїть значення None, у пошуку буде видавати повний список елементів списку\n")
                        .padding([.trailing, .leading],10)
                    Text("Сереалізація:\nЗа неї відповідає кнопка Ser. у верхньому меню. Список серіалізується у файл Lab4Serealizer.txt\n\nДесереалізація:\nЗа неї відповідає кнопка Deser. у верхньому меню. Дані з файлу Lab4Deserealizer.json додаються до списку програми\n\nРедагування списку відбувається у окремій формі, що відкривається натиском на елемент списку. Задля збереження змін треба натиснути кнопку Save\n\nВидалення елементу списку виконується, якщо потягнути за праву частину елементу та нажати кнопку Delete\n\nЗбереження списку відбувається за допомогою кнопки Save у файл List.txt")
                        .padding([.trailing, .leading],10)
                }
            }
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HelpView()
        }
    }
}
