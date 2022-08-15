//
//  ContentView.swift
//  McDonald's
//
//  Created by NOUNI on 8/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var quantity0: Int = 0
    @State private var quantity1: Int = 0
    @State private var quantity2: Int = 0
    @State private var quantity3: Int = 0
    @State private var quantity4: Int = 0
    @State var amount = ""
    @State var total = ""
    @State var comment = ""


    
    var body: some View {
        
        ZStack{
            VStack{
                Text("McDonald's")
                    .font(Font.custom("Roboto-Bold", size: 40))
                    
                                
                                    
            Image("mc")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 100)
            
            Text("MENU")
                .font(Font.custom("Roboto-Light", size: 23))
                .padding(.top,20)
                
                
                VStack{
                    HStack{
                        
                        Stepper("Double cheese burger", value: $quantity0, in: 0...100, step: 1)
                        
                        Text("\(quantity0)")
                        
                       
                        
                        
                    }.padding(.horizontal)
                    
                    
                    
                    
                    HStack{
                        
                        Stepper("Chicken nuggets", value: $quantity2, in: 0...100, step: 1)
                        
                        Text("\(quantity2)")
                        
                       
                        
                        
                    }.padding(.horizontal)
                    
                    
                    HStack{
                        
                        Stepper("Coca-cola", value: $quantity3, in: 0...100, step: 1)
                        
                        Text("\(quantity3)")
                        
                       
                        
                        
                    }.padding(.horizontal)
                    
                    HStack{
                                                
            Stepper("Fries", value: $quantity1, in: 0...100, step: 1)
                                                
                Text("\(quantity1)")
                                                
                                               
                                                
                                                
                    }.padding(.horizontal)

                    HStack{
                        
                        Stepper("BBQ", value: $quantity4, in: 0...100, step: 1)
                        
                        Text("\(quantity4)")
                        
                       
                        
                        
                    }.padding(.horizontal)
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }.padding(.top)
                    .padding(.bottom)
                    .background(Color.red.opacity(0.1))
                    .cornerRadius(5)
        
                VStack{
                
                HStack{
                                        
                    Text("Your amount:")
                        
                    
                        Spacer()
                    
                    
                    
                    TextField("0.00 KD", text: $amount)
                        .padding()
                        .frame(width: 100, height: 40, alignment: .center)
                        .background(.red.opacity(0.2))
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                                 
                       //stopped at textfield . still havent figured out how to do the pricez and all that
                                        
                                        
                                    
                }.padding()
                    
                    
                   //the if is a messssssssss and the vars are also a messsssssssssss:''''(
                    Button {
                        total = String(totalCalc(q0: Double(quantity0) ?? 0, q1: Double(quantity1) ?? 0, q2: Double(quantity2) ?? 0, q3: Double(quantity3) ?? 0, q4: Double(quantity4) ?? 0))
                        
                        if total <= amount {
                            //لم احط ٥ و التوتال ٥ مايضبط لازم احط ٥.٠ عشان يضبط
                            comment = "Thank you:)"
                            
                        }
                        
                        else if total >= amount || amount >= "0" {
                            
                            comment = "You don't have enough money:("
                            
                        }
                        
                        else {
                            
                            comment = "Enter your amount"
                            
                        }
                        
                        
                        
                        
                    } label: {
                        
                        
                        Text("Calculate the total")
                            .frame(width: 180, height: 50, alignment: .center)
                            .foregroundColor(.black)
                            .background(.red.opacity(0.6))
                            .cornerRadius(10)
                        
                   
                    
                    }

                    
                    
                    Text("Your total is: \t \(total)")
                    
                    
                    Text(comment)
                        .padding()
                
                    
                    
                    
                    
                }
            }
        }
        
        
        
    }
    func totalCalc(q0: Double, q1: Double, q2: Double, q3: Double, q4: Double ) -> Double{
        
        return q0 + q1 + q2 + q3 + q4
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
