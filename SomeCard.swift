
struct SomeCard: View {
    @State var flipped = false
    @State var dragValue = CGSize(width: 0, height: 0)
    var body: some View {
        return ZStack {
            Image("insurance_card_back")  //  <- replace with your image
                .rotationEffect(Angle(degrees: Double(90.0)))  //  90 degrees only because then it disappears
                .rotation3DEffect(Angle(degrees: !flipped ? Double(90) : 180), axis: (  x: 0,y: 1,z: 0))  //  90 degrees only because then it disappears
                .animation(Animation.easeOut(duration: 1).delay(!flipped ? 0 : 0.9))

            Image("insurance_card")  //  <- replace with your image
                .rotationEffect(Angle(degrees: Double(90.0)))  //  90 degrees only because then it disappears
                .rotation3DEffect(Angle(degrees: flipped ? Double(90) : 0), axis: (  x: 0,y: 1,z: 0))  //  90 degrees only because then it disappears
                .animation(Animation.easeIn(duration: 1).delay(flipped ? 0 : 0.9))
        }
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
