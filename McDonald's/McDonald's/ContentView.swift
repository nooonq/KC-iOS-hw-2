//
//  ContentView.swift
//  McDonald's
//
//  Created by NOUNI on 8/12/22.
//

import SwiftUI


extension Color {
    static let Rred = Color(red: 191 / 255, green: 36 / 255, blue: 36 / 255)
    static let sooRed = Color(red: 217 / 255, green: 26 / 255, blue: 26 / 255)
    static let darkred = Color(red: 115 / 255, green: 6 / 255, blue: 6 / 255)
    static let oryellow = Color(red: 254 / 255, green: 201 / 255, blue: 64 / 255)
    static let Notwhite = Color(red: 246 / 255, green: 255 / 255, blue: 245 / 255)
    static let musterdmoreyellow = Color(red: 242 / 255, green: 183 / 255, blue: 5 / 255)

}



struct ContentView: View {
    
    @State var quantity0: Int = 0
    @State var quantity1: Int = 0
    @State var quantity2: Int = 0
    @State var quantity3: Int = 0
    @State var quantity4: Int = 0
    @State var amount = ""
    @State var total: Double = 0.0
    @State var comment = ""


    
    var body: some View {
        
        ZStack{
            
            Color.Rred
                .ignoresSafeArea()
            
            
            VStack{
                Text("McDonald's")
                    .font(Font.custom("Roboto-Bold", size: 40))
                    .foregroundColor(.oryellow)
                    .padding()
                    
                                
                                    
            Image("mc")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 100)
                
                
                
                HStack{
                                        
                    Text("Your amount:")
                        .font(Font.custom("Roboto-Regular", size: 18))
                        .foregroundColor(.oryellow)
                        
                    
                        Spacer()
                    
                    
                    
                    TextField("0.00 KD", text: $amount)
                        .font(Font.custom("Roboto-Regular", size: 18))
                        .padding()
                        .frame(width: 100, height: 40, alignment: .center)
                        .background(Color.oryellow)
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                                 
                       //stopped at textfield . still havent figured out how to do the pricez and all that
                                        
                                        
                                    
                }.padding(.horizontal)
                    .padding(.top)
                    
                
                
                
            
            Text("MENU")
                .font(Font.custom("Roboto-Light", size: 23))
                .padding(.top)
                .foregroundColor(.oryellow)
                
                
                VStack{
                    HStack{
                        
                        Stepper("Double cheese burger    0.85KD ", value: $quantity0, in: 0...100, step: 1)
                            .font(Font.custom("Roboto-Regular", size: 15))
                        
                        Text("\(quantity0)")
                        
                       
                        
                        
                    }.padding(.horizontal)
                    
                    
                    
                    
                    HStack{
                        
                        Stepper("Chicken nuggets \t     0.75KD", value: $quantity1, in: 0...100, step: 1)
                            .font(Font.custom("Roboto-Regular", size: 15))
                        
                        Text("\(quantity1)")
                        
                       
                        
                        
                    }.padding(.horizontal)
                    
                    
                    HStack{
                        
                        Stepper("Coca-cola \t \t \t     0.55KD", value: $quantity2, in: 0...100, step: 1)
                            .font(Font.custom("Roboto-Regular", size: 15))
                        
                        Text("\(quantity2)")
                        
                       
                        
                        
                    }.padding(.horizontal)
                    
                    HStack{
                                                
            Stepper("Fries \t \t \t \t     0.80KD", value: $quantity3, in: 0...100, step: 1)
                            .font(Font.custom("Roboto-Regular", size: 15))
                                                
                Text("\(quantity3)")
                                                
                                               
                                                
                                                
                    }.padding(.horizontal)

                    HStack{
                        
                        Stepper("BBQ \t \t \t \t     0.05KD", value: $quantity4, in: 0...100, step: 1)
                            .font(Font.custom("Roboto-Regular", size: 15))
                        
                        Text("\(quantity4)")
                        
                       
                        
                        
                    }.padding(.horizontal)
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }.padding(.top)
                    .padding(.bottom)
                    .background(Color.oryellow)
                    .cornerRadius(10)
                    .padding(5)
        
                VStack{
                
                
                    
                    
                    Button {
                        total = totalCalc(q0: Double(quantity0) ?? 0, q1: Double(quantity1) ?? 0, q2: Double(quantity2) ?? 0, q3: Double(quantity3) ?? 0, q4: Double(quantity4) ?? 0)
                        
                        if total <= (Double(amount) ?? 0) && (Double(amount) ?? 0) > 0 {
                            //لم احط ٥ و التوتال ٥ مايضبط لازم احط ٥.٠ عشان يضط
                            comment = "Thank you:)"
                            
                        }
                        
                        else if total >= (Double(amount) ?? 0) && (Double(amount) ?? 0) > 0 {
                            
                            comment = "You don't have enough money:("
                            
                        }
                    
                        
                        
                        else {
                            
                            comment = "Enter your amount"
                            
                        }
                        
                        
                        
                        
                    } label: {
                        
                        
                        Text("Calculate the total")
                            .font(Font.custom("Roboto-Regular", size: 18))
                            .frame(width: 180, height: 50, alignment: .center)
                            .foregroundColor(.black)
                            .background(Color.oryellow)
                            .cornerRadius(10)
                            .padding()
                        
                   
                    
                    }

                    
                    
                    Text("Your total is: \t \(total, specifier: "%.2f")")
                        .font(Font.custom("Roboto-Regular", size: 20))
                        .foregroundColor(.oryellow)
                        .padding()
                        
                    
                    
                    Text(comment)
                        .font(Font.custom("Roboto-Regular", size: 24))
                        .padding(.bottom)
                        .foregroundColor(.oryellow)
                
                    
                    
                    
                    
                }
            }
        }
        
        
        
    }
    func totalCalc(q0: Double, q1: Double, q2: Double, q3: Double, q4: Double ) -> Double{
        
        return (q0*0.850) + (q1*0.750) + (q2*0.550) + (q3*0.800) + (q4*0.050)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
