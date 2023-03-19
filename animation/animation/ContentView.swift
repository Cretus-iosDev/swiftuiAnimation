
import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader{render in
            ZStack{
                Group{
                    AnimationCircle(radius:1)
                    AnimationCircle(radius:10)
                    AnimationCircle(radius:20)
                    AnimationCircle(radius:30)
                    AnimationCircle(radius:40)
                    AnimationCircle(radius:50)
                    AnimationCircle(radius:60)
                    AnimationCircle(radius:70)
                }
                Group{
                    AnimationCircle(radius:80)
                    AnimationCircle(radius:90)
                    AnimationCircle(radius:100)
                    AnimationCircle(radius:110)
                    AnimationCircle(radius:120)
                    AnimationCircle(radius:130)
                    AnimationCircle(radius:140)
                    AnimationCircle(radius:150)
                }
                Group{
                    AnimationCircle(radius:160)
                    AnimationCircle(radius:170)
                    AnimationCircle(radius:180)
                    AnimationCircle(radius:190)
                    AnimationCircle(radius:200)
                    AnimationCircle(radius:210)
                    AnimationCircle(radius:220)
                    AnimationCircle(radius:230)
                }
                Group{
                    AnimationCircle(radius:240)
                    AnimationCircle(radius:250)
                    AnimationCircle(radius:260)
                    AnimationCircle(radius:270)
                    AnimationCircle(radius:280)
                    AnimationCircle(radius:290)
                    AnimationCircle(radius:300)
                    AnimationCircle(radius:310)
                }
            }
            
            .frame(width: render.size.width, height: render.size.height)
            .background(.white)
            
            Text("Cretus.Dev")
                .font(.system(size:25, weight: .heavy, design: .serif))
                .foregroundColor(.black)
                .lineLimit(1)
                .padding(.leading,65)
                .padding(.top,150)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct AnimationCircle: View {
    @State var isAnimated = false
    @State var radius :CGFloat
    
    var body: some View {
        ZStack{
            Circle()
                .trim(from: 0.5, to: isAnimated ? 1.0 : 0.5)
                .stroke(Color.red,style: StrokeStyle(lineWidth: 3.0))
                .frame(width: radius)
                .rotationEffect(.degrees(90))
            Circle()
                .trim(from: 0.5, to: isAnimated ? 1.0 : 0.5)
                .stroke(Color.cyan,style: StrokeStyle(lineWidth: 3.0))
                .frame(width: radius)
                .rotationEffect(.degrees(270))
                .rotation3DEffect(.degrees(180), axis: (x: 1.0, y: 0.0, z: 0.0))
        }
        .animation(Animation.easeIn(duration: 2).delay(Double(3*Double(radius/310))))
        .onAppear() {
            isAnimated.toggle()
            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) {_ in
                isAnimated.toggle()
            }
        }
    }
}
