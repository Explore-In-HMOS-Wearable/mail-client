@Component
export struct SearchBar {
  @State query: string = ''

  build() {
    Row() {
      Image($r('app.media.icon_search'))
        .width(18)
        .height(18)
        .margin({ right: 8 })

      TextInput({ placeholder: 'Search' })
        .fontSize(12)
        .placeholderColor('#8E8E93')
        .fontColor(Color.White)
        .backgroundColor(Color.Transparent)
        .padding(0)
        .layoutWeight(1)
    }
    .width('80%')
    .padding({ left: 12, right: 12, top: 10, bottom: 10 })
    .borderRadius(16)
    .backgroundColor('#242426')
    .margin({ top: 10, bottom: 10 })
  }
}