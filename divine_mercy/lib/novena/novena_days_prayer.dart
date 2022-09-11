class DMNovenaDays {
  static final int max = 9;

  DMNovenaDays() {}

  // int getLanguage() {
  //   return DMSettings.LANG_ENGLISH;
  // }

  int getNextIndex(int idx) {
    return idx + 1;
  }

  int getPreviousIndex(int idx) {
    return idx - 1;
  }

  static String getIntroduction(int idx) {
    String message = "Not Found";
    switch (idx) {
      case 1:
        message =
            "For the first day of the Divine Mercy novena, Christ asked Saint Faustina to pray for the sake of all mankind, especially sinners. She recorded the following words of Our Lord in her diary: \"Today bring to Me <b>all mankind</b>, especially all sinners, and immerse them in the ocean of My mercy. In this way you will console Me in the bitter grief into which the loss of souls plunges Me.\"";
        break;
      case 2:
        message =
            "For the second day, Christ asked Saint Faustina to pray for the sake of priests, monks, and nuns. She recorded the following words of Our Lord in her diary: \"Today bring to Me the Souls of <b>Priests and Religious</b>, and immerse them in My unfathomable mercy. It was they who gave me strength to endure My bitter Passion. Through them as through channels My mercy flows out upon mankind.\"";
        break;
      case 3:
        message =
            "For the third day, Christ asked Saint Faustina to pray for the sake of all the faithful. She recorded the following words of Our Lord in her diary: \"Today bring to Me <b>all Devout and Faithful Souls</b>, and immerse them in the ocean of My mercy. These souls brought me consolation on the Way of the Cross. They were a drop of consolation in the midst of an ocean of bitterness.\"";
        break;
      case 4:
        message =
            "For the fourth day, Christ asked Saint Faustina to pray for the sake of all those who do not believe in God and those who do not know Christ. She recorded the following words of Our Lord in her diary: \"Today bring to Me <b>those who do not believe in God and those who do not know Me</b>, I was thinking also of them during My bitter Passion, and their future zeal comforted My Heart. Immerse them in the ocean of My mercy.\"";
        break;
      case 5:
        message =
            "For the fifth day, Christ asked Saint Faustina to pray for the sake of all those who, while Christians, have separated themselves from the Roman Catholic Church. She recorded the following words of Our Lord in her diary: \"Today bring to Me the Souls of <b>those who have separated themselves from My Church</b>, and immerse them in the ocean of My mercy. During My bitter Passion they tore at My Body and Heart, that is, My Church. As they return to unity with the Church My wounds heal and in this way they alleviate My Passion.\"";
        break;
      case 6:
        message =
            "For the sixth day, Christ asked Saint Faustina to pray for the sake of all little children and the meek and humble. She recorded the following words of Our Lord in her diary: \"Today bring to Me the Meek and Humble Souls and the Souls of <b>Little Children</b>, and immerse them in My mercy. These souls most closely resemble My Heart. They strengthened Me during My bitter agony. I saw them as earthly Angels, who will keep vigil at My altars. I pour out upon them whole torrents of grace. I favor humble souls with My confidence.\"";
        break;
      case 7:
        message =
            "For the seventh day, Christ asked Saint Faustina to pray for the sake of all those most devoted to His mercy. She recorded the following words of Our Lord in her diary: \"Today bring to Me the Souls <b>who especially venerate and glorify My Mercy</b>, and immerse them in My mercy. These souls sorrowed most over my Passion and entered most deeply into My spirit. They are living images of My Compassionate Heart. These souls will shine with a special brightness in the next life. Not one of them will go into the fire of hell. I shall particularly defend each one of them at the hour of death.\"";
        break;
      case 8:
        message =
            "For the eighth day, Saint Faustina recorded these words of Christ: \"Today bring to Me the Souls <b>who are in the prison of Purgatory</b>, and immerse them in the abyss of My mercy. Let the torrents of My Blood cool down their scorching flames. All these souls are greatly loved by Me. They are making retribution to My justice. It is in your power to bring them relief. Draw all the indulgences from the treasury of My Church and offer them on their behalf. Oh, if you only knew the torments they suffer, you would continually offer for them the alms of the spirit and pay off their debt to My justice.\"";
        break;
      case 9:
        message =
            "For the ninth day, Christ asked Saint Faustina to pray for the sake of all the souls who have become lukewarm in their belief. She recorded the following words of Our Lord in her diary: \"Today bring to Me the Souls <b>who have become Lukewarm</b>, and immerse them in the abyss of My mercy. These souls wound My Heart most painfully. My soul suffered the most dreadful loathing in the Garden of Olives because of lukewarm souls. They were the reason I cried out: 'Father, take this cup away from Me, if it be Your will.' For them, the last hope of salvation is to run to My mercy.\"";
        break;
    }
    return message;
  }

  static String getPrayerToJesus(int idx) {
    String message = "Not Found";
    switch (idx) {
      case 1:
        message =
            "Most Merciful Jesus, whose very nature it is to have compassion on us and to forgive us, do not look upon our sins but upon our trust which we place in Your infinite goodness. Receive us all into the abode of Your Most Compassionate Heart, and never let us escape from It. We beg this of You by Your love which unites You to the Father and the Holy Spirit.";
        break;
      case 2:
        message =
            "Most Merciful Jesus, from whom comes all that is good, increase Your grace in men and women consecrated to Your service, that they may perform worthy works of mercy; and that all who see them may glorify the Father of Mercy who is in heaven.";
        break;
      case 3:
        message =
            "Most Merciful Jesus, from the treasury of Your mercy, You impart Your graces in great abundance to each and all. Receive us into the abode of Your Most Compassionate Heart and never let us escape from It. We beg this grace of You by that most wondrous love for the heavenly Father with which Your Heart burns so fiercely.";
        break;
      case 4:
        message =
            "Most compassionate Jesus, You are the Light of the whole world. Receive into the abode of Your Most Compassionate Heart the souls of those who do not believe in God and of those who as yet do not know You. Let the rays of Your grace enlighten them that they, too, together with us, may extol Your wonderful mercy; and do not let them escape from the abode which is Your Most Compassionate Heart.";
        break;
      case 5:
        message =
            "Most Merciful Jesus, Goodness Itself, You do not refuse light to those who seek it of You. Receive into the abode of Your Most Compassionate Heart the souls of those who have separated themselves from Your Church. Draw them by Your light into the unity of the Church, and do not let them escape from the abode of Your Most Compassionate Heart; but bring it about that they, too, come to glorify the generosity of Your mercy.";
        break;
      case 6:
        message =
            "Most Merciful Jesus, You yourself have said, \"Learn from Me for I am meek and humble of heart.\" Receive into the abode of Your Most Compassionate Heart all meek and humble souls and the souls of little children. These souls send all heaven into ecstasy and they are the heavenly Father's favorites. They are a sweet-smelling bouquet before the throne of God; God Himself takes delight in their fragrance. These souls have a permanent abode in Your Most Compassionate Heart, O Jesus, and they unceasingly sing out a hymn of love and mercy.";
        break;
      case 7:
        message =
            "Most Merciful Jesus, whose Heart is Love Itself, receive into the abode of Your Most Compassionate Heart the souls of those who particularly extol and venerate the greatness of Your mercy. These souls are mighty with the very power of God Himself. In the midst of all afflictions and adversities they go forward, confident of Your mercy; and united to You, O Jesus, they carry all mankind on their shoulders. These souls will not be judged severely, but Your mercy will embrace them as they depart from this life.";
        break;
      case 8:
        message =
            "Most Merciful Jesus, You Yourself have said that You desire mercy; so I bring into the abode of Your Most Compassionate Heart the souls in Purgatory, souls who are very dear to You, and yet, who must make retribution to Your justice. May the streams of Blood and Water which gushed forth from Your Heart put out the flames of Purgatory, that there, too, the power of Your mercy may be celebrated.";
        break;
      case 9:
        message =
            "Most compassionate Jesus, You are Compassion Itself. I bring lukewarm souls into the abode of Your Most Compassionate Heart. In this fire of Your pure love, let these tepid souls who, like corpses, filled You with such deep loathing, be once again set aflame. O Most Compassionate Jesus, exercise the omnipotence of Your mercy and draw them into the very ardor of Your love, and bestow upon them the gift of holy love, for nothing is beyond Your power.";
        break;
    }
    return message;
  }

  static String getPrayerToTheFather(int idx) {
    String message = "Not Found";
    switch (idx) {
      case 1:
        message =
            "Eternal Father, turn Your merciful gaze upon all mankind and especially upon poor sinners, all enfolded in the Most Compassionate Heart of Jesus. For the sake of His sorrowful Passion show us Your mercy, that we may praise the omnipotence of Your mercy for ever and ever. Amen.";
        break;
      case 2:
        message =
            "Eternal Father, turn Your merciful gaze upon the company of chosen ones in Your vineyard—upon the souls of priests and religious; and endow them with the strength of Your blessing. For the love of the Heart of Your Son in which they are enfolded, impart to them Your power and light, that they may be able to guide others in the way of salvation and with one voice sing praise to Your boundless mercy for ages without end. Amen.";
        break;
      case 3:
        message =
            "Eternal Father, turn Your merciful gaze upon faithful souls, as upon the inheritance of Your Son. For the sake of His sorrowful Passion, grant them Your blessing and surround them with Your constant protection. Thus may they never fail in love or lose the treasure of the holy faith, but rather, with all the hosts of Angels and Saints, may they glorify Your boundless mercy for endless ages. Amen.";
        break;
      case 4:
        message =
            "Eternal Father, turn Your merciful gaze upon the souls of those who do not believe in You, and of those who as yet do not know You, but who are enclosed in the Most Compassionate Heart of Jesus. Draw them to the light of the Gospel. These souls do not know what great happiness it is to love You. Grant that they, too, may extol the generosity of Your mercy for endless ages. Amen.";
        break;
      case 5:
        message =
            "Eternal Father, turn Your merciful gaze upon the souls of those who have separated themselves from Your Son's Church, who have squandered Your blessings and misused Your graces by obstinately persisting in their errors. Do not look upon their errors, but upon the love of Your own Son and upon His bitter Passion, which He underwent for their sake, since they, too, are enclosed in His Most Compassionate Heart. Bring it about that they also may glorify Your great mercy for endless ages. Amen.";
        break;
      case 6:
        message =
            "Eternal Father, turn Your merciful gaze upon meek souls, upon humble souls, and upon little children who are enfolded in the abode which is the Most Compassionate Heart of Jesus. These souls bear the closest resemblance to Your Son. Their fragrance rises from the earth and reaches Your very throne. Father of mercy and of all goodness, I beg You by the love You bear these souls and by the delight You take in them: Bless the whole world, that all souls together may sing out the praises of Your mercy for endless ages. Amen.";
        break;
      case 7:
        message =
            "Eternal Father, turn Your merciful gaze upon the souls who glorify and venerate Your greatest attribute, that of Your fathomless mercy, and who are enclosed in the Most Compassionate Heart of Jesus. These souls are a living Gospel; their hands are full of deeds of mercy, and their hearts, overflowing with joy, sing a canticle of mercy to You, O Most High! I beg You O God: Show them Your mercy according to the hope and trust they have placed in You. Let there be accomplished in them the promise of Jesus, who said to them that during their life, but especially at the hour of death, the souls who will venerate this fathomless mercy of His, He, Himself, will defend as His glory. Amen.";
        break;
      case 8:
        message =
            "Eternal Father, turn Your merciful gaze upon the souls suffering in Purgatory, who are enfolded in the Most Compassionate Heart of Jesus. I beg You, by the sorrowful Passion of Jesus Your Son, and by all the bitterness with which His most sacred Soul was flooded: Manifest Your mercy to the souls who are under Your just scrutiny. Look upon them in no other way but only through the Wounds of Jesus, Your dearly beloved Son; for we firmly believe that there is no limit to Your goodness and compassion. Amen.";
        break;
      case 9:
        message =
            "Eternal Father, turn Your merciful gaze upon lukewarm souls who are nonetheless enfolded in the Most Compassionate Heart of Jesus. Father of Mercy, I beg You by the bitter Passion of Your Son and by His three-hour agony on the Cross: Let them, too, glorify the abyss of Your mercy. Amen.";
        break;
    }
    return message;
  }
}
