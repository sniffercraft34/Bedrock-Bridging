# Enable trigger command
scoreboard players enable @a bedrock_bridging

# Show the message and toggle between on and off
tellraw @a[scores={bedrock_bridging=3}] [{"text":"Bedrock Bridging: "},{"text":"OFF","color":"red"}]
tellraw @a[scores={bedrock_bridging=0}] [{"text":"Bedrock Bridging: "},{"text":"ON","color":"green"}]

# Wrap invalid scores
scoreboard players set @a[scores={bedrock_bridging=3..}] bedrock_bridging 1

# Toggle between ON (2) and OFF (1)
scoreboard players set @a[scores={bedrock_bridging=0}] bedrock_bridging 2
scoreboard players set @a[scores={bedrock_bridging=3}] bedrock_bridging 1

# Place structure voids
# These act as outlines because they can be overidden by other blocks and don't have collisions
execute as @a[scores={bedrock_bridging=2},x_rotation=50..90] at @s unless block ~ ~-1 ~ #bedrock_bridging:void_replaceable run fill ~ ~-1 ~-1 ~ ~-1 ~1 minecraft:structure_void replace #bedrock_bridging:void_replaceable
execute as @a[scores={bedrock_bridging=2},x_rotation=50..90] at @s unless block ~ ~-1 ~ #bedrock_bridging:void_replaceable run fill ~1 ~-1 ~ ~-1 ~-1 ~ minecraft:structure_void replace #bedrock_bridging:void_replaceable

# Replace structure voids when not needed to stop lag and bugs
execute as @a at @s unless entity @s[x_rotation=50..90] unless entity @e[type=player,distance=0.5..3.5,x_rotation=50..90] run fill ~3 ~3 ~3 ~-3 ~-3 ~-3 minecraft:air replace minecraft:structure_void