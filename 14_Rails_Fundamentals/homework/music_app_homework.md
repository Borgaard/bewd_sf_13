#Homework: BEWDful Music App:
#Part 1 thru 3 are due Monday ****

##Part 0 - Schema & UX Design

* Think about your design BEFORE you build
* Questions for consideration:
  * What model(s), controller(s) and view(s) are neccessary?
  * What attributes will be needed on each model?
  * What associations are needed?
  * UX Design?

##Part 1 - Song & Artist Feature
Start with 2 models: Song and Artist.  

* Song belongs to artist
* Artist has many songs

A user should be able to:

* View all songs in the database
* View all artists in the database
* View all songs by a particular artist
* Add a new artist
* Add a new song and associate it with an artist
* Edit and Delete songs and artists

##Part 2 - Review Feature
* Add a review model.
* Song `has_many` reviews
* Artist `has_many` reviews
* Review `belongs_to` a song
* Review `belongs_to` an artist


A user should be able to:

* View all reviews for a specific song or artist
* Create a new review for a specific song or artist


##Part 3 - Front End with Bootstrap, Simple Form &  Google Fonts

###Integrate Bootstrap

* [Bootstrap Framework](http://getbootstrap.com/)
* App should have a 'landing page'
* App should have navigation bar that allows users to find artists and songs.
* App should use button and tables from bootstrap library

###Google Fonts

* App should have at least on custom font integrated. Free Fonts are available via google fonts
  * [Google Fonts](https://www.google.com/fonts)  

###Integrate `Simple_Form`

* [Simple Form](https://github.com/plataformatec/simple_form)
* [Review Simple Form Documentation](http://simple-form.plataformatec.com.br)
* Use simple_form within the view layer


##Part 4 - Search, Favorite, Follow Features

 * Add Simple Search (Start simple. Search for an artist OR song NOT both)
 * Add `Favorite` Functionality so that a user can `favorite` artists
 * Add `Follow` functionality (like twitter), so that users can follow their artists


##Part 5 - Authentication Feature
   * Integrate Authentication using devise OR 
   * Add 3rd Party Multi-Authentication using Twitter and/or Google API's


##Part 6 - Spotify API Integration Feature
 * [Spotify for Developers ](https://developer.spotify.com/)
 * [Spotify Api - Ruby Client ](https://github.com/guilhermesad/rspotify)

 * Integrate the Spotify API as a source for artist, album, song and genre data
   -This may require that you rework/rethink the schema and extensive refactoring your app (which is a rite of passage for all developers)
   
##Part 7 - Integrate Email & SMS Messaging
** TBD Added 

#Resources - Mandatory Reading

* [Active Record Basics](http://guides.rubyonrails.org/active_record_basics.html)
* [Active Record Associations](http://guides.rubyonrails.org/association_basics.htm)
* [Active Record Validations](http://guides.rubyonrails.org/active_record_validations.html)
* [Active Record Migrations ](http://guides.rubyonrails.org/active_record_migrations.html)

