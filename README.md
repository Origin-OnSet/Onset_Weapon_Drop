# Onset_Weapon_Drop
Simple weapon systeme

## How to install
- Add the ["Onset_Weapon_Patch"](https://github.com/Origin-OnSet/Onset_Weapon_Patch) v1.1 folder to your server packages 

- Edit your server_config.json and add "Onset_Weapon_Drop" in the packages section before the files who need it

```json
"packages": [
  "Onset_Weapon_Patch",
  "Onset_Weapon_Drop"
],
```
- On the files who needs to initialize the Onset_Weapon_Drop using this function  
```lua
local Weapon_Drop = ImportPackage("Onset_Weapon_Drop")
```
After that you should be able to use the built-in functions

## Function
```lua
Create(x, y, z, Weapon_id, Weapon_ammo)
Drop(player)
Get(player, weapon_object)
```

## Package Commands
```
Key F to get weapon
Key G to drop weeapon
```

## Discord
Join Origin [Discord](https://discord.gg/MDEwtKr) server now !

## License
This project is licensed under the [MIT](https://choosealicense.com/licenses/mit/) License
