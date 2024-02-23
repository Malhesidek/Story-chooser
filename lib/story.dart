class Story {
  String? _storyTitle;
  String? _choice1;
  String? _choice2;

  Story({storyTitle, choice1, choice2}): _storyTitle = storyTitle, _choice1 = choice1, _choice2 = choice2;

  String? getStoryTitle(){
    return this._storyTitle;
  }

  String? getChoice1(){
    return this._choice1;
  }

  String? getChoice2(){
    return this._choice2;
  }
}
