
struct SomeCard: View {
    @State var flipped = false
    @State var dragValue = CGSize(width: 0, height: 0)
    var body: some View {
        let gesture = DragGesture()
            .onChanged() { value in
                self.dragValue = value.translation
        }
        .onEnded() { value in
            self.dragValue = CGSize(width: 0, height: 0)
        }
        return ZStack {
            Image("insurance_card_back")  //  <- replace with your image
                .rotationEffect(Angle(degrees: Double(90.0)))
                .rotation3DEffect(Angle(degrees: !flipped ? Double(90) : 180), axis: (  x: 0,y: 1,z: 0))
                .animation(Animation.easeOut(duration: 1).delay(!flipped ? 0 : 0.9))
                .offset(CGSize(width: 0, height: 10))
                .zIndex(!flipped ? 0 : 1)
            Image("insurance_card")  //  <- replace with your image
                .rotationEffect(Angle(degrees: Double(90.0)))
                .rotation3DEffect(Angle(degrees: flipped ? Double(90) : 0), axis: (  x: 0,y: 1,z: 0))
                .animation(Animation.easeIn(duration: 1).delay(flipped ? 0 : 0.9))
            //    .offset(dragValue)
                .zIndex(!flipped ? 1 : 0)
            
        }
           // .rotation3DEffect(Angle(degrees: flipped ? Double(180) : 0), axis: (  x: 0,y: 1,z: 0))
            
        .gesture(gesture)
        .onTapGesture {
            self.flipped.toggle()
        }
    }
}

struct SomeCard_Previews: PreviewProvider {
    static var previews: some View {
        SomeCard()
    }
}
