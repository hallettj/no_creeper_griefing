# Tag a player if they get close enough to a creeper to cause it to explode.
execute as @a[gamemode=survival,tag=!nearCreeper] at @s if entity @e[type=minecraft:creeper,distance=..4,limit=1] run tag @s add nearCreeper

# Untag a tagged player if they are far enough from any creeper to guarantee
# that the creeper they were previously close to either has already exploded, or
# is not going to.
execute as @a[tag=nearCreeper] at @s unless entity @e[type=minecraft:creeper,distance=..25,limit=1] run tag @s remove nearCreeper

# Disable mobGriefing as long as there is a player with the "nearCreeper" tag.
execute if entity @a[tag=nearCreeper] run gamerule mobGriefing false
execute unless entity @a[tag=nearCreeper] run gamerule mobGriefing true
