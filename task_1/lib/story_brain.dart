//-TODO: Step 6 - import the story.dart file into this file.
import 'package:flutter/material.dart';

import 'story.dart';
//-TODO: Step 5 - Create a new class called StoryBrain.
class StoryBrain
{
  
//-TODO: Step 7 - Uncomment the lines below to include storyData as a private property in StoryBrain. Hint: You might need to change something in story.dart to make this work.
List<Story> _storyList = [
    Story(
        storyTitle:
            "story 0",
        choice1: 'Choice 1.',
        choice2: 'Choice 2.'),
    Story(
        storyTitle:
            "story 1",
        choice1: 'Choice 1.',
        choice2: 'Choice 2.'),
    Story(
        storyTitle:
            "story 2",
        choice1: 'Choice 1.',
        choice2: 'Choice 2.'),
    Story(
        storyTitle:
            "story 3",
        choice1: 'Restart',
        choice2: 'Restart'),
    Story(
        storyTitle:
            "story 4",
        choice1: 'Restart',
        choice2: 'Restart'),
    Story(
        storyTitle:
            "story 5",
        choice1: 'Restart',
        choice2: 'Restart'),
  ];
//-TODO: Step 23 - Use the storyNumber property inside getStory(), getChoice1() and getChoice2() so that it gets the updated story and choices rather than always just the first (0th) one.
//-TODO: Step 25 - Change the storyNumber property into a private property so that only story_brain.dart has access to it. You can do this by right clicking on the name (storyNumber) and selecting Refactor -> Rename to make the change across all the places where it's used.
//-TODO: Step 16 - Create a property called storyNumber which starts with a value of 0. This will be used to track which story the user is currently viewing.

int _storyNumber=0;
//-TODO: Step 8 - Create a method called getStory() that returns the first storyTitle from _storyData.
String getStory()
{
  return _storyList[_storyNumber].storyTitle;
}
//-TODO: Step 11 - Create a method called getChoice1() that returns the text for the first choice1 from _storyData.
String getChoice1()
{
return _storyList[_storyNumber].choice1;
}
//-TODO: Step 12 - Create a method called getChoice2() that returns the text for the first choice2 from _storyData.
String getChoice2()
{
return _storyList[_storyNumber].choice2;
}

//-TODO: Step 17 - Create a method called nextStory(), it should not have any outputs but it should have 1 input called choiceNumber which will be the choice number (int) made by the user.
void nextStory(int choiceNumber)
{
if(_storyNumber==0)
{
  if(choiceNumber==1)
  {
    _storyNumber=2;
  }
  else if(choiceNumber==2)
  {
    _storyNumber=1;
  }
}

else if(_storyNumber==1)
{
   if(choiceNumber==1)
  {
    _storyNumber=2;
  }
  else if(choiceNumber==2)
  {
    _storyNumber=3;
  }
}
else if(_storyNumber==2)
{
   if(choiceNumber==1)
  {
    _storyNumber=5;
  }
  else if(choiceNumber==2)
  {
    _storyNumber=4;
  }
}
else if(_storyNumber==3||_storyNumber==4||_storyNumber==5)
{
  Restart();
}

}
//-TODO: Step 20 - Download the story plan here: https://drive.google.com/uc?export=download&id=1KU6EghkO9Hf2hRM0756xFHgNaZyGCou3

//-TODO: Step 21 - Using the story plan, update nextStory() to change the storyNumber depending on the choice made by the user. e.g. if choiceNumber was equal to 1 and the storyNumber is 0, the storyNumber should become 2.

//-TODO: Step 22 - In nextStory() if the storyNumber is equal to 3 or 4 or 5, that means it's the end of the game and it should call a method called restart() that resets the storyNumber to 0.
void Restart()
{
  _storyNumber=0;
}
//-TODO: Step 27 - Create a method called buttonShouldBeVisible() which checks to see if storyNumber is 0 or 1 or 2 (when both buttons should show choices) and return true if that is the case, else it should return false.
bool buttonShouldBeVisible()
{
  if(_storyNumber==0|| _storyNumber==1||_storyNumber==2)
  {
    return true;
  }

  else 
  {
    return false;
  }
}

}