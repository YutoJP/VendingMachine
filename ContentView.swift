//
//import SwiftUI
////import PlaygroundSupport
//import Foundation
//import Combine
//
//
//struct User: Identifiable {
//    var id: String
//    var name: String
//}
//
//
//struct ContentView: View {
//    @State var timer: Timer!
//    @State var count = 0
//    @State var disaster = false
//    @State var drinkBought: [String] = []
//    @State var drinkBought2: [String] = [""]
//    @State var smallList: [Any] = [];
//    @State var largeList: [Any] = [];
//    @State var rotation: [Double] = [0]
//    @State var stocks = [4, 21, 2, 1, 2, 3, 0, 2, 4, 3]
//    @State private var myMoney = 0.0
//    var rot = Double(Int.random(in: -80..<80))
//    var prices = [1, 1, 1, 1, 1.3, 1.1, 1, 1.2, 1, 1.3]
//
//
//    var error = "Can't buy"
//    func start() {
//        self.timer?.invalidate()
//        self.count = 0
//        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
//            _ in
//            self.count += 1
//            print(self.count)
//        }
//    }
//
//    func order(myMoney: Double, price: Double, drinkName: String, index: Int) -> Double {
//
//
//        print(drinkBought)
//        var moneyLeft = 0.0
//
//        if (myMoney >= price) {
//            print("next")
//
//            let b = Int.random(in: 0 ... 5)
//            if (b == 1) {
//                self.disaster = true
//            }
//
//
//            if (self.disaster) {
//                start()
//                self.rotation = [10, 30, 20, -20, 10, 40, 30, 10, 50, 20]
//                self.drinkBought = ["Cola", "Fanta", "Water", "Apple", "Tea", "Water", "Orange", "Cola", "Fanta",]
//                self.drinkBought2 = ["a", "Cola", "Fanta", "Water", "Apple", "Tea", "Water", "Orange", "Cola", "Fanta",]
//            }
//            self.stocks[index] = self.stocks[index] - 1
//
//            moneyLeft = myMoney - price
//            var average = 0
//            if (drinkBought.count > 1) {
//                average = ((drinkBought.count - 1) / 2) + 1
//
//            } else {
//                average = ((drinkBought.count - 1) / 2)
//
//            }
//            self.rotation.insert(Double(Int.random(in: -50..<50)), at: average)
//
//            self.drinkBought.insert(drinkName, at: average)
//            self.drinkBought2.insert(drinkName, at: average)
//        } else {
//            moneyLeft = myMoney
//        }
//        return moneyLeft
//    }
//
//    fileprivate func extractedFunc(color: Color, nameDrink: String, index: Int, type: Int, typeDrink: Int) -> some View {
//        return VStack {
//            if (type == 0){
//                drinkCan(drinkColor: color)
//
//            } else {
//                  drinkPlastic(capColor: color, drinkColor: color, type: typeDrink)
//            }
//        Text(nameDrink)
//                                  .font(.system(size: 13))
//
//
//
//            if (self.stocks[index] <= 0) {
//                Button(action: {
//                }) {
//                    Text("Sold Out")
//                        .foregroundColor(.white)
//                        .font(.system(size: 8))
//                        .frame(width: 40, height: 12, alignment: .center)
//                        .background(Color.red)
//                        .cornerRadius(5)
//                }
//            } else {
//
//
//
//                if (self.disaster) {
//                    Button(action: {
//                    }) {
//                        Text("Sold Out")
//                            .foregroundColor(.white)
//                            .font(.system(size: 8))
//                            .frame(width: 40, height: 12, alignment: .center)
//                            .background(Color.red)
//                            .cornerRadius(5)
//                    }
//                } else {
//                    Button(action: {
//                        if (self.drinkBought.count < 80) {
//                            print(self.stocks)
//
//                            self.myMoney = self.order(myMoney: self.myMoney, price: self.prices[index], drinkName: nameDrink, index: index)
//
//                        }
//                    }) {
//                        Text("Buy $\(String(format: "%.1f", self.prices[index]))")
//                            .foregroundColor(.black)
//                            .font(.system(size: 8))
//                            .frame(width: 40, height: 12, alignment: .center)
//                            .background(Color(red: 168, green: 232, blue: 100))
//                            .cornerRadius(5)
//                    }
//                }
//            }
//        }
//    }
//
//    fileprivate func eachDrinkWhenBought(num: Int, drinkName: String, color: Color) -> some View {
//        return String(self.drinkBought2[num]) == drinkName ?
//
//            drinkPlastic(capColor: color, drinkColor: color, type: 0)
//
//            :
//
//            drinkPlastic(capColor: Color.red, drinkColor: Color.red, type: 1)
//
//
//
//    }
//
//    fileprivate func drinkPlastic(capColor: Color, drinkColor: Color, type: Int) -> some View {
//        return
//            ZStack (alignment: .bottom){
//           capColor
//                .frame(width:
//                    type == 1 ? 0 :
//                    8, height:
//                    type == 1 ? 0 :
//                    45
//                    , alignment: .topLeading)
//                .cornerRadius(2)
//                .padding(.bottom,
//                         type == 1 ? 0 :
//                         15)
//
//            Ellipse()
//                .fill(Color.white)
//                .frame(width:
//                     type == 1 ? 0 :
//                    24, height:
//                     type == 1 ? 0 :
//                    45)
//                .padding(.bottom,
//                         type == 1 ? 0 :
//                         60)
//                //                                                     .rotationEffect(.degrees(-90))
//                .frame(width:
//                     type == 1 ? 0 :
//                    27, height:
//                     type == 1 ? 0 :
//                    5)
//            drinkColor
//                .frame(width:
//                     type == 1 ? 0 :
//                    24, height:
//                     type == 1 ? 0 :
//                    41, alignment: .topLeading)
//                .cornerRadius(4)
//                .padding(.bottom, 0)
//
//            drinkColor
//                .frame(width:
//                     type == 1 ? 0 :
//                    24, height:
//                     type == 1 ? 0 :
//                    45, alignment: .topLeading)
//                .cornerRadius(7)
//
//
//        }
//    }
//
//    fileprivate func drinkCan(drinkColor: Color) -> some View {
//        return drinkColor
//            .frame(width: 30, height: 55, alignment: .topLeading)
//            .cornerRadius(5)
//    }
//
//    var body: some View {
//
//        return VStack {
//            VStack {
//
//                VStack(alignment: .center, spacing: 10) {
//
//                    HStack(spacing: 24) {
//                        extractedFunc(color: Color.black, nameDrink: "Cola", index: 0, type: 1, typeDrink: 0)
//                        extractedFunc(color: Color.black, nameDrink: "Cola", index: 1, type: 1, typeDrink: 0)
//                        extractedFunc(color: Color.green, nameDrink: "Tea", index: 2, type: 1, typeDrink: 0)
//
//                        extractedFunc(color: Color.orange, nameDrink: "Orange", index: 3, type: 1, typeDrink: 0)
//                        extractedFunc(color: Color.white, nameDrink: "Water", index: 4, type: 1, typeDrink: 0)
//
//                    }
//                        .padding([.top, .leading, .trailing], 4.0)
//                    Divider()
//                    HStack(spacing: 24) {
//                        extractedFunc(color: Color.blue, nameDrink: "Energy", index: 5, type: 1, typeDrink: 0)
//                        extractedFunc(color: Color(red: 248 / 255, green: 102 / 255, blue: 70 / 255)
//                            , nameDrink: "Fanta", index: 6, type: 1, typeDrink: 0)
//                        extractedFunc(color: Color.yellow, nameDrink: "Apple", index: 7, type: 1, typeDrink: 0)
//                        extractedFunc(color: Color.orange, nameDrink: "Orange", index: 8, type: 1, typeDrink: 0)
//                        extractedFunc(color: Color.white, nameDrink: "Water", index: 9, type: 1, typeDrink: 0)
//                    }
//                        .padding([.leading, .bottom, .trailing], 4.0)
//                }
//                    .frame(height: 240.0)
//                    .frame(maxWidth: .infinity)
//                    .background(Color.white.opacity(0.5))
//                    .cornerRadius(6)
//
//                    .padding()
//
//                HStack {
//                    Spacer()
//                    Text("Emergency")
//                        .font(.system(size: 14))
//                        .fontWeight(.bold)
//                        .foregroundColor(
//                            self.count % 2 == 0 ?
//                            Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)
//                                :
//                                Color(red: 255 / 255, green: 95 / 255, blue: 105 / 255)
//                        )
//
//                        .frame(width: 92, height: 18, alignment: .center)
//                        .background(
//                            !self.disaster ? Color(red: 248 / 255, green: 234 / 255, blue: 0 / 255).opacity(0.3)
//                                :
//                                Color(red: 248 / 255, green: 234 / 255, blue: 0 / 255)
//                        )
//                        .cornerRadius(1)
//                }
//                    .padding(.trailing, 21.0)
//
//                Divider()
//                HStack() {
//                    VStack {
//                        Text("        Disaster Rescue Vending Machine")
//                            .font(.custom("Rockwell", size: 25))
//                            .fontWeight(.bold)
//                            .italic()
//                            .padding(.bottom, 15.0)
//                    }
//                        .background(Color.red)
//                        .frame(width: 161.0, height: 144.0)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 16)
//                                .stroke(Color.black, lineWidth: 0.4)
//                        )
////                        .overlay(
////                            RoundedRectangle(cornerRadius: 9)
////                                .padding(.bottom, 17.0)
////                                .fill(Color.black.opacity(0.4))
//////                                .stroke(Color.black, lineWidth: 0.4)
////                        )
//
//
//
//                    Spacer()
//                    VStack(alignment: .trailing) {
//                        HStack {
//                            Text(
//                                self.myMoney <= 0 ? "":
//                                    "$\(String(format: "%.1f", self.myMoney))"
//                            )
//                                .font(.system(size: 10))
//                                .fontWeight(.bold)
//                                .foregroundColor(Color.white)
//                                .padding(.bottom, 5.0)
//
//
//                            Button(action: {
//                                self.myMoney = 0
//
//
//
//                            }) {
//                                Text("Return")
//                                    .foregroundColor(.black)
//                                    .font(.system(size: 10))
//                                    .frame(width: 42, height: 15, alignment: .center)
//                                    .background(Color.yellow.opacity(0.6))
//                                    .cornerRadius(5)
//                                    .padding(.bottom, 6.0)
//                            }
//                        }
//
//
//
//                        VStack {
//                            Text("")
//
//                        } .frame(height: 55)
//                            .frame(maxWidth: 70)
//                            .background(Color.black.opacity(0.6))
//                            .cornerRadius(8)
//                    }
//                }
//                    .padding(EdgeInsets(top: 70, leading: 20, bottom: 0, trailing: 20))
//
//
//                    .frame(maxWidth: .infinity)
//                    .frame(maxHeight: 100)
//
//                Spacer()
//                Group {
//                    HStack() {
//
//
//                        ForEach(0 ... self.drinkBought.count, id: \.self) { num in
//
//                            Group {
//                                if 1 > 0 {
//                                    VStack {
//
//
//                                        ZStack {
//
//   self.eachDrinkWhenBought(num: num, drinkName: "Cola", color: Color.orange)
//
//
//                                            self.eachDrinkWhenBought(num: num, drinkName: "Fanta", color: Color.orange)
//
//                                            self.eachDrinkWhenBought(num: num, drinkName: "Orange", color: Color.orange)
//                                            self.eachDrinkWhenBought(num: num, drinkName: "Water", color: Color.white)
//                                                 self.eachDrinkWhenBought(num: num, drinkName: "Cola", color: Color.black)
//                                            self.eachDrinkWhenBought(num: num, drinkName: "Energy", color: Color.blue)
//                                            self.eachDrinkWhenBought(num: num, drinkName: "Apple", color: Color.yellow)
//                                            self.eachDrinkWhenBought(num: num, drinkName: "Tea", color: Color.green)
//
//                                        }
//                                        .padding(.top, 16.0)
//                                            .frame(height: 30)
//                                            .rotationEffect(.degrees(Double(self.rotation[num])))
//
//
//
//                                    }
//                                } else {
//                                }
//
//
//                            }
//                        }
//
//
//                    } .frame(height: 50)
//                        .frame(width: 320)
//                        .background(Color.black.opacity(0.6))
//                        .cornerRadius(8)
//
//                        .padding()
//
//
//                }
//
//            }.frame(width: 350, height: 550, alignment:
//                    .topLeading)
//                .background(Color.red)
//                .cornerRadius(8)
//
//
//            HStack {
//
//
//                Button(action: {
//                    self.myMoney = self.myMoney + 1.0
//                    print(self.myMoney)
//                }) {
//                    Text("$1.0")
//                }
//                Button(action: {
//                    self.myMoney = self.myMoney + 3.0
//                    print(self.myMoney)
//                }) {
//                    Text("$3.0")
//                }
//                Button(action: {
//                    self.myMoney = self.myMoney + 5.0
//                    print(self.myMoney)
//                }) {
//                    Text("$5.0")
//                }
//            }
//        }
//
//    }
//}
//
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//
//
//    }
//}
//
//
//
//
////
////PlaygroundPage.current.liveView = UIHostingController(rootView: ContentView())

import SwiftUI
//import PlaygroundSupport
import Foundation
import Combine


struct User: Identifiable {
    var id: String
    var name: String
}


struct ContentView: View {
    @State var timer: Timer!
    @State var count = 0
    @State var disaster = false
    @State var drinkBought: [String] = []
    @State var drinkBought2: [String] = [""]
    @State var smallList: [Any] = [];
    @State var largeList: [Any] = [];
    @State var rotation: [Double] = [0]
    @State var stocks = [4, 21, 2, 1, 2, 3, 0, 2, 4, 3]
    @State private var myMoney = 0.0
    var rot = Double(Int.random(in: -30..<30))
    var prices = [1, 1, 1, 1, 1.3, 1.1, 1, 1.2, 1, 1.3]
    var colaColor = Color(red: 54 / 255, green: 13 / 255, blue: 29 / 255)
    var teaColor = Color(red: 226 / 255, green: 194 / 255, blue: 0 / 255)
    var waterColor = Color(red: 248 / 255, green: 241 / 255, blue: 247 / 255)
    var orangeColor = Color(red: 255 / 255, green: 202 / 255, blue: 0 / 255)
    var fantaColor = Color(red: 135 / 255, green: 0 / 255, blue: 18 / 255)
    var colaLabelColor = Color(red: 186 / 255, green: 0 / 255, blue: 26 / 255)
    var teaLabelColor = Color(red: 29 / 255, green: 157 / 255, blue: 26 / 255)
    var orangeLabelColor = Color(red: 255 / 255, green: 142 / 255, blue: 0 / 255)
    var waterLabelColor = Color(red: 152 / 255, green: 220 / 255, blue: 245 / 255)
    var energyLabelColor = Color(red: 204 / 255, green: 0 / 255, blue: 38 / 255)
    var fantaLabelColor = Color(red: 176 / 255, green: 0 / 255, blue: 98 / 255)


    func start() {
        self.timer?.invalidate()
        self.count = 0
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            _ in
            self.count += 1
            print(self.count)
        }
    }

    func order(myMoney: Double, price: Double, drinkName: String, index: Int) -> Double {
        var moneyLeft = 0.0
        var average = 0

        if (myMoney >= price) {
            let b = Int.random(in: 0 ... 4)
            if (b == 1) {
                self.disaster = true
            }


            if (self.disaster) {
                start()
                self.rotation = [10, 30, 20, -20, 10, 40, 30, 10, 50, 20]
                self.drinkBought = ["Cola", "Fanta", "Water", "Apple", "Tea", "Water", "Orange", "Water", "Fanta",]
                self.drinkBought2 = ["a", "Cola", "Fanta", "Water", "Apple", "Tea", "Water", "Orange", "Water", "Fanta",]
            }
            self.stocks[index] = self.stocks[index] - 1
            moneyLeft = myMoney - price

            if (drinkBought.count > 1) {
                average = ((drinkBought.count - 1) / 2) + 1

            } else {
                average = ((drinkBought.count - 1) / 2)

            }
            self.rotation.insert(Double(Int.random(in: -50..<50)), at: average)
            self.drinkBought.insert(drinkName, at: average)
            self.drinkBought2.insert(drinkName, at: average)
        } else {
            moneyLeft = myMoney
        }
        return moneyLeft
    }

    fileprivate func extractedFunc(color: Color, nameDrink: String, index: Int, type: Int, labelColor: Color) -> some View {
        return VStack {
            if (type == 1) {
                drinkPlastic(capColor: color, drinkColor: color, type: 0, labelColor: labelColor)
            }
            Text(nameDrink)
                .font(.system(size: 13))
                .foregroundColor(.black)



            if (self.stocks[index] <= 0) {
                Button(action: {
                }) {
                    Text("Sold Out")
                        .foregroundColor(.white)
                        .font(.system(size: 8))
                        .frame(width: 40, height: 12, alignment: .center)
                        .background(Color.red)
                        .cornerRadius(5)
                }
            } else {
                if (self.disaster) {
                    Button(action: {
                    }) {
                        Text("Sold Out")
                            .foregroundColor(.white)
                            .font(.system(size: 8))
                            .frame(width: 40, height: 12, alignment: .center)
                            .background(Color.red)
                            .cornerRadius(5)
                    }
                } else {
                    Button(action: {
                        if (self.drinkBought.count < 8) {
                            self.myMoney = self.order(myMoney: self.myMoney, price: self.prices[index], drinkName: nameDrink, index: index)
                        }
                    }) {
                        Text("Buy $\(String(format: "%.1f", self.prices[index]))")
                            .foregroundColor(.black)
                            .font(.system(size: 8))
                            .frame(width: 40, height: 12, alignment: .center)
                            .background(Color(red: 168, green: 232, blue: 100))
                            .cornerRadius(5)
                    }
                }
            }
        }
    }

    fileprivate func eachDrinkWhenBought(num: Int, drinkName: String, color: Color, labelColor: Color) -> some View {
        return String(self.drinkBought2[num]) == drinkName ?
        drinkPlastic(capColor: color, drinkColor: color, type: 0, labelColor: labelColor)
            :
            drinkPlastic(capColor: color, drinkColor: color, type: 1, labelColor: labelColor)

    }

    fileprivate func drinkPlastic(capColor: Color, drinkColor: Color, type: Int, labelColor: Color) -> some View {
        return
        ZStack (alignment: .bottom) {
            capColor
                .frame(width:
                        type == 1 ? 0:
                        8, height:
                        type == 1 ? 0:
                        45, alignment: .topLeading)
                .cornerRadius(2)
                .padding(.bottom,
                    type == 1 ? 0:
                        15)
            Ellipse()
                .fill(Color.white)
                .frame(width:
                        type == 1 ? 0:
                        24, height:
                        type == 1 ? 0:
                        45)
                .padding(.bottom,
                    type == 1 ? 0:
                        60)
                .frame(width:
                        type == 1 ? 0:
                        27, height:
                        type == 1 ? 0:
                        5)
            drinkColor
                .frame(width:
                        type == 1 ? 0:
                        24, height:
                        type == 1 ? 0:
                        41, alignment: .topLeading)
                .cornerRadius(4)
                .padding(.bottom, 0)

            drinkColor
                .frame(width:
                        type == 1 ? 0:
                        24, height:
                        type == 1 ? 0:
                        45, alignment: .topLeading)
                .cornerRadius(7)
            labelColor .frame(width:
                    type == 1 ? 0:
                    24, height:
                    type == 1 ? 0:
                    15, alignment: .topLeading)
                .padding(.bottom, 21.0)

        }
    }


    fileprivate func drinkCan(drinkColor: Color) -> some View {
        return drinkColor
            .frame(width: 30, height: 55, alignment: .topLeading)
            .cornerRadius(5)
    }

    var body: some View {

        return VStack {
            VStack {

                VStack(alignment: .center, spacing: 10) {

                    HStack(spacing: 24) {
                        extractedFunc(color: self.colaColor, nameDrink: "Cola", index: 0, type: 1, labelColor: self.colaLabelColor)
                        extractedFunc(color: self.colaColor, nameDrink: "Cola", index: 1, type: 1, labelColor: self.colaLabelColor)
                        extractedFunc(color: self.teaColor, nameDrink: "Tea", index: 2, type: 1, labelColor: self.teaLabelColor)

                        extractedFunc(color: self.orangeColor, nameDrink: "Orange", index: 3, type: 1, labelColor: self.orangeLabelColor)
                        extractedFunc(color: self.waterColor, nameDrink: "Water", index: 4, type: 1, labelColor: self.waterLabelColor)

                    }
                        .padding([.top, .leading, .trailing], 4.0)
                    Divider()
                    HStack(spacing: 24) {
                        extractedFunc(color: Color.blue, nameDrink: "Energy", index: 5, type: 1, labelColor: self.energyLabelColor)
                        extractedFunc(color: self.fantaColor
                            , nameDrink: "Fanta", index: 6, type: 1, labelColor: self.fantaLabelColor)
                        extractedFunc(color: Color.yellow, nameDrink: "Apple", index: 7, type: 1, labelColor: self.orangeLabelColor)
                        extractedFunc(color: self.orangeColor, nameDrink: "Orange", index: 8, type: 1, labelColor: self.orangeLabelColor)
                        extractedFunc(color: self.waterColor, nameDrink: "Water", index: 9, type: 1, labelColor: self.waterLabelColor)
                    }
                        .padding([.leading, .bottom, .trailing], 4.0)
                }
                    .frame(height: 240.0)
                    .frame(maxWidth: .infinity)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(6)

                    .padding()

                HStack {
                    Spacer()
                    Text("Emergency")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(
                            self.count % 2 == 0 ?
                            Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)
                                :
                                Color(red: 255 / 255, green: 95 / 255, blue: 105 / 255)
                        )

                        .frame(width: 92, height: 18, alignment: .center)
                        .background(
                            !self.disaster ? Color(red: 248 / 255, green: 234 / 255, blue: 0 / 255).opacity(0.3)
                                :
                                Color(red: 248 / 255, green: 234 / 255, blue: 0 / 255)
                        )
                        .cornerRadius(1)
                }
                    .padding(.trailing, 21.0)

                Divider()
                HStack() {
                    VStack(alignment: .trailing) {
                        VStack {
//                            LinearGradient(gradient: Gradient(colors: [waterLabelColor, Color(red: 123 / 255, green: 218 / 255, blue: 239 / 255)]),
                            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.yellow]), startPoint: .top,
                                endPoint: .bottom)
                                .mask(Text("          Disaster Rescue Vending Machine")
                                        .fontWeight(.heavy)
                                        .italic().padding(.bottom, 16.0)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                    .font(.custom("Rockwell", size: 25)).multilineTextAlignment(.leading))
                        }


//                        Text("        Disaster Rescue Vending Machine")
//                            .font(.custom("Rockwell", size: 25))
//                            .fontWeight(.bold)
//                            .italic()
//                            .padding(.bottom, 15.0)
                    }
                        .background(Color.red)
                        .frame(width: 161.0, height: 144.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.black, lineWidth: 0.4)
                        )
                    Spacer()
                    VStack(alignment: .trailing) {
                        HStack {
                            Text(
                                self.myMoney <= 0 ? "":
                                    "$\(String(format: "%.1f", self.myMoney))"
                            )
                                .font(.system(size: 10))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .padding(.bottom, 5.0)
                            Button(action: {
                                self.myMoney = 0
                            }) {
                                Text("Return")
                                    .foregroundColor(.black)
                                    .font(.system(size: 10))
                                    .frame(width: 42, height: 15, alignment: .center)
                                    .background(Color.yellow.opacity(0.6))
                                    .cornerRadius(5)
                                    .padding(.bottom, 6.0)
                            }
                        }



                        VStack {
                            Text("")
                        } .frame(height: 55)
                            .frame(maxWidth: 70)
                            .background(Color.black.opacity(0.6))
                            .cornerRadius(8)
                    }
                }
                    .padding(EdgeInsets(top: 70, leading: 20, bottom: 0, trailing: 20))
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: 100)

                Spacer()
                Group {
                    HStack() {
                        ForEach(0 ... self.drinkBought.count, id: \.self) { num in
                            Group {
                                if 1 > 0 {
                                    VStack {
                                        ZStack {
                                            self.eachDrinkWhenBought(num: num, drinkName: "Cola", color: self.colaColor, labelColor: self.colaLabelColor)
                                            self.eachDrinkWhenBought(num: num, drinkName: "Fanta", color: self.fantaColor, labelColor: self.fantaLabelColor)

                                            self.eachDrinkWhenBought(num: num, drinkName: "Orange", color: self.orangeColor, labelColor: self.orangeLabelColor)
                                            self.eachDrinkWhenBought(num: num, drinkName: "Water", color: self.waterColor, labelColor: self.waterLabelColor)
                                            self.eachDrinkWhenBought(num: num, drinkName: "Energy", color: Color.blue, labelColor: Color.red)
                                            self.eachDrinkWhenBought(num: num, drinkName: "Apple", color: Color.yellow, labelColor: self.orangeLabelColor)
                                            self.eachDrinkWhenBought(num: num, drinkName: "Tea", color: self.teaColor, labelColor: self.teaLabelColor)
                                        }
                                            .rotationEffect(.degrees(Double(self.rotation[num])))
                                    }
                                } else {
                                }
                            }
                        }
                    } .frame(height: 50)
                        .frame(width: 320)
                        .background(Color.black.opacity(0.6))
                        .cornerRadius(8)
                        .padding()
                }

            }.frame(width: 350, height: 550, alignment:
                    .topLeading)
                .background(Color.red)
                .cornerRadius(8)
            HStack {
              

                Button(action: {
                    self.myMoney = self.myMoney + 1.0
                    print(self.myMoney)
                }) {
                     VStack(alignment: .trailing) {
                                      ZStack{
                                          Ellipse()
                                                                                     .fill(Color.black.opacity(0.4)) .frame(height: 15)
                                                                                     .frame(width: 11)
                                          .padding(.trailing, 51.0)
                                                                    .padding(.bottom, 12.0)
                                          Text("1")
                                              .foregroundColor(.white)
                                               .font(.custom("Rockwell", size: 13))
                                              .fontWeight(.heavy)
                                                                               .italic()
                                              .multilineTextAlignment(.leading)
                                              .padding(.trailing, 52.0)
                                              .padding(.bottom, 8.0)
                                          VStack (alignment: .center){
                                              Spacer()
                                            
                                              Ellipse()
                                                  
                                                                                          .fill(Color.black.opacity(0.4)) .frame(height: 21)
                                                                                          .frame(width: 17)
                                                  .padding(.bottom, 2.0)
                                          
                                        
                                      }

                                          .frame(height: 35)
                                          .frame(width: 70)
                                      .border(Color.black.opacity(0.2), width: 3)
                                                        .cornerRadius(2)
                                    Text("Money")                .foregroundColor(.black)                  .padding(.bottom, 20.0)

                                                                  .font(.custom("Rockwell", size: 10))
                                                                  .padding(.top, 0)
                                      Text("$").foregroundColor(.white)
                                          .font(.system(size: 15))
                                          .padding(.top, 9.0)
                                                          }
                                                          .frame(height: 15)
                                  }
                                      

                                      .frame(height: 40)
                                      .frame(width: 75)
                                      .background(Color(red: 238 / 255, green: 233 / 255, blue: 171 / 255))
                                      .border(Color.black.opacity(0.2), width: 1)
                                      .cornerRadius(2)
                }
        
                Button(action: {
                    self.myMoney = self.myMoney + 5.0
                    print(self.myMoney)
                }) {
                     VStack(alignment: .trailing) {
                                                         ZStack{
                                                             Ellipse()
                                                                                                        .fill(Color.black.opacity(0.4)) .frame(height: 15)
                                                                                                        .frame(width: 11)
                                                             .padding(.trailing, 51.0)
                                                                                       .padding(.bottom, 12.0)
                                                             Text("5")
                                                                 .foregroundColor(.white)
                                                                  .font(.custom("Rockwell", size: 13))
                                                                 .fontWeight(.heavy)
                                                                                                  .italic()
                                                                 .multilineTextAlignment(.leading)
                                                                 .padding(.trailing, 52.0)
                                                                 .padding(.bottom, 8.0)
                                                             VStack (alignment: .center){
                                                                 Spacer()
                                                               
                                                                 Ellipse()
                                                                     
                                                                                                             .fill(Color.black.opacity(0.4)) .frame(height: 21)
                                                                                                             .frame(width: 17)
                                                                     .padding(.bottom, 2.0)
                                                             
                                                           
                                                         }

                                                             .frame(height: 35)
                                                             .frame(width: 70)
                                                         .border(Color.black.opacity(0.2), width: 3)
                                                                           .cornerRadius(2)
                                                       Text("Money")                .foregroundColor(.black)                  .padding(.bottom, 20.0)

                                                                                     .font(.custom("Rockwell", size: 10))
                                                                                     .padding(.top, 0)
                                                         Text("$").foregroundColor(.white)
                                                             .font(.system(size: 15))
                                                             .padding(.top, 9.0)
                                                                             }
                                                                             .frame(height: 15)
                                                     }
                                                         

                                                         .frame(height: 40)
                                                         .frame(width: 75)
                                                         .background(Color(red: 238 / 255, green: 233 / 255, blue: 171 / 255))
                                                         .border(Color.black.opacity(0.2), width: 1)
                                                         .cornerRadius(2)
                }
            }
        }

    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




//
//PlaygroundPage.current.liveView = UIHostingController(rootView: ContentView())
