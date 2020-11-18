# NYTimesArticles

## About App
App displays the popular articles from The New York Times. Once the app is opened then all the popular articles are shown. User then can select one article and further can see the details of that particular article by tapping one on list of articles. There are 2 screens in the app namely -:
i) Article List Screen
ii) Article Details Screen

```

## AppFlow
- First screen displays all the articles.

- User can tap on any article to see it's details.

- User can see the details of the articles on the details page.


## ProjectFilesStructure
  #### ``MainFiles``
   i) AppDelegate  ii) SceneDelegate -> deciding where to go when the app is launched.  
   #### ``Scenes``
  Contains the 2 Scenes used in the application providing datasource to the UI and mediating the business logic between UI and separate layers.
  #### ``Views`` 
 this contains the tableviewcell components used to display details of articles like title , author, article image and published date .
  #### ``Network``
  contains API Endpoints strings and color constants used in the application.
  #### ``NYTimesTests`` 
  contains Test cases for testing the functionalities used in the application.
  #### ``Resources`` 
  contains images and coredata file.
  






