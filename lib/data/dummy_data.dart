List<Map<String, dynamic>> onbardingPages = [
  {
    "image": "assets/images/meal_onboard.png",
    "title-en": "Find Foods You Love",
    "title-ar": "ابحث عن الأطعمة التي تحبها",
    "sub_title-ar":
        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet ",
    "sub_title-en":
        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet "
  },
  {
    "image": "assets/images/bike_onboard.png",
    "title-en": "Fast Delivery",
    "title-ar": "توصيل سريع",
    "sub_title-ar":
        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet ",
    "sub_title-en":
        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet "
  },
  {
    "image": "assets/images/phone_onboard.png",
    "title-ar": "التتبع المباشر",
    "title-en": "Live Tracking",
    "sub_title-ar":
        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet ",
    "sub_title-en":
        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet "
  },
];

List<Map<String, dynamic>> DUMMY_CATEGORIES = [
  {
    "id": "c1",
    "image": "assets/images/gift.png",
    "title-ar": "هدايا",
    "title-en": "Gifts",
  },
  {
    "id": "c2",
    "image": "assets/images/ice_cream.png",
    "title-ar": "مثلجات",
    "title-en": "ice cream",
  },
  {
    "id": "c3",
    "image": "assets/images/juice.png",
    "title-ar": "عصائر",
    "title-en": "Juice",
  },
  {
    "id": "c4",
    "image": "assets/images/cake.png",
    "title-ar": "معجنات",
    "title-en": "cake",
  },
];

List<Map<String, dynamic>> DUMMY_PRODUCTS = [
  {
    "id": "a1",
    "image": "assets/images/sweet_one.png",
    "title-ar": "ألوجبة الاولة",
    "title-en": "meal one",
    "subtitle-ar": "راوند مطهي سريع وسهل.",
    "subtitle-en": "Quick and easy stewed rhubarb.",
    "rating": 4.2,
    "category": [
      "c1",
      "c2",
    ],
    "isfavorit": false,
    "price": 10,
  },
  {
    "id": "a2",
    "image": "assets/images/sweet_two.png",
    "title-ar": "ألوجبة الثانية",
    "title-en": "meal two",
    "subtitle-ar": "طعام الشتاء ",
    "subtitle-en": "winter food.",
    "rating": 2,
    "category": [
      "c1",
      "c2",
      "c3",
    ],
    "isfavorit": false,
    "price": 16,
  },
  {
    "id": "a3",
    "image": "assets/images/sweet_three.png",
    "title-ar": "ألوجبة الثالثة",
    "title-en": "meal three",
    "subtitle-ar":
        "كمأة الشوكولاتة المكونة من 4 مكونات تكلف 55 سنتًا فقط لصنع كل منها!",
    "subtitle-en":
        "These 4-ingredient chocolate truffles cost just 55c each to make!",
    "rating": 5,
    "category": [
      "c1",
      "c3",
    ],
    "isfavorit": false,
    "price": 18,
  },
  {
    "id": "a4",
    "image": "assets/images/sweet_four.png",
    "title-ar": "ألوجبة الرابعة",
    "title-en": "meal four",
    "subtitle-ar":
        "باستخدام الشوكولاتة المفضلة لدى الجميع ، تستخدم لقيمات تشيز كيك كراميلك بدون خبز ثلاثة مكونات فقط وتستغرق دقائق فقط في التحضير",
    "subtitle-en":
        "Using everyone's favourite chocolate, these no-bake Caramilk cheesecake bites use just three ingredients and take just minutes to whip up",
    "rating": 2.5,
    "category": [
      "c2",
      "c4",
    ],
    "isfavorit": false,
    "price": 22,
  },
  {
    "id": "a5",
    "image": "assets/images/sweet_five.png",
    "title-ar": "ألوجبة الخامسة",
    "title-en": "meal five",
    "subtitle-ar":
        "للحصول على وجبة لذيذة ، فإن كعكة الجبن كاراميلو سهلة بدون خبز سترضي جميع أفراد الأسرة. مع قشرة بسكويت الشوكولاتة وغطاء كراميل ناز ، ليس من السهل صنعها فحسب ، بل توضع في الثلاجة دون الحاجة إلى تشغيل الفرن",
    "subtitle-en":
        "For a decadent treat, this easy no-bake Caramello cheesecake will please the whole family. With a chocolate biscuit crust and oozing caramel topping, it’s not only easy to make, but sets in the fridge without having to turn the oven on",
    "rating": 3.5,
    "category": [
      "c1",
      "c4",
    ],
    "isfavorit": false,
    "price": 15,
  },
  {
    "id": "a6",
    "image": "assets/images/sweet_six.png",
    "title-ar": "ألوجبة السادسة",
    "title-en": "meal six",
    "subtitle-ar":
        "مصنوعة من 5 مكونات فقط ، كرات بليس الشوكولاتة بدون طهي هي الهدية المثالية الصالحة للأكل في عيد الميلاد.",
    "subtitle-en":
        "Made with just 5 ingredients, these no-cook chocolate bliss balls are the perfect edible gift this Christmas.",
    "rating": 3.7,
    "category": [
      "c3",
      "c4",
    ],
    "isfavorit": false,
    "price": 20,
  },
  {
    "id": "a7",
    "image": "assets/images/sweet_seven.png",
    "title-ar": "ألوجبة السابعة",
    "title-en": "meal seven",
    "subtitle-ar": "Quick and easy stewed rhubarb.",
    "subtitle-en":
        "Made with just 4 ingredients (you probably already own), the kids will love making these super easy chocolate truffles.",
    "rating": 4.4,
    "category": [
      "c3",
      "c1",
    ],
    "isfavorit": false,
    "price": 40,
  },
];
