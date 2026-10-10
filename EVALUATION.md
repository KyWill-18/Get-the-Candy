# Evaluation 2, Increment 1: 2D Platforming Basics

For this project, I created a 2D platformer where the player controls the pink character and hits piñatas to win the game

## Self-Evaluation
- Move left and right through a 2D platformer world
- A clear gameplay loop where the player navigates the level and destroys piñatas
- A clear win screen with a win message
- A "Play Again?" button that allows the player to restart the game


## Custom Gameplay

The custom gameplay in this project is hitting and destroying piñatas. The player must interact with the piñatas throughout the game, and the HUD keeps track of how many piñatas are left. Destroying all the piñatas completes the level and triggers the win screen.



# Evaluation 2, Increment 2: Juice and Polish

For this increment, I finished my 2D platformer by adding a title screen, music, and sound effects. Also a themed background, a project-wide font, and candy burst effect when a piñata breaks.

## Self-Evaluation

I completed all 3 user stories, so I believe this increment earns an A.

- **Juice:** candy burst when a piñata breaks
- **Theme:** themed art, music, sound effects, and font. There are no
  default fonts or placeholder art
- **HUD:** shows how many piñatas are left

### Juice

When the player hits a piñata, it splits open and a burst of candy shoots out. I added it because it makes each hit feel more rewarding and fits the story: the piñatas stole the kid's candy, so breaking one should send candy flying. The idea came from the "Juice It or Lose It" video, which shows how small effects make a game feel more alive.

I made it with a CPUParticles2D node on each piñata, using the candy sprite as the texture. It is one-shot with an explosiveness of 1.0, so all 15 candies appear at once. A 180 degree spread sends them flying in every direction, and gravity pulls them down in an arc. The piñata starts the burst on frame 1 of the destroy animation, when the piñata looks split open, so the explosion and the candy look like one event. It then waits for the particles to finish before disappearing, so the candy is never cut off and looks like it naturally fades away.

## Revision 0.2.1

This release addresses Professor G's feedback:
- Trimmed the silence from the start of the jump sound
- Fixed Pink Kid's scene warning by moving the transform to the Pink Kid instance in the world scene
- Widened the candy spread and increased the amount
- Made the piñata detect hits instead of Pink Kid detecting them
- Added underscore prefixes to private members
- Converted the music from WAV to OGG
- Synced the candy burst with the explosion animation so they look like one.