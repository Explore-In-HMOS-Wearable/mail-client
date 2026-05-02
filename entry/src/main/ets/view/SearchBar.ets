@Component
export struct SearchBar {
  @Link query: string

  build() {
    Row() {
      Image($r('app.media.icon_search'))
        .width(14)
        .height(14)
        .margin({ right: 6 })

      TextInput({
        text: this.query,
        placeholder: $r('app.string.search_placeholder')
      })
        .fontSize(12)
        .placeholderColor($r('app.color.search_placeholder_color'))
        .placeholderFont({ size: 10 })
        .fontColor(Color.White)
        .backgroundColor(Color.Transparent)
        .padding(0)
        .layoutWeight(1)
        .height(18)
        .onChange((value: string) => {
          this.query = value
        })
    }
    .width('75%')
    .padding({
      left: 10,
      right: 10,
      top: 6,
      bottom: 6
    })
    .borderRadius(14)
    .backgroundColor($r('app.color.card_background_color'))
    .margin({ bottom: 4 })
  }
}