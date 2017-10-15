# Kinsey's SM-808
![alt text](https://i.pinimg.com/736x/94/8e/f9/948ef9b734ccb0a43252406f5b6ea2db--bono-quotes-music-quotes.jpg)

## To Run:
- Please pull down this repo. If you have never done that before, that is totally fine! You can follow this link to step by step instructions https://help.github.com/articles/cloning-a-repository/. 
- Install Rainbow so you can see the song play in my favorite color with `gem install 'rainbow'`.
- Running the command `ruby sm-808.rb` will start up the app for you.
- Follow instructions within the program.

## Specs:
To run specs, type `rspec`. 

## Notes:
- A user can enter three patterns and three different sounds. They are, then, made into a song and added to the song library. You can play that song and it will print each note in the song at the BPM that the user specified.
- This took me about 2 hours all together to implement, but see 'What Did Not Go Well' for more details on why.

### What Went Well:
- Valuing the user input
- Had a GREAT time doing it :)
- Readability. I tried to keep things as simple as possible and highly readable for other developers. There is still room for improvement, though.

### What Did Not Go Well:
- Finding the time to sit down and do it between work, mentoring, & preparing my keynote. I did it in chunks, so it was hard to keep jumping back in. It would have been easier to do it all in one sitting and would have taken less time.
- It is hard coded to only work with 3 patterns, which is bothering me.

### The Future:
- Add validations. Right now, there are no validations if you enter something wrong. ie.(throwing an error if the user inputs anything other than 8 counts, not one of the available sounds, bpm is invalid)
- Creating sounds to choose from. I would love to prompt the user with a submenu screen to pick a sound from a list, vs. having them type it into the command line.
- Adding actual music to play, instead of just printing to the screen.
- Working with more than 3 patterns. Right now, it is hard coded to only work with 3 patterns. I would love to have it accept an infinite number of patterns and be able to play it!
- Being able to store songs within a database.

