# Mouse multitouch
Bash script to emulate multitouch mouse click. Usefull as Minecraft hack.

## Requirements
- Linux system with:
  - [Bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell)) interpreter.
  - [xdotool](https://www.semicomplete.com/projects/xdotool/).
  - xinput program.

## Usage
```
multitouch <delay> <cant> [<button>] [<act_button>] 
```
- `<delay>`: delay between clicks in ms.
- `<cant>`: number of clicks.
- `<button>`: mouse click button. Default left button.
- `<act_button>`: activation mouse button. Default middle button.

Mouse buttons are referenced by numbers: left mouse is 1, middle is 2, right is 3, wheel up is 4, wheel down is 5. 


### Example
```sh
./multitouch 10 100 1 2
```
When press middle button, left button 1 is clicked 100 times in a second.
