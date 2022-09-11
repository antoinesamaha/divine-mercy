class Chapelet {
  Chapelet() {}

  static String getTitle(int idx) {
    String message = "Not Found";
    switch (idx) {
      case 1:
        message = "1. Make the Sign of the Cross";
        break;
      case 2:
        message = "2. Optional Opening Prayers";
        break;
      case 3:
        message = "3. Our Father";
        break;
      case 4:
        message = "4. Hail Mary";
        break;
      case 5:
        message = "5. The Apostles’ Creed";
        break;
      case 6:
        message = "6. The Eternal Father";
        break;
      case 7:
        message = "7. On the 10 Small Beads of Each Decade";
        break;
      case 8:
        message = "8. Repeat for the remaining decades";
        break;
      case 9:
        message = "9. Conclude with Holy God (Repeat three times)";
        break;
      case 10:
        message = "10. Optional Closing Prayers";
        break;
    }
    return message;
  }

  static String getText(int idx) {
    String message = "Not Found";
    switch (idx) {
      case 1:
        message =
            "In the name of the Father, and of the Son, and of the Holy Spirit. Amen.";
        break;
      case 2:
        message =
            "St. Faustina’s Prayer for Sinners \nO Jesus, eternal Truth, our Life, I call upon You and I beg Your mercy for poor sinners. O sweetest Heart of my Lord, full of pity and unfathomable mercy, I plead with You for poor sinners. O Most Sacred Heart, Fount of Mercy from which gush forth rays of inconceivable graces upon the entire human race, I beg of You light for poor sinners. O Jesus, be mindful of Your own bitter Passion and do not permit the loss of souls redeemed at so dear a price of Your most precious Blood. O Jesus, when I consider the great price of Your Blood, I rejoice at its immensity, for one drop alone would have been enough for the salvation of all sinners. Although sin is an abyss of wickedness and ingratitude, the price paid for us can never be equalled. Therefore, let every soul trust in the Passion of the Lord, and place its hope in His mercy. God will not deny His mercy to anyone. Heaven and earth may change, but God's mercy will never be exhausted. Oh, what immense joy burns in my heart when I contemplate Your incomprehensible goodness, O Jesus! I desire to bring all sinners to Your feet that they may glorify Your mercy throughout endless ages (Diary of Saint Maria Faustina Kowalska, 72).\n\nYou expired, Jesus, but the source of life gushed forth for souls, and the ocean of mercy opened up for the whole world. O Fount of Life, unfathomable Divine Mercy, envelop the whole world and empty Yourself out upon us.\n\n(Repeat three times)\nO Blood and Water, which gushed forth from the Heart of Jesus as a fount of mercy for us, I trust in You!";
        break;
      case 3:
        message =
            "Our Father, Who art in heaven, hallowed be Thy name; Thy kingdom come; Thy will be done on earth as it is in heaven. Give us this day our daily bread; and forgive us our trespasses as we forgive those who trespass against us; and lead us not into temptation, but deliver us from evil, Amen.";
        break;
      case 4:
        message =
            "Hail Mary, full of grace. The Lord is with thee. Blessed art thou amongst women, and blessed is the fruit of thy womb, Jesus. Holy Mary, Mother of God, pray for us sinners, now and at the hour of our death, Amen.";
        break;
      case 5:
        message =
            "I believe in God, the Father almighty, Creator of heaven and earth, and in Jesus Christ, His only Son, our Lord, who was conceived by the Holy Spirit, born of the Virgin Mary, suffered under Pontius Pilate, was crucified, died and was buried; He descended into hell; on the third day He rose again from the dead; He ascended into heaven, and is seated at the right hand of God the Father almighty; from there He will come to judge the living and the dead. I believe in the Holy Spirit, the holy catholic Church, the communion of saints, the forgiveness of sins, the resurrection of the body, and life everlasting. Amen.";
        break;
      case 6:
        message =
            "Eternal Father, I offer you the Body and Blood, Soul and Divinity of Your Dearly Beloved Son, Our Lord, Jesus Christ, in atonement for our sins and those of the whole world.";
        break;
      case 7:
        message =
            "For the sake of His sorrowful Passion, have mercy on us and on the whole world.";
        break;
      case 8:
        message =
            "Saying the \"Eternal Father\" (6) on the \"Our Father\" bead and then 10 \"For the sake of His sorrowful Passion\" (7) on the following \"Hail Mary\" beads.";
        break;
      case 9:
        message =
            "Holy God, Holy Mighty One, Holy Immortal One, have mercy on us and on the whole world.";
        break;
      case 10:
        message =
            "Eternal God, in whom mercy is endless and the treasury of compassion — inexhaustible, look kindly upon us and increase Your mercy in us, that in difficult moments we might not despair nor become despondent, but with great confidence submit ourselves to Your holy will, which is Love and Mercy itself.\n\nO Greatly Merciful God, Infinite Goodness, today all mankind calls out from the abyss of its misery to Your mercy — to Your compassion, O God; and it is with its mighty voice of misery that it cries out. Gracious God, do not reject the prayer of this earth's exiles! O Lord, Goodness beyond our understanding, Who are acquainted with our misery through and through, and know that by our own power we cannot ascend to You, we implore You: anticipate us with Your grace and keep on increasing Your mercy in us, that we may faithfully do Your holy will all through our life and at death's hour. Let the omnipotence of Your mercy shield us from the darts of our salvation’s enemies, that we may with confidence, as Your children, await Your [Son’s] final coming — that day known to You alone. And we expect to obtain everything promised us by Jesus in spite of all our wretchedness. For Jesus is our Hope: through His merciful Heart, as through an open gate, we pass through to heaven (Diary, 1570).";
        break;
    }
    return message;
  }
}
