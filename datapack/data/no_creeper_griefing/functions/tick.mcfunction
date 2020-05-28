# Decrement creeperCountdown every tick while the value is greater than zero.
# This is the countdown that determines when mobGriefing will be re-enabled.
execute if score #creeperCountdown creeperCountdown matches 1.. run scoreboard players remove #creeperCountdown creeperCountdown 1

# Whenever a player is within 3 blocks of a creeper reset creeperCountdown to 60 which
# is the number of ticks it takes a creeper to explode.
execute as @a[gamemode=survival] at @s if entity @e[type=minecraft:creeper,distance=..3,limit=1] run scoreboard players set #creeperCountdown creeperCountdown 60

# If creeperCountdown is still counting down (the value is greater than zero)
# disable mobGriefing. Otherwise re-enable mobGriefing.
execute if score #creeperCountdown creeperCountdown matches 1.. run gamerule mobGriefing false
execute unless score #creeperCountdown creeperCountdown matches 1.. run gamerule mobGriefing true
